export APPNAME=$1
export USERNAME=$2
export PLATFORM=$3
su -m $USERNAME <<'EOF'
  source maintenance/general/pyenv/env.sh
  if [ -f dependencies/pip.txt ] 
  then
    pip install --user -r dependencies/pip.txt
  fi
EOF
