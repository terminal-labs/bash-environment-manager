export APPNAME=$1
export USERNAME=$2
export PLATFORM=$3
export PYTHONVERSION=$4
export DPENAME=$5
export USER=$6
export USERHOME=$7
export MACHINE=$8
export CMD=$9

unset SUDO_UID SUDO_GID SUDO_USER

LOGNAME=$USERNAME

source .tmp/bash-environment-manager-master/lib/bash/vars.sh

cd $USERHOME
mkdir -p $DPENAME
cd $DPENAME
mkdir -p $APPNAME
cd $APPNAME

mkdir -p downloads
mkdir -p repos
mkdir -p scripts
mkdir -p bin

export PATH=$PLATFORM/platform/$DPENAME/$APPNAME/miniconda3/bin:$PATH
export PATH=$PLATFORM/platform/$DPENAME/$APPNAME/bin:$PATH

export USE_GIT_URI="true"

if [[ $MACHINE == "Mac" ]]; then
  source $USERHOME/.bash_profile
else
  source $USERHOME/.bashrc
fi

source activate $APPNAME
