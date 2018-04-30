# Install Zabbix with Nginx on Ubuntu

#### Install Nginx and mysql

```bash
apt update
apt install nginx mysql-server
```

#### Install dependencies for Zabbix

```bash
apt update
apt install php7.0 php7.0-xml php-curl php-mbstring php7.0-zip
apt install php7.0-mysql php7.0-bcmath php7.0-mbstring php7.0-gd
```

## From official site

#### Install Repository with MySQL database

```bash
wget http://repo.zabbix.com/zabbix/3.4/ubuntu/pool/main/z/zabbix-release/zabbix-release_3.4-1+xenial_all.deb
dpkg -i zabbix-release_3.4-1+xenial_all.deb
apt update
```

#### Install Zabbix server, frontend, agent
```
apt install zabbix-server-mysql zabbix-frontend-php zabbix-agent
```

#### Create initial database

```bash
mysql -uroot -p
```

Entered password

```mysql
mysql> create database zabbix character set utf8 collate utf8_bin;
mysql> grant all privileges on zabbix.* to zabbix@localhost identified by 'password';
mysql> quit;
```
Import initial schema and data. You will be prompted to enter your newly created password.
```bash
zcat /usr/share/doc/zabbix-server-mysql*/create.sql.gz | mysql -u zabbix -p zabbix
```

#### Configure the database for Zabbix server

```bash
nano /etc/zabbix/zabbix_server.conf
```

and type

```
DBPassword=password
```

#### Create symbolic link of web folder of Zabbix for Nginx

```bash
ln -s /usr/share/zabbix/ /var/www/
```

#### Create config file for Nginx

```bash
nano /etc/nginx/sites-enabled/zabbix.conf
```

with containe

```
server {
        listen 1051;
        listen [::]:1051;

        root /var/www/zabbix;

        # Add index.php to the list if you are using PHP
        index index.php index.html index.htm index.nginx-debian.html;

        server_name 94.247.131.234;
        location / {
                # First attempt to serve request as file, then
                # as directory, then fall back to displaying a 404.
                try_files $uri $uri/ =404;
        }

        # pass the PHP scripts to FastCGI server listening on 127.0.0.1:9000
        #
        location ~ \.php$ {
                include snippets/fastcgi-php.conf;

                # With php7.0-cgi alone:
                #fastcgi_pass 127.0.0.1:9000;
                # With php7.0-fpm:

                fastcgi_pass unix:/run/php/php7.0-fpm.sock;
        }

        # deny access to .htaccess files, if Apache's document root
        # concurs with nginx's one
        #
        location ~ /\.ht {
                deny all;
        }
}
```

#### Configurate frontend part for Zabbix

```bash
nano /var/www/zabbix/conf/zabbix.conf.php
```

I recommend to change **localhost** to **127.0.0.1**
```
<?php
// Zabbix GUI configuration file.
global $DB;

$DB['TYPE']     = 'MYSQL';
$DB['SERVER']   = '127.0.0.1';
$DB['PORT']     = '3306';
$DB['DATABASE'] = 'zabbix';
$DB['USER']     = 'zabbix';
$DB['PASSWORD'] = 'root';

// Schema name. Used for IBM DB2 and PostgreSQL.
$DB['SCHEMA'] = '';

$ZBX_SERVER      = '127.0.0.1';
$ZBX_SERVER_PORT = '10051';
$ZBX_SERVER_NAME = 'raymond';

$IMAGE_FORMAT_DEFAULT = IMAGE_FORMAT_PNG;
```

#### Configurate php.ini

```bash
nano /etc/php/7.0/fpm/php.ini
```

```
post_max_size = 16M
upload_max_filesize = 2M
max_execution_time = 300
max_input_time = 300
```
And another parameters

#### Configurate Zabbix agent

```bash
nano /etc/zabbix/zabbix_agentd.conf
```

And change

```
* * *
Server=hostname
* * *
ServerActive=hostname
* * *
Hostname=hostname
* * *
```

if command

```bash
ping hostname
```
answer **ping: unknown host hostname**

So, change hosts

```bash
nano /etc/hosts
```

```
127.0.0.1       localhost hostname
```

#### Restart

```bash
systemctl restart zabbix-server zabbix-agent nginx
```

#### Autorun
```bash
systemctl enable zabbix-server zabbix-agent
```

#### Show logs of Zabbix Agent

```bash
cat /var/log/zabbix/zabbix_agentd.log
```