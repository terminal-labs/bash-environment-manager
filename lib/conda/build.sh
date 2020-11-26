export APPNAME=$1
export USERNAME=$2
export PLATFORM=$3
su -m $USERNAME <<'EOF'
  if [ $PLATFORM == "vagrant" ]; then
    export USERNAME=vagrant
    eval "vagrant up"
    eval "vagrant ssh --command 'cd /vagrant; sudo bash .tmp/bash-environment-manager-master/makefile_resources/scripts_python/install_apt_dependencies.sh $APPNAME $USERNAME $PLATFORM'"
    eval "vagrant ssh --command 'cd /vagrant; sudo bash .tmp/bash-environment-manager-master/makefile_resources/scripts_python/install_python.sh $APPNAME $USERNAME $PLATFORM'"
    eval "vagrant ssh --command 'cd /vagrant; sudo bash .tmp/bash-environment-manager-master/makefile_resources/scripts_python/install_pip_dependencies.sh $APPNAME $USERNAME $PLATFORM'"
    eval "vagrant ssh --command 'cd /vagrant; sudo bash .tmp/bash-environment-manager-master/makefile_resources/scripts_python/install_app.sh $APPNAME $USERNAME $PLATFORM'"
    eval "vagrant ssh --command 'cd /vagrant; sudo bash .tmp/bash-environment-manager-master/makefile_resources/scripts_python/run_tests.sh $APPNAME $USERNAME $PLATFORM'"
  elif [ $PLATFORM == "linux" ]
  then
    sudo bash .tmp/bash-environment-manager-master/makefile_resources/scripts_python/install_python.sh $APPNAME $USERNAME $PLATFORM
    sudo bash .tmp/bash-environment-manager-master/makefile_resources/scripts_python/install_app.sh $APPNAME $USERNAME $PLATFORM
    sudo bash .tmp/bash-environment-manager-master/makefile_resources/scripts_python/run_tests.sh $APPNAME $USERNAME $PLATFORM
  elif [ $PLATFORM == "mac" ]
  then
    sudo bash .tmp/bash-environment-manager-master/makefile_resources/scripts_python/install_python.sh $APPNAME $USERNAME $PLATFORM
    sudo bash .tmp/bash-environment-manager-master/makefile_resources/scripts_python/install_app.sh $APPNAME $USERNAME $PLATFORM
    sudo bash .tmp/bash-environment-manager-master/makefile_resources/scripts_python/run_tests.sh $APPNAME $USERNAME $PLATFORM
  else
    echo "not implemented yet"
  fi
EOF
