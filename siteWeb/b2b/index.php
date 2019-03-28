<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title>B2B-WoodyToys</title>
    <link rel="stylesheet" href="CSS/design.css">
</head>

<body>
<form action="INC/infoAcheteurs.php" method="post">
    <h2>Ajouter le client</h2>
    <p>
        <label for="entreprise">Nom du client</label> : <input type="text" name="entreprise" id="entreprise" / ><br />
        <label for="adresse">Adresse du client</label> :  <input type="text" name="adresse" id="adresse" /><br />
        <input type="submit" value="Ajouter client" />
    </p>
</form>
    <?php
    try {
        $bdd = new PDO("mysql:host=172.17.0.3;dbname=WoodyToys", "root", "");
    }
    catch(Exception $e){
        die('ERROR: ' . $e->getMessage());
    }
    $clients = $bdd->query('SELECT ID_Client, NOM, ADRESSE FROM Client ORDER BY ID_Client');
    $table ='';
    $table.=
        '<h2>Clients</h2>'.
        '<table>
            <thead>
                <tr>
                    <th>ID du client</th>
                    <th>Nom du client</th>
                    <th>Adresse du client</th>
                </tr>
            </thead>
            <tbody>';
    while($donnesClient = $clients->fetch()){
        $table.=
            '<tr><td>'.  htmlspecialchars($donnesClient['ID_Client']) . '</td>'.
            '<td>' . htmlspecialchars($donnesClient['NOM']) . '</td>' .
            '<td>' . htmlspecialchars($donnesClient['ADRESSE']) . '</td>'.
'</tr>';
    }
    $table .=
        '</tbody>
    </table>';
    echo $table;
    $clients->closeCursor();
    ?>

<form action="INC/commandes.php" method="post">
    <h2>Ajouter la commande</h2>
    <p>
        <label for="idClient">ID du client</label> :  <input type="text" name="idClient" id="idClient"  /><br />
        <label for="commande">Commande</label> :  <input type="text" name="commande" id="commande"  /><br />
        <input type="submit" value="Ajouter la commande" />
    </p>
</form>
<?php
try {
    $bdd = new PDO("mysql:host=;dbname172.17.0.3=WoodyToys", "root", "");
}
catch(Exception $e){
    die('ERROR: ' . $e->getMessage());
}
$commande = $bdd->query('SELECT ID_COMMANDE, ID_Client, COMANDE FROM Commande ORDER BY ID_COMMANDE');
$table = '';
$table .=
    '<h2>Commandes</h2>'.
    '<table>
            <thead>
                <tr>
                    <th>Numero de commande</th>
                    <th>Acheteur</th>
                    <th>Commande</th>
                </tr>
            </thead>
            <tbody>';
while ($donnesCommande = $commande->fetch()) {
    $table .=
        '<tr><td>' . htmlspecialchars($donnesCommande['ID_COMMANDE']) . '</td>' .
        '<td>' . htmlspecialchars($donnesCommande['ID_Client']) . '</td>' .
        '<td>' . htmlspecialchars($donnesCommande['COMANDE']) . '</td>' .
        '</tr>';
}
$table .=
    '</tbody>
    </table>';
echo $table;
$commande->closeCursor();
?>
</body>
</html>
