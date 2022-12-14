# découverte de sqlite 

## installation de l'environnement

on crée un fichier db.sqlite dans vs code
on a télécharger les tools sur le site de sqlite : 
https://www.sqlite.org/download.html
le lien de téléchargement pour windows :
 https://www.sqlite.org/2022/sqlite-tools-win32-x86-3390300.zip
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

(ici toutes les recettes dont le slug comprend les caractères lade)
SELECT * FROM recipes WHERE slug LIKE '%lade%'

### efface une ligne 
(ici efface la ligne dans la table recipes dont le slug est gal à soupe)
DELETE FROM recipes WHERE slug = 'soupe'

### modifie une ligne
(ici modifie le titre en Soupe de légumes de la ligne qui a pour titre Soupe )
UPDATE recipes SET title = 'Soupe de légumes' WHERE title = 'Soupe'

## Clés primaires
on recrée la table avec cette fois ci la clé primaire id  

CREATE TABLE recipes (id INTEGER PRIMARY KEY AUTOINCREMENT, title VARCHAR(150) , content TEXT, slug VARCHAR(50), duration SMALLINT, online BOOLEAN, createsAt DATETIME)

cela permet une recherche beaucoup plus rapide 

### Créer un index unique pour une collonne de notre table (le slug par ex car on ne veut pas avoir 2 url identiques !!)

CREATE UNIQUE INDEX idx_recipes_slug ON recipes (slug)

Cela nous empêchera d'avoir 2 slug(url) identiques dans la table recipes

## Valeur NULL
on drop la table pour l'exemple
DROP TABLE recipes
--ici on aura le slug avec une valeur null
INSERT INTO recipes (title,content,duration,online, createdAt) VALUES ('test', 'test',50,TRUE,1662708303)

-- on ne le veut pas du coup on va rajouter des contraintes

CREATE TABLE recipes (id INTEGER PRIMARY KEY AUTOINCREMENT, title VARCHAR(150) , content TEXT NOT NULL, slug VARCHAR(50) NOT NULL UNIQUE, duration SMALLINT, online BOOLEAN, createdAt DATETIME)

ainsi on sera obligé de renseigner le title et le slug , le slug devra en plus être unique

## valeur par defaut
On renseigne une valeur par defaut de 10 mn a duration :
CREATE TABLE recipes (id INTEGER PRIMARY KEY AUTOINCREMENT, title VARCHAR(150) , content TEXT NOT NULL, slug VARCHAR(50) NOT NULL UNIQUE, duration SMALLINT DEFAULT 10, online BOOLEAN, createdAt DATETIME)
  
## clés étrangères et jointures 
-- PRAGMA foreign_keys = ON; -- uniquement sur sqlite pour activer la contrainte 
DROP TABLE IF EXISTS categories;
DROP TABLE IF EXISTS recipes;

CREATE TABLE IF NOT EXISTS categories (id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, title VARCHAR(180) NOT NULL, description TEXT );

INSERT INTO categories (title,description)
VALUES ('Plat','desc'),('Dessert','desc');

CREATE TABLE recipes (
  id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  title VARCHAR(250) NOT NULL,
  slug VARCHAR(250) NOT NULL UNIQUE,
  content TEXT,
  category_id INTEGER, -- lie la recette a une categorie 
  FOREIGN KEY (category_id) REFERENCES categories (id) -- vérifie si la catégorie avec laquelle on veut lié la recette existe
);
-- on insère des valeurs dans la table recipes
INSERT INTO recipes (title,slug,category_id)
VALUES ('Crême anglaise', 'creme-anglaise',2),
      ('Soupe','soupe',1),
      ('Salade de fruits','salade-de-fruit',2);

--on peut maintenant sélectioner faire se rejoindre 2 tables on utilise des alias pour simplifier l'écriture 
SELECT r.id, r.title, c.title AS   category FROM recipes r JOIN 
categories c ON r.category_id = c.id
;

-- si on met LEFT JOIN renverra tous les éléments même ceux qui n'ont pas de gategory_id défini

on peut spécifier une recherche ici une commande qui a pour username léo et comme id 4
 SELECT * FROM commandes c  JOIN users u ON c.user_id = u.id WHERE u.name='léo' AND c.id=4;

 