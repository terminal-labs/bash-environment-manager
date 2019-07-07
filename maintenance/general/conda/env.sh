if [ $PLATFORM == "vagrant" ]; then
  export PATH="/home/vagrant/miniconda3/bin:$PATH"
elif [ $PLATFORM == "mac" ]
then
  export PATH="/Users/${USERNAME}/miniconda3/bin:$PATH"
else
  echo "not implemented yet"
fi

source activate ${APPNAME}
