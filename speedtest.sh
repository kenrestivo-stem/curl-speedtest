#!/bin/bash
# Licensed under GPLv3
# created by "black" on LET
# please give credit if you plan on using this for your own projects 

# uses 10mb file by default.
# if you give it an argument 100  it will use that instead.


fileName="10mb.test";


if [ "$1" ]; then
    fileName="${1}mb.test"
fi

echo "using $filename"


##need sed now because some european versions of curl insert a , in the speed results
speedtest () {
	dlspeed=$(echo -n "scale=2; " && curl --connect-timeout 8 http://$1/$fileName -w "%{speed_download}" -o $fileName -s | sed "s/\,/\./g" && echo "/1048576");
	echo "$dlspeed"
	ulspeed=$(echo -n "scale=2; " && curl --connect-timeout 8 -F "file=@$fileName" http://$1/webtests/ul.php -w "%{speed_upload}" -s -o /dev/null | sed "s/\,/\./g" && echo "/1048576");
	echo "$ulspeed"
}

ls "$fileName" 1>/dev/null 2>/dev/null;
if [ $? -eq 0 ]
then
	echo "$fileName already exists, remove it or rename it";
	exit 1;
fi


#check dependencies
metDependencies=1;
#check if curl is installed
type curl 1>/dev/null 2>/dev/null;
if [ $? -ne 0 ]
then
	echo "curl is not installed, install it to continue, typically you can install it by typing"
	echo "apt-get install curl"
	echo "yum install curl"
	echo "depending on your OS";
	metDependencies=0 ;
fi
if [ $metDependencies -eq 0 ]
then
	exit 1;
fi


## start speed test
echo "-------------Speed test--------------------";

echo "Testing North America locations";

## Seattle, Washington, USA (donated by http://ramnode.com)
echo "Speedtest from Seattle, Washington, USA [ generously donated by http://ramnode.com ] on on a shared 1 Gbps port";
speedtest 23.226.231.112;


unlink $fileName;

