export PATH=$PATH:/Users/shawnaukstak/github/github/bin
export PATH=/usr/local/bin:$PATH

export EDITOR=vim
set keymap vi
set -o vi

# Configure colors, if available.
if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
    c_reset='\[\e[0m\]'
    c_user='\[\033[1;33m\]'
    c_path='\[\e[0;33m\]'
    c_git_clean='\[\e[0;36m\]'
    c_git_dirty='\[\e[0;35m\]'
else
    c_reset=
    c_user=
    c_path=
    c_git_clean=
    c_git_dirty=
fi

# Function to assemble the Git part of our prompt.
git_prompt ()
{
    if ! git rev-parse --git-dir > /dev/null 2>&1; then
        return 0
    fi

    git_branch=$(git rev-parse --abbrev-ref HEAD 2> /dev/null)

    if git diff --quiet 2>/dev/null >&2; then
        git_color="$c_git_clean"
    else
        git_color="$c_git_dirty"
    fi

    echo " [$git_color$git_branch${c_reset}]"
}

PROMPT_COMMAND='echo -ne "\033]0;${PWD}\007";PS1="${c_user}\u${c_reset}@${c_user}\h${c_reset}:${c_path}\w${c_reset}$(git_prompt)\$ "'

alias git-rbm='MYBRANCH=`git rev-parse --abbrev-ref HEAD` && rm -f ../.stash-pop-needed && git diff-index --quiet HEAD -- && echo "No changes, skipping command: git stash" || ( git stash && touch ../.stash-pop-needed ) && git checkout master && git fetch && git merge --ff-only origin/master && git checkout $MYBRANCH && git rebase master && ((ls ../.stash-pop-needed && git stash pop) || echo "Skipping command: git stash pop" )'

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
