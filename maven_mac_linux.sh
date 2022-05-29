MAVEN_VERSION=3.8.5
BASH_FILE=~/bashrc
INSTALLER=apache-maven-${MAVEN_VERSION}-bin.tar.gz

if [ -z "$TOOLS_HOME" ]; then
    TOOLS_HOME=$HOME/Tools
fi

if [ ! -f $INSTALLER ]; then
    curl -L -O https://dlcdn.apache.org/maven/maven-3/${MAVEN_VERSION}/binaries/$INSTALLER
fi

tar -xvzf $INSTALLER
mv apache-maven-${MAVEN_VERSION} $TOOLS_HOME/apache-maven-${MAVEN_VERSION}

echo '#' >> $BASH_FILE
echo '# >>> maven configuration >>>' >> $BASH_FILE
echo "export MAVEN_HOME=${TOOLS_HOME}/apache-maven-${MAVEN_VERSION}" >> $BASH_FILE
echo 'export PATH=${MAVEN_HOME}/bin:$PATH' >> $BASH_FILE
echo '#  <<< maven configuration <<<' >> $BASH_FILE
echo '#' >> $BASH_FILE
