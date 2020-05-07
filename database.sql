CREATE DATABASE IF NOT EXISTS laravel_master;

USE laravel_master;

CREATE TABLE IF NOT EXISTS users(
  id              int(255) auto_increment not null,
  role            varchar(20),
  name            varchar(100),
  surname         varchar(200),
  nick            varchar(100),
  email           varchar(255),
  password        varchar(255),
  image           varchar(255),
  created_at      datetime,
  updated_at      datetime,
  remember_token  varchar(255),
CONSTRAINT pk_users PRIMARY KEY(id)
)ENGINE InnoDB;

CREATE TABLE IF NOT EXISTS images(
  id                int(255) auto_increment not null,
  user_id           int(255),
  image_path        varchar(255),
  description       text,
  created_at        datetime,
  updated_at        datetime,
CONSTRAINT pk_images PRIMARY KEY(id),
CONSTRAINT fk_images_users FOREIGN KEY(user_id) REFERENCES users(id)
)ENGINE InnoDB;

CREATE TABLE IF NOT EXISTS comments(
  id                int(255) auto_increment not null,
  image_id          int(255),
  user_id           int(255),
  content           text,
  created_at        datetime,
  updated_at        datetime,
CONSTRAINT pk_comments PRIMARY KEY(id),
CONSTRAINT fk_comments_images FOREIGN KEY(image_id) REFERENCES images(id),
CONSTRAINT fk_comments_users FOREIGN KEY(user_id) REFERENCES users(id)
)ENGINE InnoDB;

CREATE TABLE IF NOT EXISTS likes(
  id              int(255) auto_increment not null,
  image_id        int(255),
  user_id         int(255),
  created_at      datetime,
  updated_at      datetime,
CONSTRAINT pk_likes PRIMARY KEY(id),
CONSTRAINT fk_likes_images FOREIGN KEY(image_id) REFERENCES images(id),
CONSTRAINT fk_likes_users FOREIGN KEY(user_id) REFERENCES users(id)
)ENGINE InnoDB;



INSERT INTO users VALUES (NULL, 'user', 'Bryan Saúl', 'Sandoval', 'r4nbry', 'bryan@bryan.com', 'pass', null, CURTIME(), CURTIME(), null);
INSERT INTO users VALUES (NULL, 'user', 'Jorge', 'Lopez', 'juan12', 'juan@juan.com', 'pass', null, CURTIME(), CURTIME(), null);
INSERT INTO users VALUES (NULL, 'user', 'Evel', 'Sandoval', 'eve32', 'eve@eve.com', 'pass', null, CURTIME(), CURTIME(), null);

INSERT INTO images VALUES(null, 1, 'test.jpg', 'desc de prueba', CURTIME(), CURTIME());
INSERT INTO images VALUES(null, 1, 'playa.jpg', 'desc de prueba 1', CURTIME(), CURTIME());
INSERT INTO images VALUES(null, 1, 'arena.jpg', 'desc de prueba 2', CURTIME(), CURTIME());
INSERT INTO images VALUES(null, 3, 'familia.jpg', 'desc de prueba 23', CURTIME(), CURTIME());

INSERT INTO comments VALUES(null, 4, 1, 'buena foto', CURTIME(),CURTIME());
INSERT INTO comments VALUES(null, 2, 1, 'quiero playa', CURTIME(),CURTIME());
INSERT INTO comments VALUES(null, 4, 2, 'bien!', CURTIME(),CURTIME());

INSERT INTO likes VALUES(null, 4, 1, CURTIME(),CURTIME());
INSERT INTO likes VALUES(null, 4, 2, CURTIME(),CURTIME());
INSERT INTO likes VALUES(null, 1, 3, CURTIME(),CURTIME());
INSERT INTO likes VALUES(null, 2, 3, CURTIME(),CURTIME());
INSERT INTO likes VALUES(null, 1, 2, CURTIME(),CURTIME());
