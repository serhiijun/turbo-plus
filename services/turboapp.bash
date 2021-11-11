#
#-> turbo log
#-> tail -f $MYAPP_PATH/log/production.log
#
#-> turbo sidekiq-log
#-> journalctl -u sidekiq -n100 -f
# Show real time sidekiq logs