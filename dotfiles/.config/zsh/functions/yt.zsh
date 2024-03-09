yt-select() {
    URL=$1
    [ -z $URL ] && echo -e "You must provide a URL." && return 1
    format_id=$(yt-dlp --list-formats $URL | tail -n +6 |  fzf --layout=reverse | awk '{print $1}')
    yt-dlp -o "%(title)s.%(ext)s" --windows-filenames --add-metadata -ic -f $format_id $URL
}

yt-audio() {
    URL=$1
    [ -z $URL ] && echo -e "You must provide a URL." && return 1
    yt-dlp -o "%(title)s.%(ext)s" --windows-filenames --add-metadata -ic --extract-audio --audio-format mp3 "$URL"
}

yt() {
    URL=$1
    [ -z $URL ] && echo -e "You must provide a URL." && return 1
    yt-dlp -o "%(title)s.%(ext)s" --windows-filenames --add-metadata -ic -f "bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best" $URL
}

yt-playlist() {
    URL=$1
    [ -z $URL ] && echo -e "You must provide a URL." && return 1

    yt-dlp -o "[%(playlist_index)s-%(playlist_count)s] %(title)s.%(ext)s" \
        --windows-filenames \
        --add-metadata \
        -ic \
        -f "bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best" \
        --yes-playlist \
        "$URL"
}
