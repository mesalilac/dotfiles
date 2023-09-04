overview() {
    du -h --max-depth=1 | sed -r '
    $d; s/^([.0-9]+[KMGTPEZY]\t)\.\//\1/
    ' | sort -hr
}

cdf() {
    cd `fd -t d . . | fzf --layout=reverse`
}

playrand() {
    local random_file=$(find . -type f -regextype sed -regex '.*.mp4\|.*.gif\|.*.webm' | shuf -n 1)

    echo "playing '$random_file'"
    mpv "$random_file" --no-terminal
}

playrand_for() {
    # play a random vides for X amount of time

    local index
    local amount

    index=0
    (($1)) && amount=$1 || amount=-1

    while [[ $index != $amount ]]; do
        index=$(($index+1))

        echo video number: "$index"
        playrand
    done
}

yt-select() {
    URL=$1
    [ -z $URL ] && echo -e "You must provide at least one URL." && return 1
    format_id=$(yt-dlp --list-formats $URL | tail -n +6 |  fzf --layout=reverse | awk '{print $1}')
    yt-dlp -o "%(title)s.%(ext)s" --windows-filenames --add-metadata -ic -f $format_id $URL
}

yt-audio() {
    URL=$1
    [ -z $URL ] && echo -e "You must provide at least one URL." && return 1
    yt-dlp -o "%(title)s.%(ext)s" --windows-filenames --add-metadata -ic --extract-audio --audio-format mp3 "$URL"
}

yt() {
    URL=$1
    [ -z $URL ] && echo -e "You must provide at least one URL." && return 1
    yt-dlp -o "%(title)s.%(ext)s" --windows-filenames --add-metadata -ic -f "bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best" $URL
}

cmk() {
    mkdir -p $1 && cd $1
}

fp() {
    [[ -z $1 ]] && echo "process name is not provided!" ||
        pgrep $1
}

webp_to_gif() {
    for f in *.webp;do echo "$f";python3 -c "from PIL import Image;Image.open('$f').save('${f%.webp}.gif','gif',save_all=True,optimize=True,background=0)";rm "$f";done
}

gen() {
    length=16
    (($1)) && length=$1

    date +%s | sha256sum | base64 | head -c $length ; echo
}

unzip_all() {
    for f in *.zip; do
        unzip -d "${f%*.zip}" "$f" && rm "$f"
    done
}

rh() {
    command=$(cat ~/.zsh_history | fzf --layout=reverse)
    $command
}

untar() {
    tar -xf $1
    rm $1
}

pk() {
    process=$(ps -e | awk '{print $4}' | fzf --layout=reverse)
    pkill $process
}

reload() {
    exec zsh
}

# countdown() {
#     [[ $1 == *"h" ]] && Time="${1:: -1}*60*60"
#     [[ $1 != *"h" ]] && Time=$1

#     date1=$((`date +%s` + $Time))
#     while [ "$date1" -ge `date +%s` ]; do
#         days=$(($(($(( $date1 - $(date +%s))) * 1 ))/86400))
#         echo -ne "$days day(s) and $(date -u --date @$(($date1 - `date +%s`)) +%H:%M:%S)\r";
#         sleep 0.1
#     done
#     notify-send 'Countdown' 'done!'
#     echo -e "\nDone"
# }

# stopwatch() {
#     date1=`date +%s`
#     while true; do
#         days=$(( $(($(date +%s) - date1)) / 86400 ))
#         echo -ne "$days day(s) and $(date -u --date @$((`date +%s` - $date1)) +%H:%M:%S)\r";
#         sleep 0.1
#     done
# }

