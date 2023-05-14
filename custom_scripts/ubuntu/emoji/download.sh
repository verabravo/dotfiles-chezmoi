source "$(chezmoi source-path)/custom_scripts/ubuntu/emoji/.env"

URLS=(
    'https://emojipedia.org/people/'
    'https://emojipedia.org/nature/'
    'https://emojipedia.org/food-drink/'
    'https://emojipedia.org/activity/'
    'https://emojipedia.org/travel-places/'
    'https://emojipedia.org/objects/'
    'https://emojipedia.org/symbols/'
    'https://emojipedia.org/flags/'
)


function notify() {
    if [ "$(command -v notify-send)" ]; then
        notify-send "$1" "$2"
    fi
}


function download() {
    notify `basename "$0"` 'Downloading all emoji for your pleasure'

    echo "" > "$EMOJI_FILE"

    curl https://unicode.org/emoji/charts/full-emoji-list.html |
        grep -Po "class='(chars|name)'>\K[^<]+" |
        paste - - > "$EMOJI_FILE"

    notify `basename "$0"` "We're all set!"
}

download