<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title>Intranet-WoodyToys</title>
    <link rel="stylesheet" href="CSS/design.css">
</head>

<body>

<form action="INC/produits.php" method="post">
    <h2>Ajouter le produit</h2>
    <p>
        <label for="nomProduit">Nom du produit</label> : <input type="text" name="nomProduit" id="nomProduit" / ><br />
        <label for="prix">Prix</label> :  <input type="text" name="prix" id="prix"  /><br />
        <input type="submit" value="Ajouter le produit" />
    </p>
</form>

<?php
try {
    $bdd = new PDO("mysql:host=172.17.0.3;dbname=WoodyToys", "root", "");
}
catch(Exception $e){
    die('ERROR: ' . $e->getMessage());
}
$produits = $bdd->query('SELECT ID_PRODUIT, NOM_PRODUIT, PRIX FROM Produit ORDER BY ID_PRODUIT');
$table ='';
$table.=
    '<h2>Produits</h2>'.
    '<table>
            <thead>
                <tr>
                    <th>ID du produit</th>
                    <th>Nom du produit</th>
                    <th>Prix</th>
                </tr>
            </thead>
            <tbody>';
while($donnesProduit = $produits->fetch()){
    $table.=
        '<tr><td>'.  htmlspecialchars($donnesProduit['ID_PRODUIT']) . '</td>'.
        '<td>' . htmlspecialchars($donnesProduit['NOM_PRODUIT']) . '</td>' .
        '<td>' . htmlspecialchars($donnesProduit['PRIX']) . '</td>'.
        '</tr>';
}
$table .=
    '</tbody>
    </table>';
echo $table;
$produits->closeCursor();
?>
</body>
</html>
