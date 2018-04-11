# Linux

#### df - report file system disk space usage

```bash
df -h
```
Some parametrs
```
-h, --human-readable
        print sizes in powers of 1024 (e.g., 1023M)
```
Show 
```
Filesystem      Size  Used Avail Use% Mounted on
udev            1,9G     0  1,9G   0% /dev
tmpfs           381M  6,6M  375M   2% /run
/dev/sda8       141G  116G   18G  87% /
tmpfs           1,9G  144K  1,9G   1% /dev/shm
tmpfs           5,0M  4,0K  5,0M   1% /run/lock
tmpfs           1,9G     0  1,9G   0% /sys/fs/cgroup
tmpfs           381M   68K  381M   1% /run/user/1000
```

#### du - estimate file space usage

```bash
sudo du -h -s folder
```
Some parametrs
```
 -s, --summarize
            display only a total for each argument
 -h, --human-readable
            print sizes in human readable format (e.g., 1K 234M 2G)
```

Show
```
107G	folder
```