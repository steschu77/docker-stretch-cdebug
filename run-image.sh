docker run -it --rm --cap-add=SYS_PTRACE --security-opt seccomp=unconfined -v $(pwd):/work -v $HOME/.builds/:/builds -v $HOME/.ccache:/.ccache -w /builds steschu/stretch-cdebug
