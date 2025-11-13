-- Primeira consulta:
SELECT f.nome_funcionario, f.sobrenome_funcionario, p.historico_pontos_piloto
FROM projeto_f1.funcionarios AS f
INNER JOIN projeto_f1.pilotos AS p ON f.id_funcionario = p.funcionario_id
WHERE f.equipe_id = 2;

-- Segunda consulta:
SELECT  e.nome_equipe, f.nome_funcionario, f.sobrenome_funcionario, COUNT(pc.funcionario_id) AS qtd_corridas, ROUND(MAX(p.historico_pontos_piloto)/COUNT(pc.funcionario_id), 2) AS média_pontos
FROM projeto_f1.corridas_pilotos AS pc
INNER JOIN projeto_f1.pilotos AS p ON pc.funcionario_id = p.funcionario_id
INNER JOIN projeto_f1.funcionarios AS f ON p.funcionario_id = f.id_funcionario
INNER JOIN projeto_f1.equipes AS e ON f.equipe_id = e.id_equipe
GROUP BY e.nome_equipe, f.nome_funcionario, f.sobrenome_funcionario;

-- Terceira consulta:
SELECT f.nome_funcionario, f.sobrenome_funcionario, m.nivel_experiencia_mecanico, e.nome_equipe
FROM projeto_f1.mecanicos_pecas AS mp
INNER JOIN projeto_f1.funcionarios AS f ON mp.funcionario_id = f.id_funcionario
INNER JOIN projeto_f1.mecanicos AS m ON f.id_funcionario = m.funcionario_id
INNER JOIN projeto_f1.equipes AS e ON f.equipe_id = e.id_equipe
WHERE mp.peca_id IN (
  SELECT p.id_peca
  FROM projeto_f1.pecas AS p
  INNER JOIN projeto_f1.fabricantes AS fb ON p.fabricante_id = fb.id_fabricante
  WHERE fb.custo_temporada_fabricante < 5000000
)
GROUP BY f.nome_funcionario, f.sobrenome_funcionario, m.nivel_experiencia_mecanico, e.nome_equipe;
