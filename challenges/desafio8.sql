SELECT
	art.nome AS 'artista',
	alb.nome AS 'album'
FROM SpotifyClone.album AS alb
INNER JOIN SpotifyClone.artista AS art ON alb.artista_id = art.id
HAVING artista = 'Elis Regina';