SPARK_VERSION=3.0.1
HADOOP_VERSION=2.7
BASH_FILE=~/bashrc
INSTALLER=spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz

if [ -z "$TOOLS_HOME" ]; then
      TOOLS_HOME=$HOME/Tools
fi

if [ ! -f $INSTALLER ]; then
    curl -O https://archive.apache.org/dist/spark/spark-${SPARK_VERSION}/$INSTALLER
fi
tar -xvzf $INSTALLER
mv spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION} ${TOOLS_HOME}

PYSPARK=${SPARK_HOME}/python
PY4J=$(basename $PYSPARK/lib/py4j-*-src.zip)

echo '#' >> $BASH_FILE
echo '# >>> spark configuration >>>' >> $BASH_FILE
echo "export SPARK_HOME=${TOOLS_HOME}/spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}" >> $BASH_FILE
echo 'export PATH=${SPARK_HOME}/bin:${SPARK_HOME}/sbin:$PATH' >> $BASH_FILE
#echo 'export SPARK_MASTER_URL="local[2]"' >> $BASH_FILE
echo 'PYSPARK=${SPARK_HOME}/python' >>$BASH_FILE
echo 'PY4J=$(basename $PYSPARK/lib/py4j-*-src.zip)' >>$BASH_FILE
echo 'export PYTHONPATH=$PYSPARK:$PYSPARK/lib/$PY4J:$PYTHONPATH' >> $BASH_FILE
echo '#  <<< spark configuration <<<' >> $BASH_FILE
echo '#' >> $BASH_FILE
