export APPNAME=$1
export USERNAME=$2
export PLATFORM=$3
su $USERNAME <<'EOF'
  USER=${USERNAME}
  SUDO_USER=${USERNAME}
  unset SUDO_UID SUDO_GID SUDO_USER
  if [ $PLATFORM == "vagrant" ]; then
    wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
    bash Miniconda3-latest-Linux-x86_64.sh -b -p /home/vagrant/miniconda3
    export PATH="/home/vagrant/miniconda3/bin:$PATH"
  elif [ $PLATFORM == "mac" ]
  then
    wget https://repo.anaconda.com/miniconda/Miniconda3-latest-MacOSX-x86_64.sh
    bash Miniconda3-latest-MacOSX-x86_64.sh -b
    export PATH="/Users/${USERNAME}/miniconda3/bin:$PATH"
  else
    echo "not implemented yet"
  fi
  rm Miniconda3-latest*
  conda --version
  conda update -y conda
  conda --version
  conda create -y -n ${APPNAME} python=3.6
  source activate ${APPNAME}

  pip install --upgrade setuptools
  pip install --upgrade pip
EOF
