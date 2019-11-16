# Dockerfile for steschu/alpine-clang

This Docker image is intended to be used for CI builds of C/C++ based projects that use CMake for their project description.

The image is based on [steschu/alpine-c](https://github.com/steschu77/docker-alpine-c), a minimal Docker image for building C/C++ projects with CMake. As the name suggests, steschu/alpine-clang extends this image by adding the clang compiler and various other clang related tools such as clang-format and clang-tidy.

The clang compiler addition increases the size of the image significantly, which may be important when used in CI. The Docker image steschu/alpine-clang is twice as large as the base image steschu/alpine-c (291 MB versus 144 MB).
