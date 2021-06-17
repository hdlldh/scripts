function check_os_type()
{
    unameOut="$(uname -s)"
	case "${unameOut}" in
    		Linux*)     machine=Linux;;
    		Darwin*)    machine=Mac;;
    		CYGWIN*)    machine=Cygwin;;
    		MINGW*)     machine=MinGw;;
    		*)          machine="UNKNOWN:${unameOut}"
	esac
	echo ${machine}

}
#result=$(check_os_type)
#echo $result
