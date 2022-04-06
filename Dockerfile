FROM debian:bullseye-slim

RUN apt-get update

# System essentials
RUN apt install -y --no-install-recommends wget gnupg apt-transport-https pkg-config lsb-release software-properties-common

RUN wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key | apt-key add -
RUN echo 'deb http://apt.llvm.org/bullseye/ llvm-toolchain-bullseye-14 main\ndeb-src http://apt.llvm.org/bullseye/ llvm-toolchain-bullseye-14 main\n' > /etc/apt/sources.list.d/llvm.list

RUN apt-get update

# Command line helpers
RUN apt install -y --no-install-recommends mc joe vim bash bash-completion

# Build tools
RUN apt install -y --no-install-recommends git cmake yasm make libssl-dev ccache ninja-build binutils-gold

# LLVM suite
RUN apt install -y --no-install-recommends llvm-14 clang-14 clang-tools-14 clang-14-doc libclang-common-14-dev libclang-14-dev libclang1-14 clang-format-14 python3-clang-14 clangd-14 clang-tidy-14

# Analysis / Profiling tools
RUN apt install -y --no-install-recommends cppcheck valgrind google-perftools

# Setup ccache
RUN mkdir /usr/lib/ccache/bin && \
    ln -s /usr/bin/ccache /usr/lib/ccache/bin/clang && \
    ln -s /usr/bin/ccache /usr/lib/ccache/bin/clang++ && \
    ln -s /usr/bin/clang-14 /usr/bin/clang \
    ln -s /usr/bin/clang++-14 /usr/bin/clang++

ENV HOME /root
COPY .bashrc $HOME/

CMD ["/bin/bash"]
