function source_if_exists() {
  if [ -f $1 ]; then
    source $1
  fi
}

source_if_exists ~/.bashrc
source_if_exists /etc/static/bashrc
