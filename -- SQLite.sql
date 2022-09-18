
-- SQLite

 -- on crée notre première table qui s'appellera posts qui comprendra une collonne de type text (VARCHAR) d'une longueur max de 150 caractères !
  -- CREATE TABLE posts (title VARCHAR(150), content TEXT, category VARCHAR(50), createdAt DATETIME);

-- supprimer le champ category dans la table posts 
-- ALTER TABLE posts DROP category

-- créer une nouvelle collonne 
-- ALTER TABLE posts ADD categoty VARCHAR(50)


-- création de la table recettes

--insertion de données dans la table recipes
-- INSERT INTO recipes (title,slug,content,duration,online,createsAt) VALUES ('Soupe2' , 'soupe2', 'Contenu de test', 10,TRUE,1662708303 ),('Soupe3' , 'soupe3', 'Contenu de test', 10,TRUE,1662708303 )

--Récupération de données 
--récupère toutes les données de la table recipes
--  SELECT * FROM recipes

 -- récupère les valeurs de la table recipes demandées dans la requête
--  SELECT content,duration FROM recipes

-- récupère les valeur avec une condition grâce à WHERE
  -- SELECT * FROM recipes WHERE slug IN ('poulet')
  -- SELECT * FROM recipes WHERE slug IN ('soupe') OR duration = 30

-- modifie de titre de soupe en soude légume
-- UPDATE recipes SET title = 'Soupe de légumes' WHERE title = 'soupe'

--on supprime la table recipes pour la reconstruire correctement 
-- DROP TABLE recipes 

--on recrée la table avec cette fois ci la clé primaire id 

-- CREATE TABLE recipes (id INTEGER PRIMARY KEY AUTOINCREMENT, title VARCHAR(150) , content TEXT, slug VARCHAR(50), duration SMALLINT, online BOOLEAN, createdAt DATETIME)

-- On crée un index unique sur une des valeurs de collonnes 

-- CREATE UNIQUE INDEX idx_recipes_slug ON recipes (slug)

--retrouver les index unique dans une table uniquement sur sqlite avec PRAGMA
-- PRAGMA index_list(recipes)

-- valeur null
-- on drop la table pour l'exemple
-- DROP TABLE recipes
--ici on aura le slug avec une valeur null
-- INSERT INTO recipes (title,content,duration,online, createdAt) VALUES ('test', 'test',50,TRUE,1662708303)

-- on ne le veut pas du coup on va rajouter des contraintes

-- CREATE TABLE recipes (id INTEGER PRIMARY KEY AUTOINCREMENT, title VARCHAR(150) , content TEXT NOT NULL, slug VARCHAR(50) NOT NULL UNIQUE, duration SMALLINT, online BOOLEAN, createdAt DATETIME)
-- PRAGMA foreign_keys = ON; -- uniquement sur sqlite pour activer la contrainte 
-- DROP TABLE IF EXISTS categories;
-- DROP TABLE IF EXISTS recipes;

-- CREATE TABLE IF NOT EXISTS categories (id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, title VARCHAR(180) NOT NULL, description TEXT );

-- INSERT INTO categories (title,description)
-- VALUES ('Plat','desc'),('Dessert','desc');

-- CREATE TABLE recipes (
--   id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
--   title VARCHAR(250) NOT NULL,
--   slug VARCHAR(250) NOT NULL UNIQUE,
--   content TEXT,
--   category_id INTEGER, -- lie la recette a une categorie 
--   FOREIGN KEY (category_id) REFERENCES categories (id) -- vérifie si la catégorie avec laquelle on veut lié la recette existe
-- );
-- -- on insère des valeurs dans la table recipes
-- INSERT INTO recipes (title,slug,category_id)
-- VALUES ('Crême anglaise', 'creme-anglaise',2),
--       ('Soupe','soupe',1),
--       ('Salade de fruits','salade-de-fruit',2);

-- --on peut maintenant sélectioner faire se rejoindre 2 tables 
-- SELECT r.id, r.title, c.title AS   category FROM recipes r JOIN 
-- categories c ON r.category_id = c.id WHERE c.title =  'Dessert'
-- ;

-- si on met LEFT JOIN renverra tous les éléments même ceux qui n'ont pas de gategory_id défini



--------------------------------essai personnel---------------------
-- PRAGMA foreign_keys = ON;
-- DROP TABLE IF EXISTS users;
-- DROP TABLE IF EXISTS commandes;
-- DROP TABLE IF EXISTS numcommandes;

-- CREATE TABLE users (id INTEGER PRIMARY KEY, name VARCHAR(50),age INTEGER);



-- INSERT INTO users (name,age) VALUES ('denis',42),('léo',41);

-- CREATE TABLE commandes (id INTEGER PRIMARY KEY, name VARCHAR(50),prix INTEGER,user_id INTEGER, FOREIGN KEY (user_id) REFERENCES users (id));


-- insert into commandes (name,prix,user_id) values ('tele',42,1),('livre',41,1),('p',1,1),('v',2,2),('t',2,2);

-- CREATE TABLE numcommandes (id INTEGER PRIMARY KEY, name VARCHAR(50),prix INTEGER, photoUrl TEXT, commande_id INTEGER, FOREIGN KEY (commande_id) REFERENCES commandes (id));


-- insert into numcommandes (name,prix,photoUrl,commande_id) values ('test',42,'blabla1',1),('test2',41,'blabla2',1),('test3',1,'blabla3',1),('test4',2,'blabla4',2),('t',2,'blabla5',2);


-- SELECT * FROM commandes c  JOIN users u ON c.user_id = u.id WHERE u.name='léo' AND c.id=4;


---------------------------Réalisation du mld --------------------------
PRAGMA foreign_key = ON;
DROP TABLE IF EXISTS ingredients;
DROP TABLE IF EXISTS categories;
DROP TABLE IF EXISTS ingredients_recipes;
DROP TABLE IF EXISTS categories_recipes;
DROP TABLE IF EXISTS recipes;
DROP TABLE IF EXISTS users;

CREATE TABLE users (id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL , username VARCHAR(50) UNIQUE NOT NULL, email VARCHAR(50) UNIQUE NOT NULL);


CREATE TABLE recipes (id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL , title VARCHAR(50) NOT NULL, slug VARCHAR(50) NOT NULL UNIQUE, date DATE, duration INTEGER, user_id INTEGER, FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE); -- on a rajouté on delete cascade qui permettra de supprimer les recettes lié à un utilisateur si le compte utilisateur est supprimer (d'où le cascade)

CREATE TABLE categories (id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL , title VARCHAR(50));

CREATE TABLE ingredients (id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL , name VARCHAR(100) NOT NULL);
-- déclarer d'abord les lignes de la table avant les contraintes sinon erreur--!! ne pas mettre les commentaires dans les requêtes !!
CREATE TABLE categories_recipes (recipe_id INTEGER NOT NULL,category_id INTEGER NOT NULL, FOREIGN KEY (recipe_id) REFERENCES recipes (id) ON DELETE CASCADE,
FOREIGN KEY (category_id) REFERENCES categories (id) ON DELETE CASCADE,
PRIMARY KEY  (category_id,recipe_id),
UNIQUE (category_id,recipe_id)
);

CREATE TABLE ingredients_recipes (
unit VARCHAR(50),
quantity INTEGER  , 
recipe_id INTEGER NOT NULL, 
ingredient_id INTEGER , 
FOREIGN KEY (recipe_id) REFERENCES recipes (id) ON DELETE CASCADE, 
FOREIGN KEY (ingredient_id) REFERENCES ingredients (id) ON DELETE CASCADE,
PRIMARY KEY  (ingredient_id,recipe_id),
UNIQUE (ingredient_id,recipe_id)
);


INSERT INTO users (username, email) VALUES ('John Doe','john@doe.fr');
INSERT INTO categories (title) VALUES ('Plat'),('Dessert'),('Gateau');
--on déclare des recettes qui seront liées à un user
INSERT INTO recipes (title, slug, duration,user_id) VALUES ('Soupe','soupe',10,1),('Madeleine','madeleine',30,1);
-- on déclare à quelle catégorie sont liés les recettes (par ex la soupe est dans la catégorie plat, et la madeleine dans la catégorie dessert mais aussi gateau)
INSERT INTO categories_recipes (recipe_id,category_id) VALUES (1,1),(2,2),(2,3);
-- on déclare des ingrédients que l'on va utiliser pour construire une recette (par ex ici la recette d'une madeleine)
INSERT INTO ingredients (name) VALUES ('Sucre'),('Farine'),('Levure chimique'),('Beurre'),('Lait'),('Oeuf');
-- on précise la quantité et l'unité de chaque ingrédient pour construire la recette (ici madeleine)
INSERT INTO ingredients_recipes (recipe_id,ingredient_id,quantity,unit) VALUES 
(2,1,150,'g'),
(2,2,200,'g'),
(2,3,8,'g'),
(2,4,100,'g'),
(2,5,50,'g'),
(2,6,3,NULL);

-- SELECT * 
-- FROM ingredients_recipes ir
-- JOIN ingredients i ON ir.recipe_id = i.id
-- JOIN 




