## default run mdoe = user

export APPNAME=$1
export USERNAME=$2
export PLATFORM=$3
export PYTHONVERSION=$4
export DPENAME=$5
export USER=$6
export USERHOME=$7
export MACHINE=$8
export CMD=$9

LOGNAME=$USERNAME

source .tmp/bash-environment-manager-master/lib/bash/vars.sh
source .tmp/bash-environment-manager-master/lib/runners/dpe/modules/getusername.sh
source .tmp/bash-environment-manager-master/lib/runners/dpe/modules/changedir.sh

export PATH=$PLATFORM/platform/miniconda3/bin:$PATH

source activate $APPNAME

echo "dpe v2020.1.2"
conda --version
python --version
nvm --version
node --version
lpass --version
salt --version
terraform -version
vagrant --version

rambo --version
inflation version
echo "utilitiespackage" $(utilitiespackage system version)