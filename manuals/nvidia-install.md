# My practice to install Nvidia driver for Sumsung RF510 for Ubuntu

#### Install dependencies

```bash
$ sudo apt-get install linux-headers-`uname -r` binutils pkg-config build-essential xserver-xorg-dev
$ sudo gedit /etc/modprobe.d/blacklist.conf
```

#### Added in blacklist.conf

```
blacklist vga16fb
blacklist nouveau
blacklist rivafb
blacklist nvidiafb
blacklist rivatv
```
#### Download file NVIDIA-Linux-XXX-X.X-XXX-pkg1.run from [here](http://www.nvidia.ru/Download/Find.aspx)

#### Stopping x-server

```bash
$ sudo service lightdm stop
```

#### Ctrl+Alt+F1 switch another console

Run install driver for NVIDIA without CUDA (Because I have problem `Unable to build the unified memory kernrel module`)

```bash
$ cd Downloads/
$ sudo sh  ./NVIDIA-Linux-XXX-X.X-XXX-pkg1.run --no-unified-memory
```