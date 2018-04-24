# Create unit of systemd

**systemd** is a suite of software that provides fundamental building blocks for a Linux operating system.

Services and timer of systemd containe in folder /etc/systemd/system.

#### Create timer

Timer is unit which run when the time came.
For example create file myapp.timer in folder /etc/systemd/system

```
[Unit]
Description=Timer for myapp

[Timer]
# Time to wait after booting before we run first time
OnBootSec=2min
Unit=myapp.service

[Install]
WantedBy=multi-user.target
```

#### Create unit

For example create file myapp.service in folder /etc/systemd/system

```
[Unit]
Description=My application
#Requires=first-app.service
#After=first-app.service

[Service]
Restart=always
StandardOutput=syslog
StandardError=syslog
SyslogIdentifier=myapp
User=root
#Environment=NODE_ENV=production PORT=3000
WorkingDirectory=/user
ExecStart=/root/.nvm/v0.10.25/bin/node myapp.js

[Install]
WantedBy=multi-user.target
```
#### Initialization your units

```bash
systemctl daemon-reload
```
#### Restart unit

```bash
service myapp restart
```
#### Stop unit

```bash
service myapp stop
```
#### Start unit

```bash
service myapp start
```
#### Show logs

```bash
journalctl -f -u myapp.service 
```
#### Enable autorun unit

```bash
systemctl enable myapp.timer
```
#### Disable autorun unit

```bash
systemctl disable myapp.timer
