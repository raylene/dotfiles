# .bash_profile

# Make emacs colors look nicer
export TERM='xterm-color'

# Aliases
alias g=git
alias ..='cd ..'
# alias em='/Applications/Emacs.app/Contents/MacOS/Emacs -nw'
alias em="/usr/local/Cellar/emacs/24.4/Emacs.app/Contents/MacOS/Emacs -nw"
alias c=clear
alias sr='screen -r'
alias sn='screen -S'
alias sd='screen -d'
alias sls='screen -ls'
alias venv='source venv/bin/activate'

export PATH=/user/local/.rvm/bin:$PATH # Add RVM to PATH for scripting
export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/share/python:$PATH
export PATH=/Applications/Postgres93.app/Contents/MacOS/bin:$PATH
export PATH=$GOPATH/bin:$PATH

# go ish
export GOPATH=/Users/rayleney/Projects/mygo

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

##################################################
# pretty bash prompt with git / svn branch name
##################################################

function parse_git_dirty {
    nothing_message=`git --version | ruby -e 'STDIN.readlines[0].match(/(\d+\.\d+)/); puts ($1.to_f >= 1.8) ? "nothing to commit, working directory clean" : "nothing to commit (working directory clean)"'`
    [[ $(git status 2> /dev/null | tail -n1) != "$nothing_message" ]] && echo "*"
}
function parse_git_branch {
    git branch 2> /dev/null | sed -e "/^[^*]/d" -e "s/* \(.*\)/(\1$(parse_git_dirty))/"
}
function parse_svn_branch {
    svn info 2> /dev/null | grep URL | sed -e "s/.*\/\(.*\)$/(\1)/"
}
PS1="\n\
\[\033[0;32m\]\u$DIM \[\033[0;37m\]@ \[\033[0;33m\]\h 
\[\033[0;35m\]\$PWD \[\033[0;37m\]\$(parse_git_branch 2> /dev/null)\$(parse_svn_branch 2> /dev/null)$ " && export PS1


##################################################
# bash completion
##################################################

if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
fi
if [ -f `brew --prefix`/etc/bash_completion.d/rails.bash ]; then
    source `brew --prefix`/etc/bash_completion.d/rails.bash
fi
