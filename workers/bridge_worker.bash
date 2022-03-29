_start_message () {
  local JOB_ICON=$1
  local JOB_TEXT=$2
  local JOB_FINISH=$3
  echo -e " ${BGreen}$JOB_ICON${NOCOLOR} [${BGreen}$JOB_TEXT${NOCOLOR}] -> ${BYellow}$JOB_FINISH${NOCOLOR}"
}
_end_message () {
  local JOB_ICON=$1
  local JOB_TEXT=$2
  local JOB_FINISH=$3
  echo -e " ${BYellow}$JOB_ICON${NOCOLOR} [${BYellow}$JOB_TEXT${NOCOLOR}] -> ${BYellow}$JOB_FINISH${NOCOLOR}"
}
_bundle_job () {
  _start_message "ƒ" "Bundle job..." $TO_FOLDER
 bundle install --gemfile="$TO_FOLDER/Gemfile" #$(rvm wrapper show ruby)
 _end_message "ヽ(^o^)ノ" "Bundle job" "finish!"
 echo
}

_precompile_job () {
  _start_message "ƒ" "Precompile job..." $TO_FOLDER
  cd "$TO_FOLDER" && rails assets:precompile
  cd "$CURRENT"
  _end_message "(ﾉ^_^)ﾉ" "Precompile job" "finish!"
  echo
}

_db_create_job () {
  _start_message "ƒ" "Create database job..." $TO_FOLDER
  cd "$TO_FOLDER" && rails db:create
  cd "$CURRENT"
  _end_message "ლ(╹◡╹ლ)" "Create database job" "finish!"
  echo
}

_db_migrate_job () {
  _start_message "ƒ" "Migrate database job..." $TO_FOLDER
  cd "$TO_FOLDER" && rails db:migrate
  cd "$CURRENT"
  _end_message "＼(^o^)／" "Migrate database job" "finish!"
  echo
}

_bridge () {
  local C_FOLDER=$(basename $CURRENT)
  local TO_FOLDER="$HOME/apps/$C_FOLDER"
  echo -e "${BYellow}Starting jobs...${NOCOLOR}"
 _bundle_job
 _precompile_job
 _db_create_job
 _db_migrate_job
}
