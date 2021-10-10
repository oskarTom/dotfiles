# If not running interactively, don't do anything
[[ $- != *i* ]] && return

#  _             _           
# | |__  __ _ __| |_  _ _ __ 
# | '_ \/ _` (_-< ' \| '_/ _|
# |_.__/\__,_/__/_||_|_| \__|
#                            

# Show user privlige by emoji
if groups | grep -q '\broot\b'; then
  AT="💥"
elif groups | grep -q '\bsudo\b'; then
  AT="🔥"
else
  AT="▶️"
fi

# You may uncomment the following lines if you want `ls' to be colorized:
export LS_OPTIONS='--color=auto'
eval "`dircolors`"

alias ls='ls $LS_OPTIONS'
alias ll='ls $LS_OPTIONS -l'
alias l='ls $LS_OPTIONS -lA'

# MY CONFIGS:
white=$(tput setaf 255);
yellow=$(tput setaf 220);
ored=$(tput setaf 160);
orange=$(tput setaf 202);
beige=$(tput setaf 229);
blue=$(tput setaf 141);
bold=$(tput bold);
reset=$(tput sgr0);

PS1="\[\033[1;30m\][\t] ";	#Time
PS1+="\[${white}\]\u";		#User
PS1+=" $AT ";				#@
PS1+="\[${beige}\]\h";		#Host
PS1+="\[\033[01;34m\] \w ";		#Directory
PS1+="\[${reset}${bold}\]> ";	#reset
PS1+="\[${reset}\]";

export PS1;
export EDITOR="vim"
#export PATH="$HOME/.vim/plugged/vim-live-latex-preview/bin:$PATH"
