#pragma once

#include <string>
#include <vector>

#ifdef _WIN32

#include <windows.h>

static inline
std::vector<std::string>
list_files() {
    WIN32_FIND_DATA data;
    HANDLE handle = ::FindFirstFile("./*", &data);
    if (handle == INVALID_HANDLE_VALUE) {
        return {};
    }

    std::vector<std::string> files;

    do {
        if (data.dwFileAttributes & (FILE_ATTRIBUTE_DIRECTORY | FILE_ATTRIBUTE_HIDDEN)) {
            continue;
        }

        const char* path = data.cFileName;
        if (std::strlen(path) > UINT8_MAX) {
            path = data.cAlternateFileName;
        }

        files.push_back(path);
    } while (::FindNextFile(handle, &data));

    ::CloseHandle(handle);

    return files;
}

#else

#include <dirent.h>
#include <sys/stat.h>
#include <unistd.h>

static inline
std::vector<std::string>
list_files() {
    auto dir = ::opendir(".");
    if (dir == nullptr) {
        std::fprintf(stderr, "error: opendir()=%d\n", errno);
        return {};
    }

    std::vector<std::string> files;

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
            continue;
        }

        files.push_back(path);
    }

    return files;
}

#endif
