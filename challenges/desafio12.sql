SELECT 
	art.nome AS 'artista',
    CASE
		WHEN COUNT(art.nome) >= 5 THEN 'A'
        WHEN COUNT(art.nome) BETWEEN 3 AND 4 THEN 'B'
        WHEN COUNT(art.nome) = 2 THEN 'C'
        ELSE '-'
    END AS 'ranking'    
FROM SpotifyClone.cancoes_favoritas AS fav
INNER JOIN SpotifyClone.musica AS mus ON mus.id = fav.titulo_id
RIGHT JOIN SpotifyClone.artista AS art ON mus.artista_id = art.id
GROUP BY art.nome
ORDER BY 
	COUNT(art.nome) DESC, artista;