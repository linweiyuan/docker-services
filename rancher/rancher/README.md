# Rancher

## 开源的企业级容器管理平台

运行时需要确保 `cgroup` 版本，`v2` 会报错

```bash
docker info | grep Cgroup

Cgroup Driver: systemd
Cgroup Version: 2
```

如果返回 `systemd`，则需要手动更改配置（`Arch Linux` 默认是 `v2`，`CentOS` 是 `v1`），将 `v1` 启用，需要修改内核参数并重启系统

修改 `/etc/default/grub` 的 `GRUB_CMDLINE_LINUX_DEFAULT` 或者 `GRUB_CMDLINE_LINUX`

```ini
systemd.unified_cgroup_hierarchy=0
```

重启后，重新查看

```bash
docker info | grep Cgroup

Cgroup Driver: cgroupfs
Cgroup Version: 1
```

则可以正常启动 `Rancher`
