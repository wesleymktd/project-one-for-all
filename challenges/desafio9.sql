SELECT
	COUNT(us.nome) AS 'musicas_no_historico'
FROM SpotifyClone.historico_de_reproducao AS rep
INNER JOIN SpotifyClone.pessoa_usuaria AS us ON rep.pessoa_usuaria_id = us.id
WHERE us.nome = 'Barbara Liskov';