SELECT 
	u.nome AS 'pessoa_usuaria',
    COUNT(hr.pessoa_usuaria_id) AS 'musicas_ouvidas',
    SUM(ROUND(m.duracao_segundos / 60, 2)) AS 'total_minutos'
FROM SpotifyClone.historico_de_reproducao AS hr
LEFT JOIN SpotifyClone.pessoa_usuaria AS u ON hr.pessoa_usuaria_id = u.id
INNER JOIN SpotifyClone.musica AS m ON hr.musica_id = m.id
GROUP BY u.nome
ORDER BY u.nome;