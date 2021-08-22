JAVA_HOME=/usr/lib/jvm/java-11-amazon-corretto
export JAVA_HOME
export PATH=$PATH:$JAVA_HOME

GOPATH=/home/caiocichetti/go
export GOPATH

export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin

export ANDROID_HOME=~/Android/Sdk
export ANDROID_SDK_ROOT=~$ANDROID_HOME 
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

# Path to your oh-my-zsh installation.
export ZSH="/home/caiocichetti/.oh-my-zsh"
export PATH="$PATH:/usr/local/bin"
export PATH="$PATH:$HOME/.yarn/bin:$HOME/.yarn-config/global/node_modules/.bin"

export NVM_DIR="$HOME/.nvm"
# [[ -s $HOME/.nvm/nvm.sh ]] && . $HOME/.nvm/nvm.sh  # This loads NVM
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(git yarn nvm sudo npm)

source $ZSH/oh-my-zsh.sh
unsetopt nomatch

# Aliases
alias config="code ~/.zshrc"
alias reload="source ~/.zshrc"
alias gitconfig="code ~/.gitconfig"
alias gcm="git commit -m"
alias gcmn="git commit --no-verify -m"
alias install="sudo apt install"
alias remove="sudo apt remove --purge"
alias update="sudo -- sh -c 'apt update; apt upgrade -y; apt full-upgrade -y; apt autoremove -y; apt autoclean -y'"
alias cra="yarn create react-app"
alias rn="npx react-native"

function rebase() {
  COMMIT="$(sed -e 's/[[:space:]]*$//' <<<${@})"
  git rebase -i HEAD~${COMMIT}
}

# Powerlevel10k 
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

#Spaceship
SPACESHIP_PROMPT_ORDER=(
  user                # Username section
  dir                  # Current directory section
  host                # Hostname section
  git                  # Git section (git_branch + git_status)
  hg                  # Mercurial section (hg_branch  + hg_status)
  node              # Node Version
  docker           # Docker
  exec_time     # Execution time
  line_sep        # Line break
  vi_mode       # Vi-mode indicator
  jobs              # Background jobs indicator
  exit_code     # Exit code section
  char             # Prompt character
)

SPACESHIP_USER_SHOW=always
SPACESHIP_PROMPT_ADD_NEWLINE=false
SPACESHIP_CHAR_SYMBOL="❯"
SPACESHIP_CHAR_SUFFIX=" "


# Simplify prompt if we're using Hyper
if [[ "$TERM_PROGRAM" == "Hyper" ]]; then
  SPACESHIP_PROMPT_SEPARATE_LINE=false
  SPACESHIP_DIR_SHOW=false
  SPACESHIP_GIT_BRANCH_SHOW=false
fi

### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing DHARMA Initiative Plugin Manager (zdharma/zinit)…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zinit-zsh/z-a-patch-dl \
    zinit-zsh/z-a-as-monitor \
    zinit-zsh/z-a-bin-gem-node

### End of Zinit's installer chunk

zinit light zdharma/fast-syntax-highlighting
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-history-substring-search
zinit light zsh-users/zsh-completions
zinit light buonomo/yarn-completion
