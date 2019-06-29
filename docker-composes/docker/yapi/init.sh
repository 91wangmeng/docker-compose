#!/usr/bin/env bash
echo '安装mongo'
docker-compose -f docker-compose-install.yml up -d mongo
echo '休眠10s,等待数据库初始化完成'
seconds_left=10
echo "请等待${seconds_left}秒……"
while [ $seconds_left -gt 0 ];do
  echo -n $seconds_left
  sleep 1
  seconds_left=$(($seconds_left - 1))
  echo -ne "\r     \r" #清除本行文字
done
echo '安装yapi'
docker-compose -f docker-compose-install.yml up -d yapi
echo '查看yapi管理员账户'
docker logs -f yapi
echo '启动yapi'
docker-compose -f docker-compose-start.yml up -d
echo '安装yapi-cli'
docker exec -it yapi npm config set unsafe-perm true
docker exec -it yapi npm install -g yapi-cli --registry https://registry.npm.taobao.org
echo '更新yapi版本'
docker exec -it yapi  sh -c "cd /api && yapi-cli update"
echo '重启yapi'
docker restart yapi
