# functions to manage git stuff

function change_branch() {
    OUTPUT=$(git branch | grep -vi -E '\*' | sed 's/^[ \t]*//;s/[ \t]*$//' | scout -i -l 40)

    if [[ -n $OUTPUT ]]; then
        git checkout $OUTPUT
    fi
}


{
    {
        {
            {
                {
                    {}
                }
            }
        }
    }
}

function remove_old_branches() {
    git branch --v | grep "\[gone\]" | awk '{print $1}' | xargs git branch -D
}

# Open git repo in browser
function gitb() {
    local URL="$(git remote get-url origin)"

    if [[ -n "$URL" ]]
    then
        echo "url: $URL"

        xdg-open $URL
    fi
}
