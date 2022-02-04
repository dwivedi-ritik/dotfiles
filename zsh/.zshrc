#zsh config
cowsay ahh shit! here we go again


fpath+=$HOME/.zsh/pure

# .zshrc
autoload -U promptinit; promptinit

# optionally define some options
PURE_CMD_MAX_EXEC_TIME=10

# change the path color
zstyle :prompt:pure:path color '#5af78e'

# change the color for both `prompt:success` and `prompt:error`
zstyle ':prompt:pure:prompt:*' color cyan

# turn on git stash status

prompt pure

export PATH=$PATH:$HOME/bin

#Aliases

alias ls='ls --color=auto'

#Get random gibbrish word

get_random(){
	random_commit=`shuf /usr/share/dict/cracklib-small | awk 'FNR == 1 { print $1 }'`
}
alias gpm='get_random; git add .; git commit -m ${random_commit}; git push origin main'
