CREATE TABLE cancoes_favoritas (
    pessoa_usuaria_id INT NOT NULL,
    titulo_id INT NOT NULL,
    PRIMARY KEY (pessoa_usuaria_id , titulo_id),
    FOREIGN KEY (pessoa_usuaria_id)
        REFERENCES pessoa_usuaria (id),
    FOREIGN KEY (titulo_id)
        REFERENCES musica (id)
)  ENGINE=INNODB;

INSERT INTO cancoes_favoritas (pessoa_usuaria_id, titulo_id) VALUES
	('1', '3'),
	('1', '6'),
	('1', '10'),
	('2', '4'),
	('3', '1'),
	('3', '3'),
	('4', '7'),
	('4', '4'),
	('5', '10'),
	('5', '2'),
	('8', '4'),
	('9', '7'),
	('10', '3');