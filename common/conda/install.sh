export APPNAME=$1
export USERNAME=$2
export PLATFORM=$3
export CMD=$4
export PYTHONVERSION=3.6.9
export DPENAME="dpe"
export USER=$USERNAME

source .tmp/bash-environment-manager-master/lib/bash/lib.sh
getmachine
MACHINE=$_MACHINE
export MACHINE

if [ $MACHINE == "Mac" ]; then
  USERHOME=/Users/$USERNAME
else
  USERHOME=/home/$USERNAME
fi
export USERHOME

mkdir -p /opt/halcyon
chmod -R 777 /opt/halcyon

if [ $MACHINE != "Mac" ]; then
  bash .tmp/bash-environment-manager-master/lib/deps/apt.sh
fi

if [[ -f "dependencies/clone.txt" ]];
then
su -m $USERNAME <<'EOF'
  source .tmp/bash-environment-manager-master/lib/bash/lib.sh
  cat dependencies/clone.txt | while read line
  do
    clone_repo $line
  done
EOF
else
  :
fi


su -m $USERNAME <<'EOF'
  bash .tmp/bash-environment-manager-master/lib/runners/conda/init.sh $APPNAME $USERNAME $PLATFORM $PYTHONVERSION $DPENAME $USER $USERHOME $MACHINE $CMD
  bash .tmp/bash-environment-manager-master/lib/runners/conda/install_app.sh $APPNAME $USERNAME $PLATFORM $PYTHONVERSION $DPENAME $USER $USERHOME $MACHINE $CMD
  bash .tmp/bash-environment-manager-master/lib/runners/conda/test_run.sh $APPNAME $USERNAME $PLATFORM $PYTHONVERSION $DPENAME $USER $USERHOME $MACHINE $CMD
EOF
