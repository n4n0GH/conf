export ZSH="/home/n4n0/.oh-my-zsh"

# config for powerlevel9k theme
ZSH_THEME="powerlevel9k/powerlevel9k"
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_PROMPT_ADD_NEWLINE=true
POWERLEVEL9K_STATUS_OK=false
typeset -g POWERLEVEL9K_{LEFT,RIGHT}_SEGMENT_SEPARATOR=""
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=""
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="\u4ee4"
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir_writable dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(root_indicator ssh background_jobs status)
typeset -g POWERLEVEL9K_DIR_{ETC,HOME,HOME_SUBFOLDER,DEFAULT,NOT_WRITABLE}_BACKGROUND=none
typeset -g POWERLEVEL9K_DIR_{ETC,HOME,HOME_SUBFOLDER,DEFAULT,NOT_WRITABLE}_FOREGROUND="006"
typeset -g POWERLEVEL9K_VCS_{CLEAN,UNTRACKED,MODIFIED,LOADING}_BACKGROUND=none
typeset -g POWERLEVEL9K_VCS_CLEAN_FOREGROUND="010"
typeset -g POWERLEVEL9K_VCS_{UNTRACKED,MODIFIED}_FOREGROUND="003"
typeset -g POWERLEVEL9K_VCS_LOADING_FOREGROUND="012"
typeset -g POWERLEVEL9K_{ROOT_INDICATOR,SSH,BACKGROUND_JOBS}_BACKGROUND=none
POWERLEVEL9K_SHORTEN_DIR_LENGTH=3
POWERLEVEL9K_SHORTEN_STRATEGY=truncate_folders

# config for plugins
plugins=(git npm zsh-syntax-highlighting)

# quick access to transfer.sh
transfer() { 
    if [ $# -eq 0 ]; 
        then echo -e "No arguments specified. Usage:\necho transfer /tmp/test.md\ncat /tmp/test.md | transfer test.md"; return 1; 
    fi
    tmpfile=$( mktemp -t transferXXX ); 
    if tty -s; 
        then basefile=$(basename "$1" | sed -e 's/[^a-zA-Z0-9._-]/-/g'); 
            curl --progress-bar --upload-file "$1" "https://transfer.sh/$basefile" >> $tmpfile; 
        else curl --progress-bar --upload-file "-" "https://transfer.sh/$1" >> $tmpfile ; 
    fi; 
    cat $tmpfile; 
    rm -f $tmpfile; 
}

# create saner defaults
alias cp="cp -i"
alias mv="mv -i"
alias rm="rm -i"
alias ls="ls -lNh --color=always"

# quick aliases for zsh
alias reconf="source ~/.zshrc"
alias zshrc="vim ~/.zshrc"
alias powerlevel="bash ~/.scripts/powerline-check.sh"

# alias to start programs
alias cordless="~/go/bin/./cordless"
alias cordlessupdate="bash ~/.scripts/cordless-update.sh"
alias vim="nvim"
alias vimrc="nvim ~/.config/nvim/init.vim"

# GIT related
alias ga="git add"
alias gc="git commit -m"
alias gac="git add . && git commit -m"
alias gps="git push"
alias gf="git fetch"
alias gpl="git pull"

source $ZSH/oh-my-zsh.sh
