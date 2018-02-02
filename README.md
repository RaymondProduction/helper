# Helper for my projects
**Visual Studio Code** is a lightweight but powerful source code editor which runs on your desktop and is available for Windows, macOS and Linux. 
## Install
https://code.visualstudio.com/
```ssh
$ sudo -s
# npm install -g tslint typescript
```
## Run
```
$ code &
```

## Install tslint

![00](https://github.com/RaymondProduction/helper/raw/master/img/00.png)
![01](https://github.com/RaymondProduction/helper/raw/master/img/01.png)
![02](https://github.com/RaymondProduction/helper/raw/master/img/02.png)
![03](https://github.com/RaymondProduction/helper/raw/master/img/03.png)

# MongoDB little manual

## Install
```sh
$ sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 0C49F3730359A14518585931BC711F9BA15703C6
$ echo "deb [ arch=amd64,arm64 ] http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.4 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.4.list
$ sudo apt-get update
$ sudo apt-get install -y mongodb-org
```

## Start MongoDB
```sh
$ sudo service mongod start
```
## Use client
```sh
$ mongo
```

or **Robomongo (Robo 3T)**

[![N|Solid](https://robomongo.org/static/robomongo-128x128-129df2f1.png)](https://robomongo.org/)

## Use data files

If you want to move your database files then use mongod. So, create your folder for database files. (for example 'db'). 
And use command:
```sh
$ sudo mongod --dbpath db
```
Now, is working MongoDB server which save your data in the folder 'db'.

And you can copy folder with database files. You will look in the file **/etc/mongod.conf** (dbPath: /var/lib/mongodb). 
Copy this folder, and you can delete folders  **diagnostic.data** and **journal** in this folder