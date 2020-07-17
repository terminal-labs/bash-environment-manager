export APPNAME=$1
export USERNAME=$2

source .tmp/bash-environment-manager-master/bash_scripts/lib.sh
getmachine
MACHINE=$_MACHINE
export MACHINE

su -m $USERNAME << 'EOF'
  if [ $PLATFORM == "linux" ]; then
    cp .tmp/bash-environment-manager-master/makefile_resources/scripts_rambo/linux_activate.sh activate.sh
  elif [ $PLATFORM == "Mac" ]
  then
    cp .tmp/bash-environment-manager-master/makefile_resources/scripts_rambo/mac_activate.sh activate.sh
   else
    echo "not implemented yet"
  fi
  sed "s/-appname-/$APPNAME/g" activate.sh > activate.tmp
  rm activate.sh
  mv activate.tmp activate.sh
  sed "s/-username-/$USERNAME/g" activate.sh > activate.tmp
  rm activate.sh
  mv activate.tmp activate.sh
  sed "s/-platform-/$PLATFORM/g" activate.sh > activate.tmp
  rm activate.sh
  mv activate.tmp activate.sh
EOF
