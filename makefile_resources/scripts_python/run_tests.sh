export APPNAME=$1
export USERNAME=$2
export PLATFORM=$3
su -m $USERNAME <<'EOF'
  source .tmp/bash-environment-manager-master/makefile_resources/scripts_python/env.sh ${APPNAME} ${USERNAME} ${PLATFORM}
  if [ -f ".repo/tests" ];
  then
    ${APPNAME} system version
    ${APPNAME} system selftest
    ${APPNAME} system selfcoverage
  fi
EOF
