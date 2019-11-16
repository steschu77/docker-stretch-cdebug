FROM debian:stretch-slim

RUN apt-get update

# System essentials
RUN apt install -y --no-install-recommends wget gnupg apt-transport-https pkg-config lsb-release software-properties-common

# Command line helpers
RUN apt install -y --no-install-recommends mc joe vim bash bash-completion

RUN wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key | apt-key add -
RUN echo 'deb http://apt.llvm.org/stretch/ llvm-toolchain-stretch main\ndeb-src http://apt.llvm.org/stretch/ llvm-toolchain-stretch main\n' > /etc/apt/sources.list.d/llvm.list

RUN apt-get update

# Build tools
RUN apt install -y --no-install-recommends git cmake yasm make libssl-dev ccache ninja-build binutils-gold

# LLVM suite
RUN apt install -y --no-install-recommends clang clang-format clang-tidy lldb lld clangd

# Analysis / Profiling tools
RUN apt install -y --no-install-recommends cppcheck valgrind google-perftools

# Setup ccache
RUN mkdir /usr/lib/ccache/bin && \
    ln -s /usr/bin/ccache /usr/lib/ccache/bin/clang && \
    ln -s /usr/bin/ccache /usr/lib/ccache/bin/clang++

ENV HOME /root
COPY .bashrc $HOME/

CMD ["/bin/bash"]
