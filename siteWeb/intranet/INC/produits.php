<?php
/**
 * Created by PhpStorm.
 * User: domin
 * Date: 09-03-19
 * Time: 13:10
 */

try {
    $bdd = new PDO("mysql:host=172.17.0.3;dbname=WoodyToys", "root", "");
}
catch(Exception $e){
    die('ERROR: ' . $e->getMessage());
}

$produit = $bdd->prepare('INSERT INTO Produit(NOM_PRODUIT,PRIX) VALUES(?,?)');
$produit->execute(array($_POST['nomProduit'], $_POST['prix']));

header('Location: ../index.php');