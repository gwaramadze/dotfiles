# Keep this file and id_rsa on a pendrive

rsync -r id_rsa ~/.ssh/
cd ~
wget https://raw.githubusercontent.com/gwaramadze/dotfiles/master/install.sh -O - | sh