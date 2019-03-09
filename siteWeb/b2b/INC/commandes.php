<?php
/**
 * Created by PhpStorm.
 * User: domin
 * Date: 04-03-19
 * Time: 15:43
 */

$requet = $bdd->prepare('INSERT INTO commande(fournisseur, commande) VALUES(?,?)');
$requet->execute(array($_POST['acheteur'], $_POST['commande']));

header('Location: ../index.php');
