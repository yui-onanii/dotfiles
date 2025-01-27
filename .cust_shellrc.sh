#
# ==> hardcodes
#

[[ ! -f ~/.cust_hardcodes.d/shellrc ]] || source ~/.cust_hardcodes.d/shellrc

#
# ==> colored output
#

export LESS='-R --use-color -Dd+r$Du+b'
export MANPAGER="less -R --use-color -Dd+r -Du+b"
export MANROFFOPT="-P -c"

alias ls='ls --color=auto'

alias l='ls -lah'
alias ll='ls -lh'
alias la='ls -lAh'

alias grep='grep --color=auto'
alias diff='diff --color=auto'
alias pacman='pacman --color=auto'

[[ ! -z "$(command -v ip)" ]] && alias ip='ip -color=auto'
[[ ! -z "$(command -v dmesg)" ]] && alias dmesg='dmesg --color=auto'

export TERM=xterm-256color

# standard environment var
eval `dircolors`

#
# ==> git plugin, borrowed from oh-my-zsh
#

alias gst='git status'
alias glo='git log --oneline --decorate'

#
# ==> quick cd, borrowed from oh-my-zsh
#

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
alias .......='cd ../../../../../..'
alias ........='cd ../../../../../../..'
alias .........='cd ../../../../../../../..'
alias ..........='cd ../../../../../../../../..'

#
# ==> misc
#

# gpg - prefer terminal auth
export GPG_TTY=$(tty)

function ensure_ssh_agent() {
	[[ ! -f ~/.bin/_ensure-ssh-agent ]] || source ~/.bin/_ensure-ssh-agent
}

function watch_something() {
	watch -c -d -e -n 1 -t -x $*
}

# difftastic
export DFT_DISPLAY=inline

#
# ==> paths
#

[[ ! -d $HOME/.cargo/bin ]] || export PATH=$HOME/.cargo/bin:$PATH
[[ ! -d $HOME/.bin ]] || export PATH=$HOME/.bin:$PATH
[[ ! -d $HOME/.local/bin ]] || export PATH=$HOME/.local/bin:$PATH

if [ "$OSTYPE" = "msys" -o "$OSTYPE" = "cygwin" ]; then
	# preset path var, so installation can work on the fly
	[[ -d $HOME/.cargo/bin ]] || export PATH=$HOME/.cargo/bin:$PATH

	export CARGO_HOME="$(cygpath -w ${HOME})\\.cargo"
	export RUSTUP_HOME="$(cygpath -w ${HOME})\\.rustup"
fi

#
# ==> system profiles
#

# recommended for Tilix
if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
        [[ ! -f /etc/profile.d/vte.sh ]] || source /etc/profile.d/vte.sh
fi

################################################################################

[[ ! -f ~/.cust_hardcodes.d/post_shellrc ]] || . ~/.cust_hardcodes.d/post_shellrc
