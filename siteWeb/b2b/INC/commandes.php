<?php
/**
 * Created by PhpStorm.
 * User: domin
 * Date: 04-03-19
 * Time: 15:43
 */
try {
    $bdd = new PDO("mysql:host=172.17.0.3;dbname=WoodyToys", "root", "");
}
catch(Exception $e){
    die('ERROR: ' . $e->getMessage());
}

$commande = $bdd->prepare('INSERT INTO Commande(ID_Client, COMANDE) VALUES(?,?)');
$commande->execute(array($_POST['idClient'], $_POST['commande']));

header('Location: ../index.php');
