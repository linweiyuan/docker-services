# CUDA

## N 卡上的 GPU 并行计算框架

`nvidia/cuda` 可以实现在 `docker` 容器里使用 `GPU`

不同的系统上准备工作不一样，在 `Arch Linux` 上，需要安装[nvidia-docker](https://aur.archlinux.org/packages/nvidia-docker) 包，安装完重启 `docker` 服务后，`/etc/docker/daemon.json` 会自动更新 `docker runtime` 设置

```json
{
  "runtimes": {
    "nvidia": {
      "path": "nvidia-container-runtime",
      "runtimeArgs": []
    }
  }
}
```

`docker info` 会返回

`Runtimes: nvidia runc io.containerd.runc.v2 io.containerd.runtime.v1.linux`

这样显卡在容器里就会被识别出来了
