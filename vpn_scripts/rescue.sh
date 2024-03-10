#! /usr/bin/env bash

path="";
username="";
ip="";
pem="";
user="";

echo -e "Key to access the machine: (Without .pem)"
read -r pem
echo -e "User to access the machine: "
read -r user
echo -e "Ip to access the machine: "
read -r ip
echo -e "Archive's name e.g (fulano.detal): "
read -r username
echo -e "Put the path of your directory e.g (c/Users/fulano/): "
read -r path
echo
scp -i ".ssh/$pem.pem" $user@$ip:~/"$username".ovpn /mnt/"$path"/Desktop/