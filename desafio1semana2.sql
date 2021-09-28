CREATE DATABASE blog;

\c blog

DROP TABLE IF EXISTS usuario;
DROP TABLE IF EXISTS post;
DROP TABLE IF EXISTS comentario;

CREATE TABLE usuario(
    id_usuario INT PRIMARY KEY,
    email VARCHAR(50)
);

CREATE TABLE post(
    id INT PRIMARY KEY,
    usuario_id int,
    titulo VARCHAR(50),
    fecha DATE,
    FOREIGN KEY (usuario_id) REFERENCES usuario(id_usuario)
);

CREATE TABLE comentario(
    id INT PRIMARY KEY,
    usuario_id int,
    post_id int,
    texto VARCHAR(50),
    fecha DATE,
    FOREIGN KEY (usuario_id) REFERENCES usuario(id_usuario),
    FOREIGN KEY (post_id) REFERENCES post(id)
);


INSERT INTO usuario(id_usuario,email) VALUES (1,'usuario01@hotmail.com');
INSERT INTO usuario(id_usuario,email) VALUES (2,'usuario02@gmail.com');
INSERT INTO usuario(id_usuario,email) VALUES (3,'usuario03@gmail.com');
INSERT INTO usuario(id_usuario,email) VALUES (4,'usuario04@yahoo.com');
INSERT INTO usuario(id_usuario,email) VALUES (5,'usuario05@hotmail.com');
INSERT INTO usuario(id_usuario,email) VALUES (6,'usuario06@yahoo.com');
INSERT INTO usuario(id_usuario,email) VALUES (7,'usuario07@yahoo.com');
INSERT INTO usuario(id_usuario,email) VALUES (8,'usuario08@yahoo.com');
INSERT INTO usuario(id_usuario,email) VALUES (9,'usuario09@yahoo.com');

INSERT INTO post(id,usuario_id,titulo,fecha) VALUES (1,1,'Post 1: Esto es malo','2020-06-29');
INSERT INTO post(id,usuario_id,titulo,fecha) VALUES (2,5,'Post 2: Esto es malo','2020-06-20');
INSERT INTO post(id,usuario_id,titulo,fecha) VALUES (3,1,'Post 3: Esto es excelente','2020-05-30');
INSERT INTO post(id,usuario_id,titulo,fecha) VALUES (4,9,'Post 4: Esto es bueno','2020-05-09');
INSERT INTO post(id,usuario_id,titulo,fecha) VALUES (5,7,'Post 5: Esto es bueno','2020-07-10');
INSERT INTO post(id,usuario_id,titulo,fecha) VALUES (6,5,'Post 6: Esto es excelente','2020-07-18');
INSERT INTO post(id,usuario_id,titulo,fecha) VALUES (7,8,'Post 7: Esto es excelente','2020-07-07');
INSERT INTO post(id,usuario_id,titulo,fecha) VALUES (8,1,'Post 8: Esto es excelente','2020-05-14');
INSERT INTO post(id,usuario_id,titulo,fecha) VALUES (9,5,'Post 9: Esto es bueno','2020-05-08');
INSERT INTO post(id,usuario_id,titulo,fecha) VALUES (10,1,'Post 10: Esto es bueno','2020-06-02');
INSERT INTO post(id,usuario_id,titulo,fecha) VALUES (11,9,'Post 11: Esto es bueno','2020-05-05');
INSERT INTO post(id,usuario_id,titulo,fecha) VALUES (12,7,'Post 12: Esto es malo,''2020-07-23');
INSERT INTO post(id,usuario_id,titulo,fecha) VALUES (13,5,'Post 13: Esto es excelente','2020-05-30');
INSERT INTO post(id,usuario_id,titulo,fecha) VALUES (14,8,'Post 14: Esto es excelente','2020-05-01');
INSERT INTO post(id,usuario_id,titulo,fecha) VALUES (15,8,'Post 15: Esto es malo','2020-06-17');


INSERT INTO comentario(id,usuario_id,post_id,texto,fecha) VALUES (1,3,6,'este es el comentario 1','2020-06-29');
INSERT INTO comentario(id,usuario_id,post_id,texto,fecha) VALUES (2,4,2,'este es el comentario 2','2020-06-20');
INSERT INTO comentario(id,usuario_id,post_id,texto,fecha) VALUES (3,6,4,'este es el comentario 3','2020-05-30');
INSERT INTO comentario(id,usuario_id,post_id,texto,fecha) VALUES (4,2,13,'este es el comentario 4','2020-05-09');
INSERT INTO comentario(id,usuario_id,post_id,texto,fecha) VALUES (5,6,6,'este es el comentario 5','2020-07-10');
INSERT INTO comentario(id,usuario_id,post_id,texto,fecha) VALUES (6,3,3,'este es el comentario 6','2020-07-18');
INSERT INTO comentario(id,usuario_id,post_id,texto,fecha) VALUES (7,6,1,'este es el comentario 7','2020-07-07');
INSERT INTO comentario(id,usuario_id,post_id,texto,fecha) VALUES (8,6,7,'este es el comentario 8','2020-05-14');
INSERT INTO comentario(id,usuario_id,post_id,texto,fecha) VALUES (9,8,13,'este es el comentario 9','2020-05-08');
INSERT INTO comentario(id,usuario_id,post_id,texto,fecha) VALUES (10,8,6,'este es el comentario 10','2020-06-02');
INSERT INTO comentario(id,usuario_id,post_id,texto,fecha) VALUES (11,5,1,'este es el comentario 11','2020-05-05');
INSERT INTO comentario(id,usuario_id,post_id,texto,fecha) VALUES (12,8,15,'este es el comentario 12','2020-07-23');
INSERT INTO comentario(id,usuario_id,post_id,texto,fecha) VALUES (13,1,9,'este es el comentario 13','2020-05-30');
INSERT INTO comentario(id,usuario_id,post_id,texto,fecha) VALUES (14,2,5,'este es el comentario 14','2020-05-01');
INSERT INTO comentario(id,usuario_id,post_id,texto,fecha) VALUES (15,4,3,'este es el comentario 15','2020-06-17');


SELECT email,titulo,id_usuario FROM post JOIN usuario ON post.usuario_id=usuario.id_usuario WHERE usuario.id_usuario=5;

SELECT email,id,texto FROM usuario JOIN comentario ON usuario.id_usuario=comentario.usuario_id WHERE NOT usuario.email='usuario06@yahoo.com';

SELECT id_usuario FROM usuario LEFT JOIN post on usuario.id_usuario=post.usuario_id WHERE usuario.id_usuario NOT IN(SELECT usuario_id from post);

SELECT * FROM post FULL OUTER JOIN comentario on post.id=comentario.post_id;

SELECT EXTRACT (MONTH FROM fecha) AS mes FROM post;


















