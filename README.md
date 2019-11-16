# Dockerfile for steschu/stretch-cdebug

This Docker image is intended to be used for C/C++ based projects that use CMake/Ninja for building. It includes the LLVM v10 toolchain as well as tools for static code analysis and profiling.

Items included:

Building
* cmake + ninja
* clang/clang++
* yasm

Static Code Analysis
* clang-tidy, clang-format
* [scan-build](https://clang-analyzer.llvm.org/scan-build.html)
* cppcheck

Profiling
* clang
* valgrind
* [AddressSanitizer](https://clang.llvm.org/docs/AddressSanitizer.html)
