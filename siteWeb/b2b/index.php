<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title>B2B-WoodyToys</title>
    <link rel="stylesheet" href="CSS/design.css">
</head>

<body>

<form action="INC/infoAcheteurs.php" method="post">
    <p>
        <label for="entreprise">Entreprise</label> : <input type="text" name="entreprise" id="entreprise" / ><br />
        <label for="telephone">Numero de telephone</label> :  <input type="text" name="telephone" id="telephone"  /><br />
        <label for="adresse">Adresse de l entreprise</label> :  <input type="text" name="adresse" id="adresse" /><br />
        <input type="submit" value="Ajouter fournisseur" />
    </p>
</form>
    <?php
    try {
        $bdd = new PDO("mysql:host=localhost;dbname=b2b", "root", "");
    }
    catch(Exception $e){
        die('ERROR: ' . $e->getMessage());
    }
    $reponse = $bdd->query('SELECT entreprise, telephone, adresse FROM acheteurs ORDER BY id');
    $table ='';
    $table.=
        '<table>
            <thead>
                <tr>
                    <th>Entreprise</th>
                    <th>Numero de telephone</th>
                    <th>Adresse de l entreprise</th>
                </tr>
            </thead>
            <tbody>';
    while($donnes = $reponse->fetch()){
        $table.=
            '<tr><td>' . htmlspecialchars($donnes['entreprise']) . '</td>' .
            '<td>' . htmlspecialchars($donnes['telephone']) . '</td>' .
            '<td>' . htmlspecialchars($donnes['adresse']) . '</td>'.
'</tr>';
    }
    $table .=
        '</tbody>
    </table>';
    echo $table;
    $reponse->closeCursor();
    ?>

<form action="INC/commandes.php" method="post">
    <p>
        <label for="acheteur">Entreprise</label> : <input type="text" name="acheteur" id="acheteur" / ><br />
        <label for="commande">Numero de telephone</label> :  <input type="text" name="commande" id="commande"  /><br />
        <input type="submit" value="Ajouter la commande" />
    </p>
</form>
<?php
try {
    $bdd = new PDO("mysql:host=localhost;dbname=b2b", "root", "");
} catch (Exception $e) {
    die('ERROR: ' . $e->getMessage());
}
$req = $bdd->query('SELECT numCommande, fournisseur, commande FROM commande ORDER BY numCommande');
$table = '';
$table .=
    '<table>
            <thead>
                <tr>
                    <th>Numero de commande</th>
                    <th>Acheteur</th>
                    <th>Commande</th>
                </tr>
            </thead>
            <tbody>';
while ($donne = $req->fetch()) {
    $table .=
        '<tr><td>' . htmlspecialchars($donne['numCommande']) . '</td>' .
        '<td>' . htmlspecialchars($donne['fournisseur']) . '</td>' .
        '<td>' . htmlspecialchars($donne['commande']) . '</td>' .
        '</tr>';
}
$table .=
    '</tbody>
    </table>';
echo $table;
$req->closeCursor();
?>
</body>
</html>
