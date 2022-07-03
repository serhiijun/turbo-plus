_proxy () {
  local SERVICE=$1
  case "$1" in
  "ng" )
    echo 'restarting nginx'
    sudo service nginx restart
    ;;
  "sq" )
    echo 'restarting sidekiq'
    sudo service sidekiq restart
    ;;
  "go" )
    echo 'restarting anycable-go'
    sudo service anycable-go restart
   "rpc" )
    echo 'restarting anycable-rpc'
    sudo service anycable-rpc restart
  #"ps" )
  #  local PWD="$(pwd)"
  #  echo 'restarting passenger'
  #  sudo passenger-config restart-app "$HOME/apps/$(basename $PWD)"
  #  ;;

  esac
}
