function fish_prompt -d "Write out the prompt"
    printf '%s@%s %s%s%s > ' $USER $hostname (set_color $fish_color_cwd) (prompt_pwd) (set_color normal)
end

if status is-interactive
    set fish_greeting
end

eval "$(/opt/homebrew/bin/brew shellenv)"

starship init fish | source

if not set -q TMUX
    tmux
end

set PATH "$PATH":"$HOME/.config/scripts"
bind \cf tmux-sessionizer

alias ls 'eza --icons'
alias clear "printf '\033[2J\033[3J\033[1;1H'"
alias vim nvim
alias venv "source .venv/bin/activate.fish"
alias src "source $HOME/.config/fish/config.fish"

set -gx EDITOR nvim

fish_add_path ~/.cargo/bin

function cd
    builtin cd $argv
    eza --icons
end

function finder
    open .
end

function mkcd
    mkdir -p $argv[1]
    cd $argv[1]
end

function normalize
    ffmpeg -i $argv[1] -af loudnorm=I=-14:TP=-1.0:LRA=11 -c:v copy -c:a aac -b:a 192k output.mp4
end

set -x RIPGREP_CONFIG_PATH /Users/$USER/.config/ripgrep/rgrc
set -x MANPAGER "nvim +Man!"
set -x NODE_ENV development

fish_add_path $HOME/go/bin/
