# Iterm2 custom functions. 

# iTerm2 window/tab color commands
#   Requires iTerm2 >= Build 1.0.0.20110804
#   http://code.google.com/p/iterm2/wiki/ProprietaryEscapeCodes

tab-color() {
    echo -ne "\033]6;1;bg;red;brightness;$1\a"
    echo -ne "\033]6;1;bg;green;brightness;$2\a"
    echo -ne "\033]6;1;bg;blue;brightness;$3\a"
}

tab-reset() {
    echo -ne "\033]6;1;bg;*;default\a"
    trap - INT EXIT
}

# Change the color of the tab when using SSH, reset on ssh close.
color-ssh() {
    if [[ -n "$ITERM_SESSION_ID" ]]; then
        trap "tab-reset" INT EXIT

        if [[ "$*" =~ "app*|dat*|solr*|script-runner" ]]; then
            tab-color 255 105 97
        else
            tab-color 255 159 0
        fi
    fi

    ssh $*
}

compdef _ssh color-ssh=ssh

alias ssh=color-ssh
