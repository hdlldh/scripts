function check_os_type()
{
    unameOut="$(uname -a)"
	case "${unameOut}" in
    		Linux*)     	machine=Linux;;
    		Darwin*arm64)   machine=MacM1;;
                Darwin*x86_64)  machine=MacIntel;;
    		CYGWIN*)    	machine=Cygwin;;
    		MINGW*)     	machine=MinGw;;
    		*)          	machine="UNKNOWN:${unameOut}"
	esac
	echo ${machine}

}
#result=$(check_os_type)
#echo $result
