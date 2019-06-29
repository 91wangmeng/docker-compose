# 单机安装yapi
### 前提
> *必须已安装安装docker*

> *必须已安装docker-compose*
### 克隆代码
```bash
git clone https://github.com/91wangmeng/docker-compose.git
```
### 进入目录
```bash
cd docker-compose/docker-composes/docker/yapi/
```
### 运行初始化脚本(只能执行一次,如需重新安装请先删除相应容器以及data文件夹,)
```bash
sh init.sh
```
### 如果容器关闭需要启动
```bash
sh start.sh
```
