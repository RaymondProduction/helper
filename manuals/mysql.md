# MySql

### Install (Ubuntu)

```sh
sudo apt-get install mysql-server
```

### Use

##### First enter (as root)

```sh
sudo mysql -p
```
Type root password

* Create user
    ```mysql
    CREATE USER '<user name>'@'localhost' IDENTIFIED BY '<password>';
    ```
    Example
    ```mysql
    CREATE USER 'non-root'@'localhost' IDENTIFIED BY '123';
    ```    

* Set user permissions
    ```mysql
    GRANT ALL PRIVILEGES ON * . * TO '<user name>'@'localhost';
    ```
    Example
    ```mysql
    GRANT ALL PRIVILEGES ON * . * TO 'non-root'@'localhost';
    ```
After that you can enter as simple user

```sh
mysql -p
```
or
```sh
mysql -u -p
```
Type user password
* Create data base
    ```mysql
    CREATE DATABASE <name base>;
    ```
    Example
    ```mysql
    CREATE DATABASE test;
    ```
* Show data bases
    ```mysql
    SHOW DATABASES;
    ```
* Use data base
    ```mysql
     USE <date base>;
    ```
