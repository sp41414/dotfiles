function fish_prompt -d "Write out the prompt"
    printf '%s@%s %s%s%s > ' $USER $hostname (set_color $fish_color_cwd) (prompt_pwd) (set_color normal)
end

if status is-interactive
    set fish_greeting
end

starship init fish | source

fish_add_path $HOME/.config/scripts
bind \cf tmux-sessionizer

alias ls 'eza --icons'
alias clear "printf '\033[2J\033[3J\033[1;1H'"

function vim
    if count $argv >/dev/null
        nvim $argv
    else
        nvim .
    end
end

alias venv "source .venv/bin/activate.fish"
alias src "source $HOME/.config/fish/config.fish"

set -gx EDITOR nvim

function cd
    builtin cd $argv
    eza --icons
end

function mkcd
    mkdir -p $argv[1]
    cd $argv[1]
end

function normalize
    ffmpeg -i $argv[1] -af loudnorm=I=-14:TP=-1.0:LRA=11 -c:v copy -c:a aac -b:a 192k output.mp4
end

# Yazi
function y
    set tmp (mktemp -t "yazi-cwd.XXXXXX")
    command yazi $argv --cwd-file="$tmp"
    if read -z cwd <"$tmp"; and [ "$cwd" != "$PWD" ]; and test -d "$cwd"
        builtin cd -- "$cwd"
    end
    rm -f -- "$tmp"
end

set -gx nvm_default_version lts
set -x NODE_ENV development
set -x MANPAGER "nvim +Man!"

fish_add_path $HOME/go/bin/
fish_add_path $HOME/.cargo/bin/
