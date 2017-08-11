#!/usr/bin/env bash

sudo apt-get update
sudo apt-get -y install git ssh

# clone dotfiles
ssh-keyscan github.com > github_public_key
if ssh-keygen -lf github_public_key | grep -q "SHA256:nThbg6kXUpJWGl7E1IGOCspRomTxdCARLviKw6E5SY8"
then 
   cat github_public_key >> ~/.ssh/known_hosts;
   rm github_public_key;
else
   echo "Github fingerprint NOT OK!!! Aborting...";
   rm github_public_key;
   return;
fi
git clone git@github.com:gwaramadze/dotfiles.git .dotfiles

ln -sv ~/.dotfiles/.bash_profile ~
