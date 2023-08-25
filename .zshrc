# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

#------------------------------------------------------------------------------#
#                                   LOCALE                                     #
#------------------------------------------------------------------------------#
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8

#------------------------------------------------------------------------------#
#                               EXPORTS DEFAULT                                #
#------------------------------------------------------------------------------#
# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export PATH="$PATH:/usr/local/bin"
export PATH="$PATH:$HOME/.yarn/bin:$HOME/.yarn-config/global/node_modules/.bin"

#------------------------------------------------------------------------------#
#                          OH MY ZSH CONFIG AND PLUGINS                        #
#------------------------------------------------------------------------------#
plugins=(
  brew
  sudo
  ssh-agent
  systemd
  common-aliases
  zsh-autosuggestions
  zsh-syntax-highlighting
  vscode
  git
  git-flow
  docker
  docker-compose
  vagrant
  mvn
  npm
  golang
)

source $ZSH/oh-my-zsh.sh

#------------------------------------------------------------------------------#
#                                   ZSH THEME                                  #
#------------------------------------------------------------------------------#
ZSH_THEME="spaceship"

#------------------------------------------------------------------------------#
#                               SPACESHIP CONFIG                               #
#------------------------------------------------------------------------------#
SPACESHIP_PROMPT_ORDER=(
  user          # Username section
  dir           # Current directory section
  host          # Hostname section
  git           # Git section (git_branch + git_status)
  hg            # Mercurial section (hg_branch  + hg_status)
  package        # Package version
  node           # Node.js section
  python         # Python section
  golang         # Go section
  java           # Java section
  docker         # Docker section
  docker_compose # Docker section
  aws            # Amazon Web Services section
  dotnet         # .NET section
  kubectl        # Kubectl context section
  ansible        # Ansible section
  terraform      # Terraform workspace section
  line_sep      # Line break
  char          # Prompt character
  jobs          # Background jobs indicator
  exit_code     # Exit code section
  sudo           # Sudo indicator
)
SPACESHIP_USER_SHOW=always
SPACESHIP_PROMPT_ADD_NEWLINE=false
SPACESHIP_CHAR_SYMBOL="👽"
SPACESHIP_CHAR_SUFFIX=" "
SPACESHIP_PACKAGE_COLOR="green"

#------------------------------------------------------------------------------#
#                  PREFERRED EDITOR FOR LOCAL AND REMOTE SESSIONS              #
#------------------------------------------------------------------------------#
if [[ -n $SSH_CONNECTION ]]; then
	export EDITOR='vim'
else
	export EDITOR='mvim'
fi

#------------------------------------------------------------------------------#
#                                   ALIASES                                    #
#------------------------------------------------------------------------------#
alias config="code ~/.zshrc"
alias gitconfig="code ~/.gitconfig"
alias install="sudo apt install"
alias remove="sudo apt remove --purge"
alias update="sudo -- sh -c 'apt update; apt upgrade -y; apt full-upgrade -y; apt autoremove -y; apt autoclean -y'"
# sdkman
alias sdki='sdk install'
alias sdkun='sdk uninstall'
alias list='sdk list'
alias sdku='sdk use'
alias sdkd='sdk default'
alias sdkc='sdk current'
alias sdkup='sdk upgrade'
alias sdkv='sdk version'
alias sdkb='sdk broadcast'
alias sdko='sdk offline'
alias sdksu='sdk selfupdate'
alias sdkf='sdk flush'
# Just bcoz clr shorter than clear
alias clr='clear'
# Go to the /home/$USER (~) directory and clears window of your terminal
alias q="~ && clear"
# Folders Shortcuts
[ -d ~/Downloads ]            && alias dl='cd ~/Downloads'
[ -d ~/Desktop ]              && alias dt='cd ~/Desktop'
[ -d ~/Projects ]             && alias pj='cd ~/Projects'
[ -d ~/Projects/Forks ]       && alias pjf='cd ~/Projects/Forks'
[ -d ~/Projects/Playground ]  && alias pjl='cd ~/Projects/Playground'
[ -d ~/Projects/Repos ]       && alias pjr='cd ~/Projects/Repos'
# Commands Shortcuts
alias e="$EDITOR"
alias -- +x='chmod +x'
alias x+='chmod +x'
# Open aliases
alias open='open_command'
alias o='open'
alias oo='open .'
alias term='open -a iterm.app'
# Quick reload of zsh environment
alias reload="source $HOME/.zshrc"
# My IP
alias myip='ifconfig | sed -En "s/127.0.0.1//;s/.*inet (addr:)?(([0-9]*\.){3}[0-9]*).*/\2/p"'
# Show $PATH in readable view
alias path='echo -e ${PATH//:/\\n}'
# Download web page with all assets
alias getpage='wget --no-clobber --page-requisites --html-extension --convert-links --no-host-directories'
# Download file with original filename
alias get="curl -O -L"
alias git-root='cd $(git rev-parse --show-toplevel)'

#------------------------------------------------------------------------------#
#                      AUTOSUGGESTIONS AND HIGHLIGHTING CONFIG                 #
#------------------------------------------------------------------------------#
source $ZSH_CUSTOM/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source $ZSH_CUSTOM/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

#------------------------------------------------------------------------------#
#                                  NVM CONFIG                                  #
#------------------------------------------------------------------------------#
export NVM_DIR="$HOME/.nvm"
# [[ -s $HOME/.nvm/nvm.sh ]] && . $HOME/.nvm/nvm.sh  # This loads NVM
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

#------------------------------------------------------------------------------#
#                                 SDKMAN CONFIG                                #
#------------------------------------------------------------------------------#
#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
