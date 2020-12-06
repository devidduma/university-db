# 1) create database
CREATE DATABASE university;

# 2) create new users and grant privileges
# admin has full privileges
CREATE USER 'admin'@'localhost' IDENTIFIED BY 'admin';
GRANT ALL PRIVILEGES ON university.* TO 'admin'@'localhost';
# devid can only run select queries
CREATE USER 'devid'@'localhost' IDENTIFIED BY 'devid';
GRANT SELECT ON university.* TO 'devid'@'localhost';
# reload privileges
FLUSH PRIVILEGES;

# 3) show grants
SHOW GRANTS FOR 'admin'@'localhost';
SHOW GRANTS FOR 'devid'@'localhost';

# 4) drop users
DROP USER 'admin'@'localhost';
DROP USER 'devid'@'localhost';