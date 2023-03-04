DROP DATABASE IF EXISTS SpotifyClone;
CREATE DATABASE IF NOT EXISTS SpotifyClone;
USE SpotifyClone;

CREATE TABLE plano (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(20) NOT NULL,
    valor_plano DOUBLE NOT NULL
) engine = InnoDB;

INSERT INTO plano (id, nome, valor_plano) VALUES
	('1', 'gratuito', '0'),
	('2', 'familiar', '7.99'),
	('3', 'universitário', '5.99'),
	('4', 'pessoal', '6.99');

CREATE TABLE artista (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45) NOT NULL
) engine = InnoDB;

INSERT INTO artista (id, nome) VALUES
	('1', 'Beyoncé'),
	('2', 'Queen'),
	('3', 'Elis Regina'),
	('4', 'Baco Exu do Blues'),
	('5', 'Blind Guardian'),
	('6', 'Nina Simone');
    
CREATE TABLE pessoa_usuaria (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45) NOT NULL,
    idade INT NOT NULL,
    data_assinatura DATE NOT NULL,
    plano_id INT,
    FOREIGN KEY (plano_id) REFERENCES plano (id)
);

INSERT INTO pessoa_usuaria (id, nome, idade, data_assinatura, plano_id) VALUES
	('1', 'Barbara Liskov', '82', '2019-10-20', '1'),
	('2', 'Robert Cecil Martin', '58', '2017-01-06', '1'),
	('3', 'Ada Lovelace', '37', '2017-12-30', '2'),
	('4', 'Martin Fowler', '46', '2017-01-17', '2'),
	('5', 'Sandi Metz', '58', '2018-04-29', '2'),
	('6', 'Paulo Freire', '19', '2018-02-14', '3'),
	('7', 'Bell Hooks', '26', '2018-01-05', '3'),
	('8', 'Christopher Alexander', '85', '2019-06-05', '4'),
	('9', 'Judith Butler', '45', '2020-05-13', '4'),
	('10', 'Jorge Amado', '58', '2017-02-17', '4'); 
    
CREATE TABLE seguindo_artista (
    pessoa_usuaria_id INT NOT NULL,
    artista_id INT NOT NULL,
    PRIMARY KEY(pessoa_usuaria_id, artista_id),
    FOREIGN KEY (pessoa_usuaria_id) REFERENCES pessoa_usuaria (id),
    FOREIGN KEY (artista_id) REFERENCES artista (id)
) engine = InnoDB;

INSERT INTO seguindo_artista (pessoa_usuaria_id, artista_id) VALUES
	( '1', '1'),
	( '1', '2'),
	( '1', '3'),
	( '2', '1'),
	( '2', '3'),
	( '3', '2'),
	( '4', '4'),
	( '5', '5'),
	( '5', '6'),
	( '6', '6'),
	( '6', '1'),
	( '7', '6'),
	( '9', '3'),
	( '10', '2');    
    
CREATE TABLE album (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45) NOT NULL,
    ano_lancamento INT NOT NULL,
    artista_id INT NOT NULL,
    FOREIGN KEY (artista_id) REFERENCES artista (id)
) engine = InnoDB;

INSERT INTO album (id, nome, ano_lancamento, artista_id) VALUES
	('1', 'Renaissance', '2022', '1'),
	('2', 'Jazz', '1978', '2'),
	('3', 'Hot Space', '1982', '2'),
	('4', 'Falso Brilhante', '1998', '3'),
	('5', 'Vento de Maio', '2001', '3'),
	('6', 'QVVJFA?', '2003', '4'),
	('7', 'Somewhere Far Beyond', '2007', '5'),
	('8', 'I Put A Spell On You', '2012', '6');
    
CREATE TABLE musica 
(
    id INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(45) NOT NULL,
    artista_id INT NOT NULL,
    album_id INT NOT NULL,
    duracao_segundos INT NOT NULL,
    FOREIGN KEY (artista_id) REFERENCES artista (id),
    FOREIGN KEY (album_id) REFERENCES album (id)
) engine = InnoDB;

INSERT INTO musica (id, titulo, artista_id, album_id, duracao_segundos) VALUES
	('1', 'BREAK MY SOUL', '1', '1', '279'),
	('2', 'VIRGO\'S GROOVE', '1', '1', '369'),
	('3', 'ALIEN SUPERSTAR', '1', '1', '116'),
	('4', 'Don\'t Stop Me Now', '2', '2', '203'),
	('5', 'Under Pressure', '2', '3', '152'),
	('6', 'Como Nossos Pais', '3', '4', '105'),
	('7', 'O Medo de Amar é o Medo de Ser Livre', '3', '5', '207'),
	('8', 'Samba em Paris', '4', '6', '267'),
	('9', 'The Bard\'s Song', '5', '7', '244'),
	('10', 'Feeling Good', '6', '8', '100');
    
CREATE TABLE historico_de_reproducao (
    id INT NOT NULL AUTO_INCREMENT,
    pessoa_usuaria_id INT NOT NULL,
    musica_id INT NOT NULL,
    data_reproducao DATETIME NOT NULL,
    PRIMARY KEY (id, pessoa_usuaria_id, musica_id),
    FOREIGN KEY (pessoa_usuaria_id) REFERENCES pessoa_usuaria (id),
    FOREIGN KEY (musica_id) REFERENCES musica (id)
) engine = InnoDB;

INSERT INTO historico_de_reproducao ( pessoa_usuaria_id, musica_id, data_reproducao) VALUES
	( '1', '8', '2022-02-28 10:45:55'),
	( '1', '2', '2020-05-02 05:30:35'),
	( '1', '10', '2020-03-06 11:22:33'),
	( '2', '10', '2022-08-05 08:05:17'),
	( '2', '7', '2020-01-02 07:40:33'),
	( '3', '10', '2020-11-13 16:55:13'),
	( '3', '2', '2020-12-05 18:38:30'),
	( '4', '8', '2021-08-15 17:10:10'),
	( '5', '8', '2022-01-09 01:44:33'),
	( '5', '5', '2020-08-06 15:23:43'),
	( '6', '7', '2017-01-24 00:31:17'),
	( '6', '1', '2017-10-12 12:35:20'),
	( '7', '4', '2011-12-15 22:30:49'),
	( '8', '4', '2012-03-17 14:56:41'),
	( '9', '9', '2022-02-24 21:14:22'),
	( '10', '3', '2015-12-13 08:30:22');