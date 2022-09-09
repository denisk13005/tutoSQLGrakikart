# découverte de sqlite 

## installation de l'environnement

on crée un fichier db.sqlite dans vs code
on a télécharger les tools sur le site de sqlite 
on a mis les 3 éxécutables dans le mm dossier que db.sqlite
on glisse le fichier db.sqlite sur sqlite3.exe pour ouvrit directement le shell sqlite et commencer à taper des requêtes !

## Utilisation de Table Plus pour l'écriture des requêtes et la visualisation des résultats

on installe table plus, on se connecte à db.sqlite qu'on a créer juste avant on save, le log s'ouvre et on peut taper le requêtes

## Création d'une table 

CREATE TABLE <nom de la table> (nom et type des collonnes )

le nombre de collonnes dépendra du type de table que l'on veut créer !
le type de la collonne est important car il permettra de définir l'espace mémoire préallouer à la collonne 

## Insertion de données dans la table recipes

<bold>INSERT INTO</bold> recipes (title,slug,content,duration,online,createsAt) <bold>VALUES</bold> ('Poulet au curry' , 'poulet-au-curry', 'Contenu de test du poulet au curry', 50,TRUE,1662708303 )