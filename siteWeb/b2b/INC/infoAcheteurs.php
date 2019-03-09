<?php
/**
 * Created by PhpStorm.
 * User: domin
 * Date: 04-03-19
 * Time: 15:35
 */

    try {
        $bdd = new PDO("mysql:host=localhost;dbname=b2b", "root", "");
    } catch (Exception $e) {
        die('ERROR: ' . $e->getMessage());
    }
    $requete = $bdd->prepare('INSERT INTO acheteurs(entreprise, telephone, adresse) VALUES(?,?,?)');
    $requete->execute(array($_POST['entreprise'], $_POST['telephone'], $_POST['adresse']));

    header('Location: ../index.php');
