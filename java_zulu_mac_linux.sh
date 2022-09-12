JAVA_MAJOR_VER=8
JAVA_VER=jdk8.0.345
ZULU_VER=zulu8.64.0.19
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

echo '#' >> $BASH_FILE
echo '# >>> java configuration >>>' >> $BASH_FILE

if [ "$machine" = "MacIntel" ]; then
	INSTALLER=${ZULU_VER}-ca-${JAVA_VER}-macosx_x64.tar.gz
        JAVA_FOLDER=${ZULU_VER}-ca-${JAVA_VER}-macosx_x64
	echo "export JAVA_HOME=${TOOLS_HOME}/${JAVA_FOLDER}/Contents/Home" >> $BASH_FILE
elif [ "$machine" = "MacM1" ]; then
        INSTALLER=${ZULU_VER}-ca-${JAVA_VER}-macosx_aarch64.tar.gz
        JAVA_FOLDER=${ZULU_VER}-ca-${JAVA_VER}-macosx_aarch64
        echo "export JAVA_HOME=${TOOLS_HOME}/${JAVA_FOLDER}" >> $BASH_FILE
else
        INSTALLER=${ZULU_VER}-ca-${JAVA_VER}-linux_x64.tar.gz
	JAVA_FOLDER=${ZULU_VER}-ca-${JAVA_VER}-linux_x64
        echo "export JAVA_HOME=${TOOLS_HOME}/${JAVA_FOLDER}" >> $BASH_FILE
fi

curl -L -O https://cdn.azul.com/zulu/bin//${INSTALLER}
tar -xvzf $INSTALLER
mv ${JAVA_FOLDER} $TOOLS_HOME

echo 'export JAVA_OPTS="$JAVA_OPTS -Duser.timezone=GMT"' >> $BASH_FILE
echo 'export PATH=${JAVA_HOME}/bin:$PATH' >> $BASH_FILE
echo '#  <<< java configuration <<<' >> $BASH_FILE
echo '#' >> $BASH_FILE
