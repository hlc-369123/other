#!/bin/bash

utili_name='get_resource-utilization.sh'
if [ ! -f ${utili_name} ]
then
echo "未能获取${utili_name}！！！"
exit 1
fi

get_resource(){
signal=$1
vdfile=$2
for storename in $(cat /etc/hosts|grep -v localhost|awk '{print $2}')
do
if [[ $signal == 'scp' ]]
then
scp ${utili_name} ${storename}:/tmp/
elif [[ $signal == 'start' ]]
then
ssh ${storename} /bin/bash /tmp/${utili_name} start $vdfile
elif [[ $signal == 'stop' ]]
then
ssh ${storename} /bin/bash /tmp/${utili_name} stop
fi
done
}

rm -f ./vdbench_test-file
get_resource scp
for i in single_vol nude_vol mix_vol
do
ls $i|sort -n -k 1 >> ./vdbench_test-file
done

for i in $(cat ${PATH}/vdbench_test-file)
do
get_resource start $i
/root/vdbench50407/vdbench -f ${PATH}/${i}
sleep 1
get_resource stop
sleep 1
tar -zcvf ${dir}/${i}.tar.gz /root/vdbench50407/output/
done
