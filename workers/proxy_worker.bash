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
  #"ps" )
  #  local PWD="$(pwd)"
  #  echo 'restarting passenger'
  #  sudo passenger-config restart-app "$HOME/apps/$(basename $PWD)"
  #  ;;

  esac
}
