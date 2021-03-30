#         __               __         ____                 __  _                 
#        / /_  ____ ______/ /_       / __/_  ______  _____/ /_(_)___  ____  _____
#       / __ \/ __ `/ ___/ __ \     / /_/ / / / __ \/ ___/ __/ / __ \/ __ \/ ___/
#    _ / /_/ / /_/ (__  ) / / /    / __/ /_/ / / / / /__/ /_/ / /_/ / / / (__  ) 
#   (_)_.___/\__,_/____/_/ /_/____/_/  \__,_/_/ /_/\___/\__/_/\____/_/ /_/____/  
#                           /_____/                                              

welcome () {
    Date=$(date)
    echo -e "Welcome back,$lightBlue $Date $reset\n"
    neofetch
}

cmk () {
    mkdir -p $1 && cd $1
}

vid () {
    clear
    video=$(ls | smenu -c -W $'\n' -N -M -n25)

    if [[ -d $video ]] 
    then
        cd $video && vid
    else
        mpv "$video" --really-quiet
    fi
}

countdown () {
    [[ $1 == *"h" ]] && Time="${1:: -1}*60*60"
    [[ $1 != *"h" ]] && Time=$1

    date1=$((`date +%s` + $Time))
    while [ "$date1" -ge `date +%s` ]; do
        days=$(($(($(( $date1 - $(date +%s))) * 1 ))/86400))
        echo -ne "$days day(s) and $(date -u --date @$(($date1 - `date +%s`)) +%H:%M:%S)\r"; 
        sleep 0.1
    done
    echo -e "\nDone"
}

stopwatch () {
    date1=`date +%s`
    while true; do 
        days=$(( $(($(date +%s) - date1)) / 86400 ))
        echo -ne "$days day(s) and $(date -u --date @$((`date +%s` - $date1)) +%H:%M:%S)\r";
        sleep 0.1
    done
}


welcome
