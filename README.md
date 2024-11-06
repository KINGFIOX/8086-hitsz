# README

不要正花活, 老老实实用 masm5 + dosbox, 不要想着内联汇编, 不要想着 nasm.
老老实实做, 很快就可以做完实验. 有些实验, 老师课上的 ppt 都有的.

## 优化体验

在项目目录下面添加 `dosbox-x.conf` 文件, 然后在项目目录下面打开 dosbox-x 可以读取这个 .conf,
就会加载里面的配置, 我这里是强制让我的 cpu 选择为 8086, 并且自动的挂载 C 盘为当前目录

```conf
[cpu]
core = normal
cputype = 8086

[autoexec]
mount C .
C:
```
