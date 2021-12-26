#!/bin/bash

curl -L https://get.oh-my.fish | fish

echo /usr/local/bin/fish | sudo tee -a /etc/shells

chsh -s /usr/local/bin/fish

brew bundle install --file=Brewfile

cp ./rcrc ~/.rcrc
rcup
