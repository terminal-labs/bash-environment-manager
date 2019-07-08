export APPNAME=$1
export USERNAME=$2
export PLATFORM=$3
su -m $USERNAME <<'EOF'
  source maintenance/general/conda/env.sh
  ${APPNAME} system version
  ${APPNAME} system selftest
  ${APPNAME} system selfcoverage
EOF