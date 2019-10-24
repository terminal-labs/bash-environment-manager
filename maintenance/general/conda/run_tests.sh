export APPNAME=$1
export USERNAME=$2
export PLATFORM=$3
su -m $USERNAME <<'EOF'
  USER=${USERNAME}
  SUDO_USER=${USERNAME}
  USERNAME=${USERNAME}
  HOME=/home/vagrant
  unset SUDO_UID SUDO_GID SUDO_USER   
  source maintenance/general/conda/env.sh
  if [ -d $APPNAME ] && [ ! -z $APPNAME ];
  then
    ${APPNAME} system version
    ${APPNAME} system selftest
    ${APPNAME} system selfcoverage
  fi
EOF
