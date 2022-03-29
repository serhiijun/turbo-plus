#!/bin/bash
#-> This file makes relocation files in to
#-> production folder:
#-> /home/deployuser/apps/#{app name where you ENTERED command}

_make_dir_call_iterating () {
  local C_FOLDER=$1
  local TO_FOLDER=$2
  echo "Creating new..."
  mkdir "$TO_FOLDER"
  if [ -d "$TO_FOLDER" ]; then
    echo -e "${BGreen}>${NOCOLOR} ${UPurple}$(basename $TO_FOLDER)${NOCOLOR} ${BGreen}created${NOCOLOR} in apps!"
    echo "Starting copying..."
    _iterate_content $C_FOLDER $TO_FOLDER
  else
    echo "Creating directory error!"
    exit 0
  fi
}

_iterate_content () {
  local C_FOLDER=$1
  local TO_FOLDER=$2
  for f in $(ls -A $CURRENT); do
    if [[ " ${SKIP_FILES[*]} " == *"$f"* ]]; then
      echo -e "${BYellow}-${NOCOLOR} $f ${BYellow}skipped.${NOCOLOR}"
    else
      if [ -d "$CURRENT/${f}" ]; then
        local NEW_PATH="$TO_FOLDER/${f#*$(basename $CURRENT)}"
        cp -R "$CURRENT/$f/" $NEW_PATH
        if [ -d "$NEW_PATH" ]; then
          echo -e "${Green}+${NOCOLOR} $f ${UPurple}folder${NOCOLOR} ${Green}copied.${NOCOLOR}"
        else 
          echo -e "${Red}ERROR Folder copying ${NOCOLOR}"
        fi
      elif [ -f "$CURRENT/${f}" ]; then
        local NEW_PATH="$TO_FOLDER/${f#*$(basename $CURRENT)}"
        cp "$CURRENT/$f" $NEW_PATH

        if [ -f "$NEW_PATH" ]; then
          echo -e "${Green}+${NOCOLOR} $f ${UBlue}file${NOCOLOR} ${Green}copied.${NOCOLOR}"
        else 
          echo -e "${Red}ERROR File copying ${NOCOLOR}"
        fi
      else
        echo "${f} Something went wrong!";
        exit 0
      fi
    fi
  done
}

_conductor () {
  local C_FOLDER=$(basename $CURRENT)
  local TO_FOLDER="$HOME/apps/$C_FOLDER"

  if [ -d "$TO_FOLDER" ]; then
    read -p "$(echo -e "Directory exists. Remove ${BYellow}$(basename $TO_FOLDER)${NOCOLOR}? [y/n] ")" -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
      rm -rf $TO_FOLDER
      if [ -d "$TO_FOLDER" ]; then
        echo "$TO_FOLDER not removed"
      else
        echo -e "${BRed}x${NOCOLOR} ${UPurple}$(basename $TO_FOLDER)${NOCOLOR} ${BRed}removed${NOCOLOR} from apps!"
        _make_dir_call_iterating $C_FOLDER $TO_FOLDER
      fi
    else
      exit 0
    fi
  else
    _make_dir_call_iterating $C_FOLDER $TO_FOLDER
  fi
}