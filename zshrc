# .zshrc is sourced for interactive shells only

# -- ZSH

# long history
HISTSIZE=1000
SAVEHIST=5000
# additional completions
fpath+=$HOME/.zfunc

# -- oh-my-zsh
ZSH=$HOME/.oh-my-zsh
ZSH_THEME=""
DEFAULT_USER=`whoami`
ENABLE_CORRECTION="false"
DISABLE_AUTO_UPDATE=true
DISABLE_MAGIC_FUNCTIONS=true # Don't escape pasted input
plugins=(
    git
    # golang
    aws
    iterm2
    macos
    vscode
    zsh-syntax-highlighting
    zsh-history-substring-search
    zsh-autosuggestions
)
source $ZSH/oh-my-zsh.sh

# -- fzProjects

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git --exclude vendor'

# -- gnu

alias sort='gsort'
alias sed='gnu-sed'

# -- Node.js / NVM

# load_node () {
#   unalias node
#   unalias npm
#   n 14
# }

# alias node='load_node; node $@'
# alias npm='load_node; npm $@'

# -- git

alias gs='git status --short --no-branch --show-stash'
# This will reset the stage branch from master
alias gross="git fetch && git checkout master && git reset --hard origin/master && git push origin master:staging --force && git fetch && git checkout staging && git reset --hard origin/staging"

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

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

eval "$(starship init zsh)"
