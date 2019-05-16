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
for vdfiles in single_vol nude_vol mix_vol
do
ls ${vdfiles}|sort -n -k 1 >> ./${vdfiles}/vdbench_test-file
for vdconfs in $(cat ${vdfiles}/vdbench_test-file|grep -v vdbench_test-file)
do
get_resource start ${vdconfs}
/root/vdbench50407/vdbench -f ./${vdfiles}/${vdconfs}
sleep 1
get_resource stop
sleep 1
if [ ! -d /media/${vdfiles} ] #判断存放vd结果目录是否存在，‘media’为本例中存放目录
then
mkdir -p /media/${vdfiles} #vdfiles对应为single_vol nude_vol mix_vol三个目录，第一次时创建
fi
cp /root/vdbench50407/output/ /media/${vdfiles}/${vdconfs}.log #将结果cp到对应上面创建的三个目录下，并命名为vd文件名.log
done
done
