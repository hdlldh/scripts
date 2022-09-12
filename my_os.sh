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
    echo $machine
}
function is_valid_os(){
    if [ "$1" == "MacM1" ] || [ "$1" == "MacIntel" ] || [ "$1" == "Linux" ]; then
        echo "yes"
    else
        echo "no"
    fi
}
#result=$(check_os_type)
#echo $result
