

eval "$(starship init zsh)"

peach_info=" \n

User: ritik\n
Peach Server: ssh ritik@peach.webintensive.com\n
Pass: Goacbyct?Of6\n


SEMS DEV SERVER\n

SERVER: ssh sandeep@dev-sems.qa.expertly.cloud\n
Password: $AND@123\n

Log: /var/log/tomcat8/"



eval "$(fzf --zsh)"

export PATH="/Users/ritik/localbin/:$PATH"
export PATH="/Users/ritik/go/bin/:$PATH"
export PATH="/Users/ritik/Casual/menv/bin/:$PATH"

#source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

#Enable ctrl+arrow ability to jump by word 
bindkey "^[[1;3C" forward-word
bindkey "^[[1;3D" backward-word

#Alias don't take argument, converted resume_upload script into a function
resume_update_method() {
  script_path="$HOME/Casual/AutomateResumeUpload/resume_upload.py"
  project_path="$HOME/Projects/dwivedi-ritik.github.io"

  python3 $script_path "$project_path" "$@"
  
}

#md_reader() {
#  /Users/ritik/localbin/.venv/bin/python -m rich.markdown "$1"
#}


#Aliases
alias peach='echo $peach_info'
alias peach-login='ssh ritik@peach.webintensive.com'
alias sems-dev='ssh -J ritik@peach.webintensive.com sandeep@dev-sems.qa.expertly.cloud'
alias ll='lsd -al'
alias resume_update='resume_update_method'
alias gookie-prod-db='psql postgresql://postgres:hmyGUsICQwteWUrFWWjGbvkUOMiCMWZS@ballast.proxy.rlwy.net:19462/railway'
#alias md_reader='md_reader'
alias proj='cd /Users/ritik/Projects'
alias github='cd /Users/ritik/Projects/open-source-repo'
alias ai='cd /Users/ritik/exp-ad-pd-ai/ai-work && claude'
export CLOUDSDK_PYTHON="/opt/homebrew/opt/python@3.12/libexec/bin/python3"
export CLOUDSDK_PYTHON="/opt/homebrew/bin/python3.12"
export gcloud='/Users/ritik/google-cloud-sdk/bin/gcloud'
# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/ritik/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/ritik/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/ritik/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/ritik/Downloads/google-cloud-sdk/completion.zsh.inc'; fi

# fnm (Fast Node Manager) — auto-switch Node version per directory (.nvmrc / .node-version)
eval "$(fnm env --use-on-cd)"

# Hermes Agent — ensure ~/.local/bin is on PATH
export PATH="$HOME/.local/bin:$PATH"

# ---- nnn file manager ----
# NNN_OPTS flags: A = no auto-enter dir on unique filter match, d = detail mode (size/date/permissions), e = open text files in $EDITOR
export NNN_OPTS="Ade"
# Launch nnn with "n" — and cd into the last browsed directory when you quit with q
n () {
    [ "${NNNLVL:-0}" -eq 0 ] || { echo "nnn is already running"; return; }
    export NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"
    command nnn "$@"
    [ ! -f "$NNN_TMPFILE" ] || { . "$NNN_TMPFILE"; rm -f -- "$NNN_TMPFILE"; }
}

# Claude Code renders 256-color (salmon instead of orange) inside tmux by default;
# this opt-in flag makes it use 24-bit truecolor when $TMUX is set.
export CLAUDE_CODE_TMUX_TRUECOLOR=1
