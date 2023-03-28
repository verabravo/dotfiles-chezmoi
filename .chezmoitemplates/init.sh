{{ if eq "" (lookPath "chezmoi") }}
PATH="$HOME/bin:$PATH"
{{- end }}


{{ template "aliases.sh" . }}

source "$(chezmoi source-path)/custom_files/shell/exports.sh"
source "$(chezmoi source-path)/custom_files/shell/functions.sh"
source "$HOME/bin/fzf-docker/docker-fzf"
source "$HOME/.extra_bash_function.sh"