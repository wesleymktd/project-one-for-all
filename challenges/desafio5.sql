SELECT 
	m.titulo AS 'cancao',
    COUNT(hist.musica_id) AS 'reproducoes'
FROM SpotifyClone.historico_de_reproducao AS hist
INNER JOIN SpotifyClone.musica m ON hist.musica_id = m.id
GROUP BY hist.musica_id
ORDER BY reproducoes DESC, cancao
LIMIT 2;