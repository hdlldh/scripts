BASH_FILE=~/bashrc

echo '#' >> $BASH_FILE
echo '# >>> api key configuration >>>' >> $BASH_FILE
echo "export GOOGLE_API_KEY=AIzaSyByUc2tcNDPS1v9qi_Gj3kFPla8F2wHRtU" >> $BASH_FILE
echo "export BING_API_KEY=YmJ4a3TrQZ1akyWBke6x~SHqHxdmrej0YJpIEQBKhgQ~AilRd0Romf_7I31ymREIwD-ePPkHJ08PfM7PvNvqSEDpgwx38foVfqCTK70HKvUt" >> $BASH_FILE
echo '#  <<< api key configuration <<<' >> $BASH_FILE
echo '#' >> $BASH_FILE

echo '#' >> $BASH_FILE
echo '# >>> syntax highlighting configuration >>>' >> $BASH_FILE 
echo "export CLICOLOR=1" >> $BASH_FILE
echo "export LSCOLORS=GxFxCxDxBxegedabagaced" >> $BASH_FILE
echo "export PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '" >> $BASH_FILE
echo '#  <<< syntax highlighting configuration <<<' >> $BASH_FILE
echo '#' >> $BASH_FILE

echo '#' >> $BASH_FILE
echo '# >>> private env configuration >>>' >> $BASH_FILE
echo "export MY_LIB=/Users/donglin/Dropbox/MyLib" >> $BASH_FILE
echo "export WORK_SPACE=/Users/donglin/Dropbox/Workspace" >> $BASH_FILE
echo "export WORK_SPACE_LOCAL=/Users/donglin/LocalWorkspace" >> $BASH_FILE
echo 'export PYTHONPATH=${MY_LIB}/python:$PYTHONPATH' >> $BASH_FILE
echo 'alias dhw="cd ${WORK_SPACE}"' >> $BASH_FILE
echo 'alias dhwl="cd $WORK_SPACE_LOCAL"' >> $BASH_FILE
echo 'alias dhl="cd $MY_LIB"' >> $BASH_FILE
echo '#  <<< private env configuration <<<' >> $BASH_FILE
echo '#' >> $BASH_FILE
