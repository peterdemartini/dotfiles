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
# This will reset the stage branch from master
alias gross="git fetch && git checkout master && git reset --hard origin/master && git push origin master:staging --force && git fetch && git checkout staging && git reset --hard origin/staging"
alias switch-to-branch="git bl --color=always | fzf | awk '{print \$1}' | xargs git checkout"
alias switch-to-pr="gh pr list | fzf | awk '{print \$1}' | xargs gh pr checkout"

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

source ~/.iterm2_shell_integration.zsh

. $(brew --prefix asdf)/libexec/asdf.sh
