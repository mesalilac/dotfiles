# put this file in ~/.config/fish/functions/

function _git_branch_name
    echo (command git symbolic-ref HEAD 2> /dev/null | sed -e 's|^refs/heads/||')
end

function _git_is_dirty
    echo (command git status -s --ignore-submodules=dirty 2> /dev/null)
end

function fish_prompt
    set -l last_status $status
    set -l cyan (set_color -o cyan)
    set -l yellow (set_color -o yellow)
    set -l red (set_color -o red)
    set -l green (set_color -o green)
    set -l magenta (set_color -o magenta)
    set -l normal (set_color -o normal)
    set -l cwd $red(pwd | sed "s:^$HOME:~:")

    echo -e ''

    echo -n -s $cwd $normal


    if [ (_git_branch_name) ]
        set -l git_branch (_git_branch_name)

        if [ (_git_is_dirty) ]
            set git_info '(' $yellow $git_branch " ±" $normal ')'
        else
            set git_info '(' $green $git_branch " ✓" $normal ')'
        end
        echo -n -s ' · ' $git_info $normal
    end

    set -l prompt_color $red
    if test $last_status = 0
        set prompt_color $green
    end


    echo -e ''
    echo -e -n -s $prompt_color 'λ  ' $green
    
end

