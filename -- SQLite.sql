
-- SQLite

 -- on crée notre première table qui s'appellera posts qui comprendra une collonne de type text (VARCHAR) d'une longueur max de 150 caractères !
  -- CREATE TABLE posts (title VARCHAR(150), content TEXT, category VARCHAR(50), createdAt DATETIME);

-- supprimer le champ category dans la table posts 
-- ALTER TABLE posts DROP category

-- créer une nouvelle collonne 
-- ALTER TABLE posts ADD categoty VARCHAR(50)


-- création de la table recettes
-- CREATE TABLE recipes ( title VARCHAR(150) , content TEXT, slug VARCHAR(50), duration SMALLINT, online BOOLEAN, createsAt DATETIME)

--insertion de données dans la table recipes
-- INSERT INTO recipes (title,slug,content,duration,online,createsAt) VALUES ('Soupe2' , 'soupe2', 'Contenu de test', 10,TRUE,1662708303 )

--Récupération de données 
--récupère toutes les données de la table recipes
--  SELECT * FROM recipes

 -- récupère les valeurs de la table recipes demandées dans la requête
--  SELECT content,duration FROM recipes

-- récupère les valeur avec une condition grâce à WHERE
  -- SELECT * FROM recipes WHERE slug IN ('poulet')
  SELECT * FROM recipes WHERE slug IN ('soupe') OR duration = 30

