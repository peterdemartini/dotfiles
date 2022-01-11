#!/bin/bash


case "$(uname -s)" in
    Darwin)
        echo '* Mac OS X';
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
        brew bundle install --file=Brewfile;
        ;;

    Linux)
        echo '* Linux';
        sudo apt-get install \
            build-essential procps \
            curl file git \
            broot ctags datamash \
            dateutils dep diff-so-fancy \
            direnv dust elasticsearch \
            exa fd fzf fish htop \
            nnn nodejs ripgrep rust \
            shellcheck ssh-copy-id tldr \
            tmux vim watchexec watchman \
            wget yarn yq 
        ;;

    *)
        echo "OS \"$(uname -s)\" Not supported"
        exit 1
        ;;
esac

cp ./rcrc ~/.rcrc
rcup
