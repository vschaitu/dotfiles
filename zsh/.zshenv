# Consist of ZSH env variables set by me
export DOTFILES="${HOME}/dotfiles"
export EDITOR="vim"

# 'BurntSushi/ripgrep', modern replacement for grep
export RIPGREP_CONFIG_PATH="$DOTFILES/ripgrep/.ripgrep"

# 'junegunn/fzf', command line fuzzy finder
export FZF_DEFAULT_OPTS="--no-mouse --height 80% --reverse --multi --info=inline --preview='$HOME/.vim/plugged/fzf.vim/bin/preview.sh {}' --preview-window='right:60%:wrap' --bind='f2:toggle-preview,f3:execute(bat --style=numbers {} || less -f {}),f4:execute($EDITOR {}),alt-w:toggle-preview-wrap,ctrl-d:half-page-down,ctrl-u:half-page-up,ctrl-y:execute-silent(echo {+} | pbcopy),ctrl-x:execute(rm -i {+})+abort,ctrl-l:clear-query'"
export FZF_DEFAULT_COMMAND="git ls-files --cached --others --exclude-standard 2>/dev/null || fd --type f --type l $FD_OPTIONS"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type d $FD_OPTIONS"
#export MANPATH="/usr/local/share/fzf/man:$MANPATH"

