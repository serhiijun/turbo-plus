. ~/turbo-plus/packs/colors.bash
. ~/turbo-plus/packs/aliases.bash
. ~/turbo-plus/workers/conductor_worker.bash
. ~/turbo-plus/workers/bridge_worker.bash
. ~/turbo-plus/packs/turboenv.bash
. ~/turbo-plus/packs/ps1.bash
_action () {
  local CURRENT=$(pwd)
  local SKIP_FILES=(".git .vscode .DS_Store .gitignore .gitattributes README.md")
  case "$1" in
    "send" )
      _conductor
      ;;
    "brew" )
      _bridge 
      ;;
  esac
}

alias turbo="_action"
