SELECT
	alb.nome AS 'album',
	COUNT(mus.album_id) AS 'favoritadas'
	FROM SpotifyClone.cancoes_favoritas AS fav
INNER JOIN SpotifyClone.musica AS mus ON fav.titulo_id = mus.id
INNER JOIN SpotifyClone.album AS alb ON mus.album_id = alb.id
GROUP BY mus.album_id
ORDER BY favoritadas DESC, album
LIMIT 3;