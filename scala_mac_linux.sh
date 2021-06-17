SCALA_VERSION=2.12.12
BASH_FILE=~/bashrc
INSTALLER=scala-${SCALA_VERSION}.tgz

if [ -z "$TOOLS_HOME" ]; then
    TOOLS_HOME=$HOME/Tools
fi

if [ ! -f $INSTALLER ]; then
    curl -O https://downloads.typesafe.com/scala/${SCALA_VERSION}/$INSTALLER
fi

tar -xvzf $INSTALLER
mv scala-${SCALA_VERSION} $TOOLS_HOME

echo '#' >> $BASH_FILE
echo '# >>> scala configuration >>>' >> $BASH_FILE
echo "export SCALA_HOME=${TOOLS_HOME}/scala-${SCALA_VERSION}" >> $BASH_FILE
echo 'export PATH=${SCALA_HOME}/bin:$PATH' >> $BASH_FILE
echo '#  <<< scala configuration <<<' >> $BASH_FILE
echo '#' >> $BASH_FILE
