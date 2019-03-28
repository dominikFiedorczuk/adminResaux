<?php
/**
 * Created by PhpStorm.
 * User: domin
 * Date: 04-03-19
 * Time: 15:35
 */

try {
    $bdd = new PDO("mysql:host=172.17.0.3;dbname=WoodyToys", "root", "");
}
catch(Exception $e){
    die('ERROR: ' . $e->getMessage());
}
$client = $bdd->prepare('INSERT INTO Client(NOM, ADRESSE) VALUES(?,?)');
$client->execute(array($_POST['entreprise'], $_POST['adresse']));


header('Location: ../index.php');
