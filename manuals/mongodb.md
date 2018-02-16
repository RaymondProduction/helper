# MongoDB

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

### Some commands of MongoDB

* version() - show version MongoDB

* show dbs - show all databases

* use <name> - use database by name (use my_base)

* show collections

* db.<collection name>.find() - show contain collection (
db.people.find())

* db.<collection name>.drop() - remove collection (db.users.drop())

* db.<collection name>.remove({}) - remove contain of collection db.users.remove({})

* help - information about the commands