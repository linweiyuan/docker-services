# Flexo

## pacman 包缓存工具

局域网或者虚拟机内部测试需要频繁重复下载相同包的场景下很有用

环境变量 `FLEXO_MIRRORS_PREDEFINED` 可设置后端代理服务，如果本地缓存没有，则去该服务器下载下来再缓存到本地

如果启用了该服务，则配置文件 `/etc/pacman.d/mirrorlist` 应该是

```ini
Server = http://flexo服务地址:端口/archlinux/$repo/os/$arch
```

配置文件 `/etc/pacman.conf` 应该是

```ini
[archlinuxcn]
Server = http://flexo服务地址:端口/archlinuxcn/$arch
```

程序会自动创建好目录，不是全部包堆在一起

其实不只是 `Arch Linux`，其他 `Ubuntu` 那种也适用
