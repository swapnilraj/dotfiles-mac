bash_folder="$HOME/.bash"

function source_if_exists() {
  if [ -f $1 ]; then
    source $1
  fi
}

source_if_exists $bash_folder/.bash_colours

source_if_exists $bash_folder/.bashenv

source_if_exists $bash_folder/.bashrc

source_if_exists $bash_folder/.bash_alias

source_if_exists $bash_folder/.bash_fun

source_if_exists $bash_folder/.bash_prompt

# Remove colours from the environment
bash_colours_unset
unset -f bash_colours_unset
unset -v bash_folder

source_if_exists /usr/local/etc/profile.d/autojump.sh

source_if_exists ~/.fzf.bash

# added by Nix installer
[ -e /Users/thawne/.nix-profile/etc/profile.d/nix.sh ] && . /Users/thawne/.nix-profile/etc/profile.d/nix.sh;
