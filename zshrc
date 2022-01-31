export EDITOR=vim
set keymap vi
set -o vi

if (command -v brew && brew list --formula | grep -c vim ) > /dev/null 2>&1; then
    alias vim="$(brew --prefix vim)/bin/vim"
fi

# Increase open files.
ulimit -n 4096

source /Users/shawnaukstak/.zsh-git-prompt/zshrc-git-prompt.sh
PROMPT='%B%m%~%b$(git_super_status) %# '

alias git-rbm='MYBRANCH=`git rev-parse --abbrev-ref HEAD` && rm -f ../.stash-pop-needed && git diff-index --quiet HEAD -- && echo "No changes, skipping command: git stash" || ( git stash && touch ../.stash-pop-needed ) && git checkout master && git fetch && git merge --ff-only origin/master && git checkout $MYBRANCH && git rebase master && ((ls ../.stash-pop-needed && git stash pop) || echo "Skipping command: git stash pop" )'

eval "$(rbenv init -)"

alias composer="php /usr/local/bin/composer.phar"
alias lt="script/lint-and-test"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
  eval "$(pyenv virtualenv-init -)"
fi

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

bindkey -v
bindkey "^R" history-incremental-pattern-search-backward

HISTSIZE=1000000
SAVEHIST=1000000
setopt INC_APPEND_HISTORY
setopt EXTENDED_HISTORY
setopt HIST_FIND_NO_DUPS
HISTFILE=~/.zsh_history
source /usr/local/share/zsh/site-functions/_aws
