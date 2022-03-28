#!/bin/bash
#-> This file makes relocation files in to
#-> production folder:
#-> /home/deployuser/apps/#{app name where you ENTERED command}
testt () {
  FILES="$HOME/testone/*"
  FILES2="$HOME/testtwo/"
  for f in $FILES; do
    if [ -d "${f}" ]; then
      #->content (files and subfolders)
      #copy to folder
      #->which will be created (folder means)
      echo "${f} is a directory";
      # cp -RT "$f" "$FILES2$(basename \"$f\")"
      cp -RT "$f" "$FILES2"
    elif [ -f "${f}" ]; then
      echo "${f} is a file";
    else
      echo "${f} is NOTHING";
    fi
  done
}
testt