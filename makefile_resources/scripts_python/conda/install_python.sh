export APPNAME=$1
export USERNAME=$2
export PLATFORM=$3
su -m ${USERNAME} <<'EOF'
  USER=${USERNAME}
  SUDO_USER=${USERNAME}
  USERNAME=${USERNAME}
  unset SUDO_UID SUDO_GID SUDO_USER
  if [ $PLATFORM == "vagrant" ]; then
    HOME=/home/${USERNAME}
    LOGNAME=/home/${USERNAME}
    wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
    bash Miniconda3-latest-Linux-x86_64.sh -b -p /home/vagrant/miniconda3
    export PATH="/home/vagrant/miniconda3/bin:$PATH"
    source /home/vagrant/miniconda3/etc/profile.d/conda.sh;
  elif [ $PLATFORM == "linux" ]
  then
    HOME=/home/${USERNAME}
    LOGNAME=/home/${USERNAME}
    wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
    bash Miniconda3-latest-Linux-x86_64.sh -b
    export PATH="/home/${USERNAME}/miniconda3/bin:$PATH"
    source /home/${USERNAME}/miniconda3/etc/profile.d/conda.sh;
  elif [ $PLATFORM == "mac" ]
  then
    HOME=/Users/${USERNAME}
    wget https://repo.anaconda.com/miniconda/Miniconda3-latest-MacOSX-x86_64.sh
    bash Miniconda3-latest-MacOSX-x86_64.sh -b
    export PATH="/Users/${USERNAME}/miniconda3/bin:$PATH"
    source /Users/${USERNAME}/miniconda3/etc/profile.d/conda.sh;
  else
    echo "not implemented yet"
  fi
  rm Miniconda3-latest*

  if [ $PLATFORM == "vagrant" ]; then
    source /home/${USERNAME}/.bashrc
    conda init bash
    source /home/${USERNAME}/.bashrc
  elif [ $PLATFORM == "linux" ]
  then
    source /home/${USERNAME}/.bashrc
    conda init bash
    source /home/${USERNAME}/.bashrc
  elif [ $PLATFORM == "mac" ]
  then
    source /Users/${USERNAME}/.bash_profile
    conda init bash
    source /Users/${USERNAME}/.bash_profile
  else
    echo "not implemented yet"
  fi

  conda --version
  conda update -y conda
  conda --version
  conda create -y -n ${APPNAME} python=3.6.9
  conda activate ${APPNAME}

  pip install "setuptools<=45"
  pip install --upgrade pip
EOF
