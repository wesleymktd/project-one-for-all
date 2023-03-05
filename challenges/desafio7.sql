SELECT 
	art.nome AS 'artista',
    alb.nome AS 'album',
    COUNT(art.nome) AS 'pessoas_seguidoras'
FROM SpotifyClone.album AS alb
INNER JOIN SpotifyClone.artista AS art ON alb.artista_id = art.id
INNER JOIN SpotifyClone.seguindo_artista AS seg ON art.id = seg.artista_id
GROUP BY artista, album
ORDER BY pessoas_seguidoras DESC, artista, album;