JAVA_MAJOR_VER=8
JAVA_MINOR_VER=292
JAVA_BIN_VER=10
JAVA_FOLDER=jdk${JAVA_MAJOR_VER}u${JAVA_MINOR_VER}-b${JAVA_BIN_VER}
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
	INSTALLER=OpenJDK${JAVA_MAJOR_VER}U-jdk_x64_mac_hotspot_${JAVA_MAJOR_VER}u${JAVA_MINOR_VER}b${JAVA_BIN_VER}.tar.gz
	echo "export JAVA_HOME=${TOOLS_HOME}/${JAVA_FOLDER}/Contents/Home" >> $BASH_FILE
else
	INSTALLER=OpenJDK${JAVA_MAJOR_VER}U-jdk_x64_linux_hotspot_${JAVA_MAJOR_VER}u${JAVA_MINOR_VER}b${JAVA_BIN_VER}.tar.gz
	echo "export JAVA_HOME=${TOOLS_HOME}/${JAVA_FOLDER}" >> $BASH_FILE
fi
echo https://github.com/AdoptOpenJDK/openjdk8-binaries/releases/download/${JAVA_FOLDER}/${INSTALLER}

curl -L -O https://github.com/AdoptOpenJDK/openjdk8-binaries/releases/download/${JAVA_FOLDER}/${INSTALLER}
tar -xvzf $INSTALLER
mv ${JAVA_FOLDER} $TOOLS_HOME

echo 'export JAVA_OPTS="$JAVA_OPTS -Duser.timezone=GMT"' >> $BASH_FILE
echo 'export PATH=${JAVA_HOME}/bin:$PATH' >> $BASH_FILE
echo '#  <<< java configuration <<<' >> $BASH_FILE
echo '#' >> $BASH_FILE
