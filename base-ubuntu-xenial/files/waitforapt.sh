#!/bin/bash

sudo systemctl stop apt-daily.service
sudo systemctl kill --kill-who=all apt-daily.service

# https://unix.stackexchange.com/questions/315502/how-to-disable-apt-daily-service-on-ubuntu-cloud-vm-image
while ! (systemctl list-units --all apt-daily.service | fgrep -q dead); do 
  echo "Sleeping"
  sleep 1 
done

while fuser /var/lib/dpkg/lock >/dev/null ; do 
  echo "Sleeping"
  sleep 1 
done

# https://unix.stackexchange.com/questions/315502/how-to-disable-apt-daily-service-on-ubuntu-cloud-vm-image
while : ; do
  sleep 1
  echo $( ps aux | grep -c lock_is_held ) processes are using apt.
  ps aux | grep -i apt
  [[ $( ps aux | grep -c lock_is_held ) > 2 ]] || break
done
