# Oracle Database

官方 GitHub 仓库：[dockerfiles](https://github.com/oracle/docker-images/tree/main/OracleDatabase/SingleInstance/dockerfiles)

有两点要注意

- 构建镜像的时候，安装包要从官网自行下载，仓库只提供构建脚本
- 进入容器内部使用 `sqlplus` 时，需要切换成用户 `oracle`
