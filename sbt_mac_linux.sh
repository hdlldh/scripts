SBT_VERSION=1.6.2
BASH_FILE=~/bashrc
INSTALLER=sbt-${SBT_VERSION}.tgz

if [ -z "$TOOLS_HOME" ]; then
    TOOLS_HOME=$HOME/Tools
fi

if [ ! -f $INSTALLER ]; then
    curl -L -O https://github.com/sbt/sbt/releases/download/v${SBT_VERSION}/sbt-${SBT_VERSION}.tgz
fi

tar -xvzf $INSTALLER
mv sbt $TOOLS_HOME/sbt-${SBT_VERSION}

echo '#' >> $BASH_FILE
echo '# >>> sbt configuration >>>' >> $BASH_FILE
echo "export SBT_HOME=${TOOLS_HOME}/sbt-${SBT_VERSION}" >> $BASH_FILE
echo 'export PATH=${SBT_HOME}/bin:$PATH' >> $BASH_FILE
echo '#  <<< sbt configuration <<<' >> $BASH_FILE
echo '#' >> $BASH_FILE
