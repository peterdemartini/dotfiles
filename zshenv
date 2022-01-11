
# .zshenv is always sourced

#
# Path
#

export PATH=$PATH:/usr/libexec
export PATH=$PATH:/usr/X11/bin
export PATH=/usr/local/sbin:$PATH
export PATH=$HOME/bin:$PATH

#
# FZF
#
export FZF_DEFAULT_OPTS="--bind='ctrl-o:execute(code {})+abort' --exact --ansi"

#
# Node.js
#

export NODE_PATH=/usr/local/lib/node_modules
export PATH=/usr/local/share/npm/bin:$PATH
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

#
# Editor
#

export EDITOR="nvim"

#
# Git
#

export GITHUB_USERNAME="peterdemartini"

#
# Node
#

export NODE_ENV="development"

#
# Go
#

if [ -e $HOME/.segment ] ; then
  export GOPATH=$HOME/dev
else
  export GOPATH=$HOME/go
fi
export PATH=$GOPATH/bin:$PATH
export PATH=/usr/local/opt/go/libexec/bin:$PATH
export GOPRIVATE=github.com/segment*

#
# Segment
#

if [ -e $HOME/.segment ] ; then
  export SEGMENT_TEAM=platform
  export CONNECTIONS_SERVICE_CLIENT_ID=dev-client-id
  export CONNECTIONS_SERVICE_CLIENT_SECRET=dev-client-secret
  export PLATFORM_AUTHZ_CLIENT_ID=dev-client-id
  export PLATFORM_AUTHZ_CLIENT_SECRET=dev-client-secret
fi
