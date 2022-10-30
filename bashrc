# /etc/skel/.bashrc
#
# This file is sourced by all *interactive* bash shells on startup,
# including some apparently interactive shells such as scp and rcp
# that can't tolerate any output.  So make sure this doesn't display
# anything or bad things will happen !


# Test for an interactive shell.  There is no need to set anything
# past this point for scp and rcp, and it's important to refrain from
# outputting anything in those cases.
if [[ $- != *i* ]] ; then
		# Shell is non-interactive.  Be done now!
			return
fi

# Put your fun stuff here.
export PS1="\[\e[32m\]$\[\e[m\] "
set -o emacs

export PATH="${PATH}:$HOME/bin/"
export PATH="${PATH}:$HOME/.local/bin/"

export PATH="${PATH}:$HOME/go/bin/"
export PATH="${PATH}:$HOME/npm/bin/"
export PATH="${PATH}:/usr/local/go/bin/"
export GOPATH="$HOME/go"

# from: https://stackoverflow.com/questions/39311147/cannot-run-npm-commands
# export PATH=$(echo "$PATH" | sed -e 's/:\/mnt[^:]*//g')

export EDITOR="vim"

alias scrot="scrot '%Y-%m-%d-%m-%s_\$wx\$h.png' -e 'mv \$f ~/pics/scrot/'"
alias vi="nvim"
alias vim="nvim"
alias ls="ls --color=auto"

alias gadd="git add"
alias gst="git status"
alias glog="git --no-pager log --pretty=oneline"
 
npm config set prefix $HOME/npm
