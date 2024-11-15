############################################################
#####                      ZSHRC                       #####
############################################################

##### Automatic Install #####
#
# Install "Zinit" if not yet installed
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
if [ ! -d "$ZINIT_HOME" ]; then
    mkdir -p "$(dirname $ZINIT_HOME)"
    git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Install "Oh My Posh" if not yet installed
if [ ! -f "$HOME/.local/bin/oh-my-posh" ]; then
    mkdir -p "$HOME/.local/bin"
    curl -s https://ohmyposh.dev/install.sh | bash -s -- -d ~/.local/bin
fi

# Install "Bat" Catppuccin theme if not yet installed
if [ ! -d "$HOME/.config/bat/themes" ]; then
    mkdir -p "$(bat --config-dir)/themes"
    wget -P "$(bat --config-dir)/themes" https://github.com/catppuccin/bat/raw/main/themes/Catppuccin%20Mocha.tmTheme
    bat cache --build
fi

# Install 

##### Custom Path(s) #####
#
# Add custom path to $PATH
export PATH=$HOME/.local/bin:$PATH

##### Load and Configure Plugins #####
#
# Initialize "Zinit"
source "${ZINIT_HOME}/zinit.zsh"

# Load "Zsh Completions"
zinit light zsh-users/zsh-completions

# Laod "Fzf-tab"
zinit light Aloxaf/fzf-tab

# Load "Zsh Autosuggestions"
zinit light zsh-users/zsh-autosuggestions

# Load "Fast Syntax Highlighting"
zinit light zdharma-continuum/fast-syntax-highlighting

if [ ! -f "$HOME/.config/fsh/catppuccin-mocha.ini" ]; then
    mkdir -p "$HOME/.config/fsh"
    curl https://raw.githubusercontent.com/catppuccin/zsh-fsh/refs/heads/main/themes/catppuccin-mocha.ini -o $HOME/.config/fsh/catppuccin-mocha.ini
    fast-theme $HOME/.config/fsh/catppuccin-mocha.ini
fi

# Load "Sudo"
zinit snippet OMZP::sudo

# Load "Command not found "
zinit snippet OMZP::command-not-found

##### Initialize completions #####
#
# Load compinit
autoload -U compinit && compinit

# Replay compdefs (allows to call compinit only once)
zinit cdreplay -q

##### Keybindings #####
#
# Bind "control + y" to accept autosuggestion
bindkey "^y" autosuggest-accept

##### History #####
#
# History size
HISTSIZE=5000

# Location of history file
HISTFILE=$HOME/.zsh_history

# Apply history size to saved history
SAVEHIST=$HISTSIZE

# Erase duplicates inside history file
HISTDUP=erase

# Append to history file instead of overwriting it
setopt appendhistory

# Share history across sessions
setopt sharehistory

# Prevent all duplicates from being saved
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups

# Prevent showing duplicates inside history search
setopt hist_find_no_dups

##### Completions #####
#
# Enable case insensitive tab completion
zstyle ":completion:*" matcher-list "m:{a-z}={A-Za-z}"

# Apply color to completions
zstyle ":completion:*" list-colors "${(s.:.)LS_COLORS}"

# Sort completions by name
zstyle ":completion:*" file-sort name

# Disable default zsh tab completions
zstyle ":completion:*" menu no

# Add directory preview when using fzf-tab for changing directories
zstyle ":fzf-tab:complete:cd:*" fzf-preview "ls --color $realpath"

# Add directory preview when using zoxide
zstyle ":fzf-tab:complete:__zoxide_z:*" fzf-preview "ls --color $realpath"

##### Shell integrations #####
#
# "Fzf" shell integration and settings
export FZF_DEFAULT_OPTS_FILE=$HOME/.config/fzf/fzfrc
eval "$(fzf --zsh)"

# Set "Bat" theme
export BAT_THEME="Catppuccin Mocha"

# "Zoxide" shell integration
eval "$(zoxide init --cmd cd zsh)"

# "Homebrew" shell integration if using MacOS
if [[ "$OSTYPE" == "darwin"* ]]; then
    eval "$(opt/homebrew/bin/brew shellenv)"
fi

##### Aliases #####
#
# list command
alias ls="ls -Acv --color --group-directories-first"
alias fzf="fzf --preview 'bat --color=always --style=numbers --line-range=:500 {}'"

##### Prompt #####
#
# Initialize Oh-My-Posh as a terminal prompt, unless using default MacOS terminal
if [ "$TERM_PROGRAM" != "Apple_Terminal" ]; then
  eval "$(oh-my-posh init zsh --config $HOME/.config/oh-my-posh/oh-my-posh.toml)"
fi

# TO ALIAS
# mkdir -p
# ls -a
# fzf
# zinit update
# bindkey "something" history-search-backward
# bindkey "something" history-search-forward
