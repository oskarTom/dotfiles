stty -ixon # Disable Ctrl-S (XON/XOFF)

if [ -f ~/.bashrc ]; then
	source ~/.bashrc
fi
