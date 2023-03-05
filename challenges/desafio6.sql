SELECT 
   MIN(plan.valor_plano) AS 'faturamento_minimo',
   MAX(plan.valor_plano) AS 'faturamento_maximo',
   ROUND(AVG(plan.valor_plano), 2) AS 'faturamento_medio',
   ROUND(SUM(plan.valor_plano), 2) AS 'faturamento total'
FROM SpotifyClone.pessoa_usuaria AS us
INNER JOIN SpotifyClone.plano AS plan ON us.plano_id = plan.id;