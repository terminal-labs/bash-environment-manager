export APPNAME=-appname-
export USERNAME=-username-
export PLATFORM=-platform-
export PYENV_ROOT=/home/$USERNAME/pyenv/envs/$APPNAME/.pyenv
export PATH="/home/$USERNAME/.local/bin:$PATH"
export PATH="$PYENV_ROOT/bin:$PATH"
export USE_GIT_URI="true"
export PY_ENV_VERSION=3.6.6
eval "$(pyenv init -)"
pyenv install -s ${PY_ENV_VERSION}
pyenv global ${PY_ENV_VERSION}
pyenv global
