
HADOOP_VERSION=2.7.7
BASH_FILE=~/bashrc
INSTALLER=hadoop-${HADOOP_VERSION}.tar.gz
CONF_DIR=./hadoop

if [ -z "$TOOLS_HOME" ]; then
      TOOLS_HOME=$HOME/tools
fi

if [ ! -f $INSTALLER ]; then
    curl -O https://archive.apache.org/dist/hadoop/core/hadoop-${HADOOP_VERSION}/$INSTALLER
fi
tar -xvf $INSTALLER
mv hadoop-${HADOOP_VERSION} ${TOOLS_HOME}

echo '#' >> $BASH_FILE
echo '# >>> hadoop configuration >>>' >> $BASH_FILE
echo "export HADOOP_HOME=${TOOLS_HOME}/hadoop-${HADOOP_VERSION}" >> $BASH_FILE
echo 'export HADOOP_CONF_DIR=$HADOOP_HOME/etc/hadoop' >> $BASH_FILE
echo 'export HADOOP_MAPRED_HOME=$HADOOP_HOME' >> $BASH_FILE
echo 'export HADOOP_COMMON_HOME=$HADOOP_HOME' >> $BASH_FILE
echo 'export HADOOP_HDFS_HOME=$HADOOP_HOME' >> $BASH_FILE
echo 'export YARN_HOME=$HADOOP_HOME' >> $BASH_FILE
echo 'export PATH=${HADOOP_HOME}/bin:${HADOOP_HOME}/sbin:$PATH' >> $BASH_FILE
echo '#  <<< hadoop configuration <<<' >> $BASH_FILE
echo '#' >> $BASH_FILE

cp ${CONF_DIR}/core-site.xml ${TOOLS_HOME}/hadoop-${HADOOP_VERSION}/etc/hadoop
cp ${CONF_DIR}/hdfs-site.xml ${TOOLS_HOME}/hadoop-${HADOOP_VERSION}/etc/hadoop
cp ${CONF_DIR}/mapred-site.xml ${TOOLS_HOME}/hadoop-${HADOOP_VERSION}/etc/hadoop
cp ${CONF_DIR}/yarn-site.xml ${TOOLS_HOME}/hadoop-${HADOOP_VERSION}/etc/hadoop
