
function cdd() {
  cd "$(ls -d -- */ | fzf)" || echo "Invalid directory"
}

function j() {
  fname=$(declare -f -F _z)

  [ -n "$fname" ] || source "$HOME/bin/z/z.sh"

  _z "$1"
}

function recent_dirs() {
  # This script depends on pushd. It works better with autopush enabled in ZSH
  escaped_home=$(echo $HOME | sed 's/\//\\\//g')
  selected=$(dirs -p | sort -u | fzf)

  cd "$(echo "$selected" | sed "s/\~/$escaped_home/")" || echo "Invalid directory"
}

dot() {
    current_so=$(chezmoi data | sed -z 's/.*"osRelease":\s* {.*\s*"id": "\([^"]*\)".*/\1/')
    current_dir="$(chezmoi source-path)/custom_scripts/${current_so}"

    scripts=$(find "$current_dir" -type f -name "*.sh" -exec realpath --relative-to="$current_dir" {} \;)

    selected_script=$(echo "$scripts" | fzf \
        --ansi \
        --prompt="Selecciona un script > " \
        --preview-window="right:60%:wrap" \
        --preview="echo \"Contenido del script: {}\n\" && cat ${current_dir}/{}" \
        --layout=reverse)

    if [ -n "$selected_script" ]; then
        script_path=$(realpath "$current_dir/$selected_script")

        bash "$script_path"
    else
        echo "No se seleccionó ningún script."
    fi
}