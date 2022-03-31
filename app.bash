. ~/turbo-plus/packs/colors.bash
. ~/turbo-plus/packs/aliases.bash
. ~/turbo-plus/workers/conductor_worker.bash
. ~/turbo-plus/workers/bridge_worker.bash
. ~/turbo-plus/workers/proxy_worker.bash
. ~/turbo-plus/packs/turboenv.bash
. ~/turbo-plus/packs/ps1.bash
_action () {
  local CURRENT=$(pwd)
  local SKIP_FILES=(".git .vscode .DS_Store .gitignore .gitattributes README.md")
  case "$1" in
    "send" )
      _conductor
      ;;
    "build" )
      _bridge 
      ;;
    "restart" )
      _proxy $2
      ;;

  esac
}

alias turbo="_action"
