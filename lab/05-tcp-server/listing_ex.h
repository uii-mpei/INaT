#pragma once

#include <string>
#include <vector>

// Files with names longer than 256 characters
// or larger than 4 GB are discarded with warning message.
struct File {
    std::string name;
    uint32_t size;
};

#ifdef _WIN32

#include <windows.h>

static inline
std::vector<File>
list_files() {
    WIN32_FIND_DATA data;
    HANDLE handle = ::FindFirstFile("./*", &data);
    if (handle == INVALID_HANDLE_VALUE) {
        return {};
    }

    std::vector<File> files;

    do {
        if (data.dwFileAttributes & (FILE_ATTRIBUTE_DIRECTORY | FILE_ATTRIBUTE_HIDDEN)) {
            continue;
        }

        const char* path = data.cFileName;
        if (std::strlen(path) > UINT8_MAX) {
            path = data.cAlternateFileName;
        }

        if (data.nFileSizeHigh > 0) {
            std::fprintf(stderr, "warning: size too large: %s (%llu)\n",
                    path, (uint64_t{data.nFileSizeHigh} << 32) + data.nFileSizeLow);
            continue;
        }

        File file;
        file.name = path;
        file.size = data.nFileSizeLow;
        files.push_back(file);
    } while (::FindNextFile(handle, &data));

    ::CloseHandle(handle);

    return files;
}

#else

#include <dirent.h>
#include <sys/stat.h>
#include <unistd.h>

static inline
std::vector<File>
list_files() {
    auto dir = ::opendir(".");
    if (dir == nullptr) {
        std::fprintf(stderr, "error: opendir()=%d\n", errno);
        return {};
    }

    std::vector<File> files;

    dirent* entry = nullptr;
    while ((entry = ::readdir(dir)) != nullptr) {
        struct stat info;
        if (::stat(entry->d_name, &info) < 0) {
            std::fprintf(stderr, "warning: stat()=%d\n", errno);
            continue;
        }

        if (!(info.st_mode & S_IFREG) || (entry->d_name[0] == '.')) {
            continue;
        }

        const char* path = entry->d_name;
        if (std::strlen(path) > UINT8_MAX) {
            std::fprintf(stderr, "warning: name too long: %s\n", path);
            continue;
        }

        if (info.st_size > UINT32_MAX) {
            std::fprintf(stderr, "warning: size too large: %s (%lu)\n", path, info.st_size);
            continue;
        }

        File file;
        file.name = path;
        file.size = info.st_size;
        files.push_back(file);
    }

    return files;
}

#endif
