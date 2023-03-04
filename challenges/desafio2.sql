SELECT 
	COUNT(m.titulo) AS 'cancoes', 
    COUNT(DISTINCT a.id) AS 'artistas' ,
	COUNT(DISTINCT alb.id) AS 'albuns'
FROM SpotifyClone.musica AS m
LEFT JOIN SpotifyClone.artista AS a ON m.artista_id = a.id
RIGHT JOIN SpotifyClone.album AS alb ON a.id = alb.id;