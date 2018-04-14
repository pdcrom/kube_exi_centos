#!/bin/sh
# (1) IP (2) user (3) passwd
#echo $1 $2 $3i

sshpass -p $3 ssh -t $2@$1 bash -c "'
mkdir .ssh
sudo chmod 700 .ssh
'"

sshpass -p $3 scp ~/.ssh/id_rsa.pub $2@$1:~/.ssh

sshpass -p $3 ssh -t $2@$1 bash -c "'
mv .ssh/id_rsa.pub .ssh/authorized_keys
sudo chmod 600 .ssh/authorized_keys
'"
