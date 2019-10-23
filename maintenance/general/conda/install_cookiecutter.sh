export APPNAME=$1
export USERNAME=$2
export PLATFORM=$3
su -m $USERNAME <<'EOF'
  source maintenance/general/conda/env.sh
  cd $APPNAME    
  pip install cookiecutter
  cookiecutter /vagrant --no-input
EOF
