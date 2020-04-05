# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/cooldude/.oh-my-zsh"

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes


ZSH_THEME="robbyrussell"

export CLICOLOR=YES
export LSCOLORS=exfxfeaeBxxehehbadacea

HISTSIZE=5000               #How many lines of history to keep in memory
HISTFILE=/Users/cooldude/.zsh_history     #Where to save history to disk
SAVEHIST=50000               #Number of history entries to save to disk
HISTDUP=erase               #Erase duplicates in the history file
setopt    appendhistory     #Append history to the history file (no overwriting)
setopt    sharehistory      #Share history across terminals
setopt    incappendhistory  #Immediately append to the history file, not just when a term is killed

fignore=(.pyc)

alias v="/usr/local/bin/nvim"
alias python="python3"

export MANPATH="$(brew --prefix)/share/man:$MANPATH"
export INFOPATH="$(brew --prefix)/share/info:$INFOPATH"

## Solarized Light color scheme for fzf
_gen_fzf_default_ops() {
    local base03="#002b36"
    local base02="#073642"
    local base01="#586e75"
    local base00="#657b83"
    local base0="#839496"
    local base1="#93a1a1"
    local base2="#eee8d5"
    local base3="#fdf6e3"
    local yellow="#b58900"
    local orange="#cb4b16"
    local red="#dc322f"
    local magenta="#d33682"
    local violet="#6c71c4"
    local blue="#268bd2"
    local cyan="#2aa198"
    local green="#859900"

    # Solarized Light
    export FZF_DEFAULT_OPTS=export FZF_DEFAULT_OPTS="
      --color=bg+:$base2,bg:$base3,spinner:$magenta,hl:$magenta
      --color=fg:$base01,header:$base1,info:$magenta,pointer:$magenta
      --color=marker:$magenta,fg+:$base01,prompt:$magenta,hl+:$magenta
    "

    # Ignore .gitignore dirs / files
    export FZF_DEFAULT_COMMAND='ag -g "" 2> /dev/null'
    export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
}

_gen_fzf_default_ops

export EDITOR="/usr/local/bin/nvim"
# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in /Users/cooldude/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in /Users/cooldude/.oh-my-zsh/plugins/*)
# Custom plugins may be added to /Users/cooldude/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="/Users/cooldude/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate /Users/cooldude/.zshrc"
# alias ohmyzsh="mate /Users/cooldude/.oh-my-zsh"
prompt_context() {}

unset VIMRUNTIME

[ -f /Users/cooldude/.fzf.zsh ] && source /Users/cooldude/.fzf.zsh
