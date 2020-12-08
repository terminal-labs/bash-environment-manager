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

USER=$USERNAME
SUDO_USER=$USERNAME
LOGNAME=$USERNAME

source .tmp/bash-environment-manager-master/lib/bash/lib.sh

if [[ $MACHINE == "Mac" ]];
then
  export PATH="/Users/$USERNAME/miniconda3/bin:$PATH"
  source /Users/$USERNAME/miniconda3/etc/profile.d/conda.sh
else
  export PATH="/home/$USERNAME/miniconda3/bin:$PATH"
  source /home/$USERNAME/miniconda3/etc/profile.d/conda.sh
fi

conda activate ${APPNAME}

if [[ -f "dependencies/repos-pip.txt" ]];
then
  cat dependencies/repos-pip.txt | while read line
  do
    install_project_repo_pip $line
  done
else
  :
fi

if [[ -f "setup.py" ]];
then
  pip install -e .
else
  if [[ -d $APPNAME ]] && [[ ! -z $APPNAME ]];
  then
    cd $APPNAME
    pip install -e .
  fi
fi
