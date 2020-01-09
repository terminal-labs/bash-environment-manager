export APPNAME=$1
export USERNAME=$2
export PLATFORM=$3
su -m vagrant <<'EOF'
  USER=${USERNAME}
  SUDO_USER=${USERNAME}
  USERNAME=${USERNAME}
  unset SUDO_UID SUDO_GID SUDO_USER  
  source maintenance/general/conda/env.sh
  pip install cookiecutter
  cookiecutter /vagrant --no-input
EOF
