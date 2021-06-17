JAVA_VERSION_1=8
JAVA_VERSION_2=261
JAVA_FOLDER=jdk1.${JAVA_VERSION_1}.0_${JAVA_VERSION_2}
BASH_FILE=~/bashrc

source ./my_os.sh
machine=$(check_os_type)

if [ "$machine" != "Mac" ] && [ "$machine" != "Linux" ]; then
	echo "Neither MAC nor Linux system."
        exit
fi

echo '#' >> $BASH_FILE
echo '# >>> java configuration >>>' >> $BASH_FILE

if [ "$machine" = "Mac" ]; then
	INSTALLER=jdk-${JAVA_VERSION_1}u${JAVA_VERSION_2}-macosx-x64.dmg
	echo 'export JAVA_HOME=$(/usr/libexec/java_home)' >> $BASH_FILE

else
	INSTALLER=jdk-${JAVA_VERSION_1}u${JAVA_VERSION_2}-linux-x64.tar.gz
	if [ -z "$TOOLS_HOME" ]; then
    		TOOLS_HOME=$HOME/Tools
		mkdir -p $TOOLS_HOME
	fi

	tar -xvzf $INSTALLER
	mv ${JAVA_FOLDER} $TOOLS_HOME
	echo "export JAVA_HOME=${TOOLS_HOME}/${JAVA_FOLDER}" >> $BASH_FILE

fi
echo 'export JAVA_OPTS="$JAVA_OPTS -Duser.timezone=GMT"' >> $BASH_FILE
echo 'export PATH=${JAVA_HOME}/bin:$PATH' >> $BASH_FILE
echo '#  <<< java configuration <<<' >> $BASH_FILE
echo '#' >> $BASH_FILE
