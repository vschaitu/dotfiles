# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Disable XON/XOFF flow control to free up <C-s> and <C-q> shortcuts in terminal
# # By default <C-s> and <C-q> pause and resume the terminal output,
# # but we might use them in a Vim or somewhere else, so let's unbind them
# # NOTE: do this only for interactive shell
# [[ $- == *i* ]] && stty -ixon

# Pointing zplug directory
export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh

#Make sure to use double quotes for Zplug
zplug "zsh-users/zsh-syntax-highlighting"
zplug "zsh-users/zsh-autosuggestions"
zplug "romkatv/powerlevel10k", as:theme, depth:1

# Install all plugins above
# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load 

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=058'

#set by nvm - node version manager
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# the below enables simple vim binding in shell 
#bindkey -v

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Git
compdef g=git
function g {
  if [[ $# -gt 0 ]]; then
    git "$@"
  else
    git status --short --branch
  fi
}

alias ga="git add ."
alias gc="git commit"
alias gp="git push"

# Tmux 
#_tmux_orientation() {
#  width=$(tmux display -p '#{pane_width}')
#  height=$(tmux display -p '#{pane_height}')
#  normalized_height=$( echo "$height * 2.2" | bc | xargs printf "%.0f")

#  if (( normalized_height > width )); then
#    echo 'portrait'
#  else
#    echo 'landscape'
#  fi
#}

#tmux-smart-pane() {
#  [[ $(_tmux_orientation) = 'portrait' ]] && orient='-v' || orient='-h'
#  eval "tmux split-window $orient $@"
#}

#_not_inside_tmux() {
#  [[ -z "$TMUX" ]]
#}

#ensure_tmux_is_running() {
#  if _not_inside_tmux; then
#    tat
#  fi
#}

#ensure_tmux_is_running

# BAT
alias cat="bat"

# FZF
# Use fd (https://github.com/sharkdp/fd) instead of the default find
# for fzf '**' shell completions.
# - The first argument to the function ($1) is the base path to start traversal
_fzf_compgen_path() {
  command fd --hidden --follow --exclude .git --exclude node_modules . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  command fd --type d --hidden --follow --exclude .git --exclude node_modules . "$1"
}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Load user-defined aliases and functions
for script in $DOTFILES/zsh/.zsh/scripts/*; do
  source $script
done

#Unbind control tab
#bindkey -r "^^I"

export PATH=$PATH:/Users/srichaitanyavanapalli/CLife/Workshop/my-scripts
