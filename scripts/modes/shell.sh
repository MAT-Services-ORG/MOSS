build_prompt() {
    local host=$(hostname)
    local path="$PWD"

    if [[ "$path" == "$HOME" ]]; then
        PS1="SH ~> "
    elif [[ "$path" == "$HOME/"* ]]; then
        path="~${path#$HOME}"
        PS1="SH $path> "
    else
        PS1="SH $host:$path> "
    fi
}
PROMPT_COMMAND=build_prompt
alias cls=clear
copy() {
    if [[ $1 == "-"*]]; then
        if [[ $1 == "-h"]] then
            Usage
        elif [[ $1 == "-v"]] then
            ver # Think to add the "ver" command.
        else 
            echo "Unreconized option: $($1)" # Verify if that works.
        fi
    fi
    cat $1 > $2
}

echo "Welcome to MOSS version $(ver) !"