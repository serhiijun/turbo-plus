#
# -z == True if zero length string
# -n == True if the length is non-zero
#

_gemset_name(){
  string=$(rvm gemset name)
  # the same to string=`rvm gemset name`
  if [[ $string == *"/"* ]]; then
    echo "default"
  else
    echo $string
  fi
}

_git_branch() {
  STATUS=$(git status 2>/dev/null | awk '/^On branch / {printf($3)}')
  if [ -n "$STATUS" ]; then
      echo -ne "$STATUS"
  fi
}

_git_status() {
  STATUS=$(git status 2>/dev/null | awk '/^Initial commit/ {printf("*")}')
  
  if [ -z "$STATUS" ]; then
    STATUS=$(git status 2>/dev/null | awk '/^Untracked files/ {printf("*")}')
  fi
  if [ -z "$STATUS" ]; then
    STATUS=$(git status 2>/dev/null | awk '/^Changes not staged / {printf("*")}')
  fi
  if [ -z "$STATUS" ]; then
    STATUS=$(git status 2>/dev/null | awk '/^Changes to be committed/ {printf("*")}')
  fi
  if [ -z "$STATUS" ]; then
    STATUS=$(git status 2>/dev/null | awk '/^Your branch is ahead of/ {printf("")}')
  fi
  # puts STATUS
  if [ -n "$STATUS" ]; then
    echo -ne "$STATUS "
  fi
}

export PS1='💎 \[\e[35m\]\[\e[1m\]$(gemset_name)\[\e[0m\]\[\e[0m\] \[\e[97m\]\[\e[1m\]➜ \[\e[0m\]\[\e[0m\]\[\e[96m\]\[\e[1m\]\w\[\e[0m\]\[\e[0m\] \[\e[31m\]\[\e[1m\]$(_git_branch)\[\e[0m\]\[\e[0m\] \[\e[31m\]\[\e[1m\]$(_git_status)\[\e[0m\]\[\e[0m\]'
