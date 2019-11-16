export PATH="/usr/lib/ccache/bin:$PATH"
export BUILD_ROOT="$PWD"
export CCACHE_DIR="/.ccache"

# Use clang with ccache
export CC=/usr/lib/ccache/bin/clang
export CXX=/usr/lib/ccache/bin/clang++

# Programmable completion enhancements are enabled via
# /etc/profile.d/bash_completion.sh when the package bash_completetion
# is installed.  Any completions you add in ~/.bash_completion are
# sourced last.
if [ -f /etc/bash_completion ]; then
 . /etc/bash_completion
fi

# History Options
#
# Don't put duplicate lines in the history.
export HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}ignoredups

# Ignore some controlling instructions
# HISTIGNORE is a colon-delimited list of patterns which should be excluded.
# The '&' is a special pattern which suppresses duplicate entries.
# export HISTIGNORE=$'[ \t]*:&:[fb]g:exit'
export HISTIGNORE=$'[ \t]*:&:[fb]g:exit:ls' # Ignore the ls command as well

export HISTSIZE=5000
export HISTFILESIZE=5000

export PS1='[\u@cdebug \w]$ '

# Make bash append rather than overwrite the history on disk
shopt -s histappend

# Some people use a different file for aliases
if [ -f "${HOME}/.bash_aliases" ]; then
  source "${HOME}/.bash_aliases"
fi

alias df='df -h'
alias startvm='~/startvm.sh'

# Some shortcuts for different directory listings
alias ls='ls -lahF --group-directories-first --color'

# A good value is an almost full cache after building with a clean cache.
ccache --set-config=max_size=150.0M
ccache -s
