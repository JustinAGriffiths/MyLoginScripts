#!/bin/bash

#http://git.or.cz/course/svn.html

alias git_push='git push -u origin master'
#alias git_info='git remote show origin'
alias git_pull='git pull -a'
alias git_up='git_pull'
alias git_ci='git commit -a -m "up"'
alias git_ls='git ls-tree -r'


git_info() {
    cwd=`pwd`
    if [[ $1 && -d $1 ]]; then
	cd $1
    fi
    git remote show origin
    cd $cwd
}
