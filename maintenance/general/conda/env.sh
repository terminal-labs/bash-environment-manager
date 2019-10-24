if [ $PLATFORM == "vagrant" ]
then
  source /home/${USERNAME}/.bashrc
  export PATH="/home/vagrant/miniconda3/bin:$PATH"
  export PATH="/home/vagrant/.local/bin:$PATH"
elif [ $PLATFORM == "linux" ]
then
  source /home/${USERNAME}/.bashrc
  export PATH="/home/${USERNAME}/miniconda3/bin:$PATH"
  export PATH="/home/${USERNAME}/.local/bin:$PATH"
  export PATH="/home/circleci/.local/bin:$PATH"
elif [ $PLATFORM == "mac" ]
then
  source /Users/${USERNAME}/.bash_profile
  export PATH="/Users/${USERNAME}/miniconda3/bin:$PATH"
else
  echo "not implemented yet"
fi

conda activate ${APPNAME}
