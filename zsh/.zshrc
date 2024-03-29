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
export PATH=$PATH:$HOME/.cargo/bin
#Alias
alias t-stream='python /home/ritik/incomplete/torr-cli2/src/app.py' 
alias rn='ranger'
alias ls='ls --color=auto'
alias grep='grep --color=always'
alias myip="ip addr show wlp1s0 | grep -Eo '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}/' | sed 's/\// /g'"

#Get random gibbrish word

get_random(){
	random_commit=`shuf /usr/share/dict/cracklib-small | awk 'FNR == 1 { print $1 }'`
}
alias gpm='get_random; git add .; git commit -m ${random_commit}; git push origin main'
alias t-stream='python /home/ritik/incomplete/torr-cli2/src/app.py'
