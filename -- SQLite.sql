
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
-- INSERT INTO recipes (title,slug,content,duration,online,createsAt) VALUES ('Poulet au curry' , 'poulet-au-curry', 'Contenu de test du poulet au curry', 50,TRUE,1662708303 )

--Récupération de données 
https://youtu.be/YgyB6ZRbX9w?list=PLjwdMgw5TTLXXpRlzDZq7d8iS6YXgnslt&t=313
