source "$(chezmoi source-path)/custom_scripts/ubuntu/emoji/.env"

function notify() {
    if [ "$(command -v notify-send)" ]; then
        notify-send "$1" "$2"
    fi
}

function display() {
    emoji=$(cat "$EMOJI_FILE" | grep -v '#' | grep -v '^[[:space:]]*$')
    line=$(echo "$emoji" | rofi -font "Monospace 30" -theme Monokai -dmenu -i -p emoji -kb-custom-1 Ctrl+c $@)
    exit_code=$?

    line=($line)

    if [ $exit_code == 0 ]; then
        sleep 0.1	
        xdotool type --clearmodifiers "${line[0]}"
        echo -n "${line[0]}" | xsel -i -b
    elif [ $exit_code == 10 ]; then
        echo -n "${line[0]}" | xsel -i -b
    fi
}

# Download all emoji if they don't exist yet
if [ ! -f "$EMOJI_FILE" ]; then
    dot emoji download
fi

display