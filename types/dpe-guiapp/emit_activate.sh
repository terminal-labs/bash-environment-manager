export APPNAME=$1
export USERNAME=$2
export PLATFORM=$3
export CMD=$4

if [ $CMD == "conda" ]; then
  bash .tmp/bash-environment-manager-master/common/conda/emit_activate.sh $APPNAME $USERNAME computed $CMD
fi
