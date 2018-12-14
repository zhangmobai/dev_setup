set -o vi

source /home/mzhang/.alias

export PATH=$PATH:$HOME/bin

export EDITOR=vim

#export DOCKER_HOST=unix:///var/run/docker.sock

export LESSCHARSET=utf-8

function gcb() {
	current_branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
	if [ $? -eq 0 ]
	then
		echo $current_branch
	else
		echo ""
	fi
}

export PS1='[\e[0;33m\H\e[m:\e[0;32m\w\e[m] \e[0;33m[$(gcb)][$(git-tagger -g)]\e[m (\d \t) \r\n$ '

