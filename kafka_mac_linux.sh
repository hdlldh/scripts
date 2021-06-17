SCALA_VERSION=2.11
KAFKA_VERSION=2.4.1
BASH_FILE=~/bashrc
INSTALLER=kafka_${SCALA_VERSION}-${KAFKA_VERSION}.tgz

if [ -z "$TOOLS_HOME" ]; then
    TOOLS_HOME=$HOME/Tools
fi

if [ ! -f $INSTALLER ]; then
    curl -O https://ftp.wayne.edu/apache/kafka/${KAFKA_VERSION}/$INSTALLER
fi

tar -xvzf $INSTALLER
mv kafka_${SCALA_VERSION}-${KAFKA_VERSION} $TOOLS_HOME

echo '#' >> $BASH_FILE
echo '# >>> kafka configuration >>>' >> $BASH_FILE
echo "export KAFKA_HOME=${TOOLS_HOME}/kafka_${SCALA_VERSION}-${KAFKA_VERSION}" >> $BASH_FILE
echo 'export PATH=${KAFKA_HOME}/bin:$PATH' >> $BASH_FILE
echo '#  <<< kafka configuration <<<' >> $BASH_FILE
echo '#' >> $BASH_FILE
