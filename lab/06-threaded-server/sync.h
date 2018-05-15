#pragma once

#ifdef _WIN32
#   include <winsock2.h>
#else
#   include <sys/socket.h>
#   include <netinet/in.h>
#   include <arpa/inet.h>
#endif

#include <cstdarg>
#include <cstdio>
#include <iostream>
#include <mutex>
#include <string>
#include <sstream>
#include <thread>

using Mutex = std::mutex;
using Guard = std::lock_guard<Mutex>;

static Mutex g_lock;

static void
log(const char* format, ...) {
    Guard guard{g_lock};

    std::clog << "[" << std::this_thread::get_id() << "] ";

    va_list args;
    va_start(args, format);
    vfprintf(stderr, format, args);
    va_end(args);
}

static std::string
endpoint_to_string(const sockaddr_in& address) {
    Guard guard{g_lock};
    std::ostringstream buffer;
    buffer << ::inet_ntoa(address.sin_addr) << ':' << ::ntohs(address.sin_port);
    return buffer.str();
}
