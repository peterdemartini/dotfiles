# .zshrc is sourced for interactive shells only

# -- ZSH

# long history
HISTSIZE=10000
SAVEHIST=50000
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
    zsh-navigation-tools
    zsh-autosuggestions
    zsh-interactive-cd
)
source $ZSH/oh-my-zsh.sh

# Make sure that this runs after the widgets the plugins are loaded
autoload znt-history-widget
zle -N znt-history-widget
bindkey "^R" znt-history-widget

# more fish like autosuggestions
SH_AUTOSUGGEST_STRATEGY=(history completion) 

# -- fzProjects

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git --exclude vendor --reverse'

# -- gnu

alias sort='gsort'
alias sed='gnu-sed'

# -- vim

alias vi='/opt/homebrew/bin/vim'
alias vim='/opt/homebrew/bin/nvim'

# -- Node.js / NVM

# load_node () {
#   unalias node
#   unalias npm
#   n 14
# }

# alias node='load_node; node $@'
# alias npm='load_node; npm $@'

# GNU aliases

alias sed='gsed'
alias sort='gsort'

# -- git

alias gs='git status --short --no-branch --show-stash'
alias gl='git checkout'
alias gup='git switch $(git symbolic-ref refs/remotes/origin/HEAD | sed "s@^refs/remotes/origin/@@") && git pull origin $(git symbolic-ref refs/remotes/origin/HEAD | sed "s@^refs/remotes/origin/@@")'
alias gross='git fetch && git checkout $(git symbolic-ref refs/remotes/origin/HEAD | sed "s@^refs/remotes/origin/@@") && git reset --hard origin/$(git symbolic-ref refs/remotes/origin/HEAD | sed "s@^refs/remotes/origin/@@") && git push origin $(git symbolic-ref refs/remotes/origin/HEAD | sed 's@^refs/remotes/origin/@@'):staging --force && git fetch && git checkout staging && git reset --hard origin/staging'
alias switch-to-branch="git bl --color=always | fzf | awk '{print \$1}' | xargs git checkout"
alias switch-to-pr="gh pr list | fzf | awk '{print \$1}' | xargs gh pr checkout"

eval "$(gh completion -s zsh)"

# -- Kubernetes

alias kc='kubectl'

# -- Docker

alias dc="docker-compose -f docker-compose.yml"

# -- Dates

alias now-utc="date -u +\"%Y-%m-%dT%H:%M:%SZ\""
alias now="date +\"%Y-%m-%dT%H:%M:%SZ\""

# -- Tab completion

zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path $HOME/.zsh/cache

# -- GPG

export GPG_TTY=$(tty)

# -- Segment

if [ -e $HOME/.segment ] ; then
  source $HOME/dev/src/github.com/segmentio/dotfiles/index.sh

  # Regions
  alias sr-usw2="aws-okta exec stage-read -- "
  alias pr-usw2="aws-okta exec prod-read -- "
  alias sr-euw1="aws-okta exec stage-euw1-read -- "
  alias pr-euw1="aws-okta exec prod-euw1-read -- "
  
  alias sw-usw2="aws-okta exec stage-write -- "
  alias pw-usw2="aws-okta exec prod-write -- "
  alias sw-euw1="aws-okta exec stage-euw1-write -- "
  alias pw-euw1="aws-okta exec prod-euw1-write -- "

  # Okta
  export AWS_OKTA_MFA_FACTOR_TYPE=push
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

eval "$(starship init zsh)"

source ~/.iterm2_shell_integration.zsh

. $(brew --prefix asdf)/libexec/asdf.sh
