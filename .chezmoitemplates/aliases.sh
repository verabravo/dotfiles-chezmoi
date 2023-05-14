alias sudo='sudo '

alias grep='grep --color=auto'

{{- if lookPath "bat" }}
alias cat=bat
{{- else if lookPath "batcat" }}
alias cat='batcat --style=plain --paging=never'
{{- end }}

{{- if lookPath "exa" }}
alias ls='exa --group-directories-first'
alias tree='exa -T'
{{- end }}

alias ..="cd .."
alias ...="cd ../.."
alias ll="ls -l"
alias la="ls -la"
alias ~="cd ~"
alias python='python3'

# Git
alias gaa="git add -A"
alias gca="git add --all && git commit --amend --no-edit"
alias gco="git checkout"
alias gs="git status -sb"
alias gf="git fetch --all -p"
alias gps="git push"
alias gpsf="git push --force"
alias gpl="git pull --rebase --autostash"
alias gb="git branch"

# Utils
alias k='kill -9'
alias i.='(idea $PWD &>/dev/null &)'
alias c.='(code $PWD &>/dev/null &)'
alias o.='open .'
alias up='dot package update_all'
