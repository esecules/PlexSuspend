# PlexSuspend
Useful script to detect when it is safe to suspend your plex media server

special thank to [ljunkie/plexWatch](https://github.com/ljunkie/plexWatch) and redditor [gandaroth](https://www.reddit.com/r/PleX/comments/2vyzh8/plex_server_sleep_when_not_being_used_wake_up/)

# Installation
run the install script as root 
```
sudo ./install.sh
```
Add this activity monitoring cron job to the crontab of eachuser you want to monitor
```
* * * * * export DISPLAY="$(w <USERNAME> | awk '$2 ~ /:[0-9]+/ {print $2}').0"; xprintidle > ~/.useridle
```
enjoy!
