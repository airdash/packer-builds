#!/bin/sh

export DEBIAN_FRONTEND=noninteractive
export DEBIAN_PRIORITY=critical

sudo systemctl disable apt-daily.timer
sudo systemctl mask apt-daily.service

echo 'APT::Periodic::Enable \"0\";' | sudo tee /etc/apt/apt.conf.d/02periodic
sudo mkdir -p /etc/systemd/system/apt-daily.timer.d
echo -e '[Timer]\nPersistent=false' | sudo tee /etc/systemd/system/apt-daily.timer.d/apt-daily.timer.conf

while ! ( sudo apt-get update ); do echo 'Sleeping for apt-daily'; sleep 1; done

while ! ( sudo apt-get dist-upgrade -y --force-yes -o 'Dpkg::Options::=--force-confdef' -o 'Dpkg::Options::=--force-confold' ); do 
  echo 'Sleeping for apt-daily'
  sleep 1 
done

sudo apt-get autoremove -y
