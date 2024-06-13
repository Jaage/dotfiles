alias ni="vim /etc/nixos/configuration.nix"
alias fim="vi /etc/nixos/flake.nix"
alias fenv="nix flake new -t github:nix-community/nix-direnv ."
alias sw="sh ~/dotfiles/switch.sh"
alias sf="sh ~/dotfiles/sf.sh"
alias mf1="sudo legion_cli maximumfanspeed-enable"
alias mf0="sudo legion_cli maximumfanspeed-disable"
alias ls="eza"
#function cls() { ls -l ${1} | awk '{k=0;for(i=0;i<=8;i++)k+=((substr($1,i+2,1)~/[rwx]/) *2^(8-i));if(k)printf("%0o ",k);print}'; }
function cls { find ${1:-.} -maxdepth 1 -printf "%m:%f\n" }
eval "$(zoxide init --cmd cd zsh)"
eval "fastfetch"
export MODULAR_HOME="~/.modular"
export PATH="~/.modular/pkg/packages.modular.com_mojo/bin:$PATH"
eval "$(direnv hook zsh)"

# fzf integration
eval "$(fzf --zsh)"

# Set directory to store zinit and plugins in
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download zinit if not present
if [ ! -d "$ZINIT_HOME" ]; then
  mkdir -p "$(dirname $ZINIT_HOME)"
  git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

source "${ZINIT_HOME}/zinit.zsh"

zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions

autoload -U compinit && compinit

# Autosuggestion
bindkey '^f' autosuggest-accept
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
