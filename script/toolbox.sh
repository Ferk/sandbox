#!/bin/bash -eux


XDG_CONFIG_GIT="https://github.com/Ferk/xdg_config"
USER_BIN_GIT="https://github.com/Ferk/scripts"

SSH_USER=${SSH_USERNAME:-vagrant}
SSH_USER_HOME=${SSH_USER_HOME:-/home/${SSH_USER}}

echo "==> Installing Git"
yum -y install git

echo "==> Installing XDG_CONFIG from $XDG_CONFIG_GIT"
rm -rf "$SSH_USER_HOME/.config"
git clone "$XDG_CONFIG_GIT" "$SSH_USER_HOME/.config"
sudo -u $SSH_USER "$SSH_USER_HOME/.config/symlink.sh" -f

echo "==> Installing ~/bin scripts from $USER_BIN_GIT"
rm -rf "$SSH_USER_HOME/bin"
git clone "$USER_BIN_GIT" "$SSH_USER_HOME/bin"


echo "==> Installing basic set of tools"
yum -y install bash-completion the_silver_searcher moreutils colordiff
	zip unzip
