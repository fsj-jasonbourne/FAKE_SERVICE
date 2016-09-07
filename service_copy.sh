#!/bin/bash
# 母服务为:servicetest
# 设想：所有服务都是在此基础上进行复制
# 使用：输入设定服务个数,其余服务为servicetest的副本,从1到N service1,service2,service3........serviceN

service_dir="/tmp/allservice/"
service_name="servicetest"
autorun_dir="/etc/init.d/"

function make_service()
{
    if [ -d ${service_dir} ]
	then
	{
        echo "This directory already existed!" >> /dev/null
	}
    else
	{
		mkdir ${service_dir}
	}
    fi

}

function copy_service()
{
    echo "Please input number of services you wanna to make:"    
	read service_number
    for (( i=1;i<${service_number};i++ ))
	do
	{
		#cp ${service_name} ${service_dir}${service_name}${i}
        cp ${service_name} ${autorun_dir}${service_name}${i}

		chkconfig --add ${autorun_dir}${service_name}${i}
		chmod +x ${autorun_dir}${service_name}${i}
	}
	done
}

function Main()
{
    make_service
    copy_service
}

Main
