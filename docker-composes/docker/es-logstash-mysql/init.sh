#!/usr/bin/env bash
echo '安装logstash'
docker-compose -f docker-compose.yml up -d logstash
echo '休眠10s,等待logstash完成'
seconds_left=10
echo "请等待${seconds_left}秒……"
while [ $seconds_left -gt 0 ];do
  echo -n $seconds_left
  sleep 1
  seconds_left=$(($seconds_left - 1))
  echo -ne "\r     \r" #清除本行文字
done
echo '安装jdbc插件'
docker exec -it logstash bin/logstash-plugin install logstash-input-jdbc
echo '安装elasticsearch插件'
docker exec -it logstash bin/logstash-plugin install logstash-output-elasticsearch
echo '重启logstash'
docker restart logstash
echo '查看日志'
docker logs -f logstash
