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

INSERT INTO recipes (title,slug,content,duration,online,createsAt) VALUES ('Poulet au curry' , 'poulet-au-curry', 'Contenu de test du poulet au curry', 50,TRUE,1662708303 )

## Récupération des données d'une table
<a>
https://youtu.be/YgyB6ZRbX9w?list=PLjwdMgw5TTLXXpRlzDZq7d8iS6YXgnslt&t=313
</a>

### récupère toutes les données de la table recipes
--  SELECT * FROM recipes

### récupère les valeurs de la table recipes demandées dans la requête
SELECT content,duration FROM recipes

### récupère les valeur avec une condition grâce à WHERE 
(ici toutes les recettes qui ont une durée égale à 30)
SELECT * FROM recipes WHERE duration = 30
(ici toutes les recettes qui ont une durée comprise entre 0 et 60)
SELECT * FROM recipes WHERE duration BETWEEN 0 AND 60
(ici toutes les recettes dont le slug est soupe OU qui ont une durée égale à 30)
  SELECT * FROM recipes WHERE slug IN ('soupe') OR duration = 30




