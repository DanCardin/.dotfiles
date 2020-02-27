function mk() {
  mkdir -p "$(dirname "$1")" && touch "$1" ;
}

function localdocker() {
  unset DOCKER_HOST
  unset DOCKER_TLS_VERIFY
  unset PYTEST_MOCK_RESOURCES_HOST
}

function remotedocker() {
  export DOCKER_HOST=tcp://desktop:2376
  export DOCKER_TLS_VERIFY=1
  export PYTEST_MOCK_RESOURCES_HOST=desktop
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

function replace {
  fd . --type file --no-ignore --print0 | xargs -0 sed -i 's/$1/$2/g'
}
