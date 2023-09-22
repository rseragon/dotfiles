# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="refined"


# Uncomment one of the following lines to change the auto-update behavior
 zstyle ':omz:update' mode auto      # update automatically without asking
 zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git poetry)

source $ZSH/oh-my-zsh.sh

# User Config
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

export PYENV_ROOT="$HOME/.pyenv"
PATH=$PATH:$PYENV_ROOT/bin:~/.local/bin/:~/.config/scripts:~/.emacs.d/bin:~/.config/rofi/bin:/home/okami/.local/share/gem/ruby/3.0.0/bin:~/.dotnet/tools:~/go/bin:~/.cargo/bin:~/.pub-cache/bin:~/.yarn/bin:~/.detaspace/bin:/opt/*/bin


## Useful exports
export EDITOR='nvim'
export MANPAGER="sh -c 'col -bx | bat -l man -p '"
export MANROFFOPT="-c"
export XDG_CONFIG_HOME="/home/$USER/.config"
export XDG_DATA_HOME="$HOME/.local/share"
# Fix for Wxgui apps
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib
# Run Qt apps with gtk2 theme
export QT_QPA_PLATFORMTHEME=qt5ct



## Alias
alias clip=' xclip -selection clipboard' # copies to clipboard
alias neovim="TERM=xterm-265color nvim " # alacritty was giving trouble
alias gitcfg="git config --local user.name 'alphapanda01' && git config --local user.email 'menecho007@gmail.com'"
alias chrome="google-chrome-stable"
alias gitgr="git log --all --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr)%C(bold blue) <%an> %Creset' --abbrev-commit"
alias testgitgr="git log --all --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold green)(%ar)%C(reset) %C(bold cyan)(committed: %cD)%C(reset) %C(auto)%d%C(reset)%n''          %C(white)%s%C(reset)%n''          %C(dim white)- %an <%ae> %C(reset) %C(dim white)(committer: %cn <%ce>)%C(reset)'"        
alias vim="TERM=xterm-256color vim "
alias bottom="btm --color nord -S  --battery -m -l  --show_table_scroll_position -T"
alias flameshot="QT_QPA_PLATFORM=xcb flameshot"

# Run bpython in asyncio debug mode
alias bpyde="PYTHONASYNCIO=1 PYTHONTRACEMALLOC=1 bpython "

# CMake alias
alias cfgcmake="CC=clang CXX=clang++ cmake -G \"Ninja\" "
alias blicmake="cmake --build ."
alias recfgcmake="rm -rf * && cfgcmake"
alias btcmake="cmake --build . && ctest --output-on-failure"

# Some other alias
alias vivaldi-safe="firejail --private=~/test/sandbox/ --noprofile vivaldi-snapshot"
alias exa="exa --icons --color=always "
alias rg="rg --color always "
alias bat="bat --force-colorization --theme='Monokai Extended Origin' "
alias ncmpcpp2="~/.config/ncmpcpp/ncmpcpp-ueberzug/ncmpcpp-ueberzug"

# Safe
alias rm="rm -i -v"
alias mv="mv -i -v"
alias cp="cp -r -v -i "
alias ls="exa"

# Kitty stuff
alias icat="kitty +kitten icat"


# Fix vim terminal cursor
#[[ $TERM == xterm* ]] && cursor-reset.sh


# Compilation flags
export ARCHFLAGS="-arch x86_64"


#### Other custom plugins

# These 2 slow the shell down
# Node version control stuff
export NVM_DIR="$HOME/.config/nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/nvm.sh" ] && `$NVM_DIR/nvm.sh --no-use --fast-reuse`  # This loads nvm
# Pyenv shit
# eval "$(pyenv init -)"
eval "$(pyenv init --path --no-rehash)" # This is faster ig 100ms lag tho



### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

zinit light zsh-users/zsh-completions
### End of Zinit's installer chunk


