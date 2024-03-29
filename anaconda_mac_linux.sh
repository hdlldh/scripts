ANACONDA_VERSION=2022.05
BASH_FILE=~/bashrc

source ./my_os.sh
machine=$(check_os_type)
is_valid=$(is_valid_os $machine)

if [ "$is_valid" != "yes" ]; then
	echo "Neither MAC nor Linux system."
        exit
fi

if [ -z "$TOOLS_HOME" ]; then
	TOOLS_HOME=$HOME/Tools
fi

if [ "$machine" = "MacIntel" ]; then
	INSTALLER=Anaconda3-${ANACONDA_VERSION}-MacOSX-x86_64.sh
elif [ "$machine" = "MacM1" ]; then
        INSTALLER=Anaconda3-${ANACONDA_VERSION}-MacOSX-arm64.sh
else
	INSTALLER=Anaconda3-${ANACONDA_VERSION}-Linux-x86_64.sh
fi

if [ ! -f $INSTALLER ]; then
    curl -O https://repo.anaconda.com/archive/$INSTALLER
fi

TARGET_PATH=${TOOLS_HOME}/anaconda3

bash $INSTALLER -b -p $TARGET_PATH

echo '#' >> $BASH_FILE
echo '# >>> anaconda configuration >>>' >> $BASH_FILE
echo "export CONDA_HOME=${TARGET_PATH}" >> $BASH_FILE
echo 'export PATH=${CONDA_HOME}/bin:$PATH' >> $BASH_FILE
echo '#  <<< anaconda configuration <<<' >> $BASH_FILE
echo '#' >> $BASH_FILE

CONDA_INIT="${TOOLS_HOME}/anaconda3/bin/conda init bash"
#CONDA_INIT="${TOOLS_HOME}/anaconda3/bin/conda shell.bash hook"
eval ${CONDA_INIT}
