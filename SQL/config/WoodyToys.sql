create database WoodyToys;
use WoodyToys;

CREATE TABLE Client
(
ID_Client int not null auto_increment,
NOM text not null,
ADRESSE text not null,
PRIMARY KEY (ID_Client)
);

CREATE TABLE Produit
(
ID_PRODUIT int not null auto_increment,
NOM_PRODUIT text not null,
PRIX int not null,
PRIMARY KEY (ID_PRODUIT)
);


CREATE TABLE Commande
(
ID_COMMANDE int not null auto_increment,
ID_Client int not null,
COMANDE text not null,
PRIMARY KEY (ID_COMMANDE, ID_Client),
FOREIGN KEY (ID_Client) REFERENCES Client(ID_Client)
);

CREATE USER 'servWeb'@'%' IDENTIFIED BY '';
CREATE USER 'employe'@'localhost' IDENTIFIED BY 'emp1';
CREATE USER 'maintenance'@'localhost' IDENTIFIED BY 'admin';
CREATE USER 'root'@'%' IDENTIFIED BY '';

GRANT ALL PRIVILEGES ON * . * TO 'servWeb'@'%';
GRANT ALL PRIVILEGES ON *.* TO 'maintenance'@'localhost';
GRANT ALL PRIVILEGES ON * . * TO 'root'@'%';
GRANT SELECT ON *.* TO 'employe'@'localhost';

FLUSH PRIVILEGES;
