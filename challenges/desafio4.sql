SELECT 
    us.nome AS 'pessoa_usuaria',
    IF(YEAR(MAX(repr.data_reproducao)) >= '2021', 'Ativa', 'Inativa') AS 'status_pessoa_usuaria'
FROM SpotifyClone.historico_de_reproducao AS repr
LEFT JOIN SpotifyClone.pessoa_usuaria AS us ON repr.pessoa_usuaria_id = us.id
GROUP BY us.nome
ORDER BY pessoa_usuaria;