# 安装logstash同步mysql数据到elasticsearch
> 修改`docker/es-logstash-mysql/plugins/config/sync_table.cfg`中的jdbc,替换为要同步的mysql数据库信息和表信息
修改`elasticsearch`中es地址,同时修改logstash中es地址