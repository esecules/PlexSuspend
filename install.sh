#! /bin/bash
INSTALL_PATH=/opt/PlexSuspend
echo $INSTALL_PATH
if [ -a $INSTALL_PATH ]
then
    rm -i $INSTALL_PATH/*
    cp suspend* $INSTALL_PATH
else
    mkdir -p $INSTALL_PATH
    cp suspend* $INSTALL_PATH
fi;
chmod +x $INSTALL_PATH/suspend*
crontab -l > root_cron
if grep --quiet $INSTALL_PATH root_cron
then
    echo "cronjob already exists"
else
    echo "adding cronjob"
    # Run every 5 minutes
    echo "*/5 * * * * $INSTALL_PATH/suspend_check >> /var/log/suspend_log 2>&1 && $INSTALL_PATH/suspend_script >> /var/log/suspend_log >/dev/null 2>&1" >> root_cron
    crontab root_cron
fi
  rm root_cron
  
