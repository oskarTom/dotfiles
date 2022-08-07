# If not running interactively, don't do anything
[[ $- != *i* ]] && return
stty -ixon # Disable Ctrl-S (XON/XOFF)


#  _             _           
# | |__  __ _ __| |_  _ _ __ 
# | '_ \/ _` (_-< ' \| '_/ _|
# |_.__/\__,_/__/_||_|_| \__|
#                            

# Show user privlige by emoji
if groups | grep -q '\broot\b'; then
  AT="💥"
elif groups | grep -q '\bwheel\|sudo\b'; then
  AT="🔥"
else
  AT="▶️"
fi


# You may uncomment the following lines if you want `ls' to be colorized:
export LS_OPTIONS='--color=auto'
eval "`dircolors`"
alias ls='ls $LS_OPTIONS'
alias l='ls $LS_OPTIONS -lh'
alias ll='ls $LS_OPTIONS -lhA'

TERMINAL='kitty'
EDITOR='vim'
FILEMANAGER='ranger'
HISTCONTROL=ignoreboth:erasedups
CMAKE_MAKE_PROGRAM='cmake'
MOZ_ENABLE_WAYLAND=1
alias vimrc='$EDITOR $HOME/.vimrc'
alias bashrc='$EDITOR $HOME/.bashrc'
alias swayconfig='$EDITOR $HOME/.config/sway/config'
alias fm='$FILEMANAGER'
alias dfu='$HOME/dotfiles/update'

# MY CONFIGS:
white=$(tput setaf 255);
yellow=$(tput setaf 220);
ored=$(tput setaf 160);
orange=$(tput setaf 202);
beige=$(tput setaf 229);
blue=$(tput setaf 141);
bold=$(tput bold);
reset=$(tput sgr0);

PS1="\[${bold}${white}\] \u";		#User
PS1+=" $AT ";				#@
PS1+="\[${beige}\]\h";		#Host
PS1+="\[${blue}\] \w ";		#Directory
PS1+="\[${reset}${bold}\]> ";	#reset
PS1+="\[${reset}\]";

PS4="\[${bold}${blue} + ${reset}\]"

export PS1;
export PS4;
export TERMINAL;
export EDITOR;
export HISTCONTROL;
export CMAKE_MAKE_PROGRAM;
export MOZ_ENABLE_WAYLAND;
export PATH="$HOME/.emacs.d/bin:$PATH"
#export PATH="$HOME/.vim/plugged/vim-live-latex-preview/bin:$PATH"

#powerline-daemon -q
#POWERLINE_BASH_CONTINUATION=1
#POWERLINE_BASH_SELECT=1
#. /usr/share/powerline/bindings/bash/powerline.sh
