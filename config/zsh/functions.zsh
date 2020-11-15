function mk() {
  mkdir -p "$(dirname "$1")" && touch "$1" ;
}

function venv() {
  if [ ! -d ".venv" ]; then
    python -m venv .venv
  fi
  source .venv/bin/activate
}

function setup {
  FILE=".envrc"
  /bin/cat <<EOM >$FILE
use_nix
if test -f ".venv/bin/activate"; then
  source .venv/bin/activate
fi
unset PS1
export SOURCE_DATE_EPOCH=315532800
EOM

  FILE="shell.nix"
  /bin/cat <<EOM >$FILE
with import <nixpkgs> {};

stdenv.mkDerivation {
  name = "$1";
  buildInputs = with pkgs; [
    pkgconfig
    openssl
    postgresql
    python38Full
  ];
}
EOM

  direnv allow
  venv
}

function sauce {
  current_dir=$(pwd)
  dir_name=$(basename "$current_dir")
  set -o allexport
  echo "source $HOME/secrets/$dir_name.env"
  source "$HOME/secrets/$dir_name.env"
  set +o allexport
}

function clean {
  rm -rf **/__pycache__/
}

function reset-master {
  git fetch
  git checkout origin/master
  git branch -D master
  git checkout -b master
}

function rebase {
  git fetch
  git rebase -i origin/master
  git branch -D master
  git checkout -b master
}

function covtest {
  coverage run -a -m py.test -x --ff "$@" && coverage report -i
}

function vpn-connect {
  cat ~/secrets/vpn | /opt/cisco/anyconnect/bin/vpn -s connect bos.knownvpn.is
}

function vpn-disconnect {
  /opt/cisco/anyconnect/bin/vpn disconnect
}
