export APPNAME=$1
export USERNAME=$2
export PLATFORM=$3
su -m $USERNAME <<'EOF'
  source maintenance/general/pyenv/env.sh
  if [ -d $APPNAME ] 
  then
    eval cd $APPNAME
    pip install --user .
  fi
EOF
