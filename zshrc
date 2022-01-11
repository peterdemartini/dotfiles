# .zshrc is sourced for interactive shells only

# -- ZSH

# long history
HISTSIZE=1000
SAVEHIST=5000
# additional completions
fpath+=$HOME/.zfunc

# -- oh-my-zsh
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="gozilla-v2"
DEFAULT_USER=`whoami`
ENABLE_CORRECTION="false"
DISABLE_AUTO_UPDATE=true
DISABLE_MAGIC_FUNCTIONS=true # Don't escape pasted input
plugins=(
    git
    golang
    aws
    iterm2
    macos
    vscode
    zsh-syntax-highlighting
    zsh-autosuggestions
)
source $ZSH/oh-my-zsh.sh

# -- fzProjects

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git --exclude vendor'

# -- git

alias gs='git status --short --no-branch --show-stash'

eval "$(gh completion -s zsh)"

# -- Kubernetes

alias kc='kubectl'

# -- Docker

alias dc="docker-compose -f docker-compose.yml"

# -- Tab completion

zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path $HOME/.zsh/cache

# -- GPG

export GPG_TTY=$(tty)

# -- Segment

if [ -e $HOME/.segment ] ; then
  segment_dotfiles=(docker general ssh go)
  for dotfile in $segment_dotfiles ; do
    source $HOME/dev/src/github.com/segmentio/dotfiles/source/$dotfile.sh
  done

  # Regions
  alias stage-usw2="aws-okta exec stage-read -- "
  alias prod-usw2="aws-okta exec prod-read -- "
  alias stage-euw1="aws-okta exec stage-euw1-read -- "
  alias prod-euw1="aws-okta exec prod-euw1-read -- "

  # Okta
  export AWS_OKTA_MFA_FACTOR_TYPE=push
fi
