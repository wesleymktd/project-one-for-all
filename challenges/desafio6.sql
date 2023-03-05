SELECT 
   CAST(MIN(plan.valor_plano) AS DECIMAL(10,2)) AS 'faturamento_minimo',
   CAST(MAX(plan.valor_plano) AS DECIMAL(10, 2)) AS 'faturamento_maximo',
   CAST(AVG(plan.valor_plano) AS DECIMAL(10, 2)) AS 'faturamento_medio',
   CAST(SUM(plan.valor_plano) AS DECIMAL(10, 2)) AS 'faturamento_total'
FROM SpotifyClone.plano AS plan
INNER JOIN SpotifyClone.pessoa_usuaria AS us ON plan.id = us.plano_id;