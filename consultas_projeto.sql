-- Primeira consulta: Quais patrocinador investiram um valor de patrocinio maior ou igual a 3 milhôes
SELECT p.nome_patrocinador, e.nome_equipe, ep.valor_patrocinio
FROM projeto_f1.patrocinadores AS p
INNER JOIN projeto_f1.equipes_patrocinadores AS ep ON p.id_patrocinador = ep.patrocinador_id
INNER JOIN projeto_f1.equipes AS e ON ep.equipe_id = e.id_equipe
WHERE ep.valor_patrocinio >= 3000000;

-- Segunda consulta:  Qual a média de pontos por corrida de cada piloto das equipes
SELECT  e.nome_equipe, f.nome_funcionario, f.sobrenome_funcionario, COUNT(pc.funcionario_id) AS qtd_corridas, ROUND(MAX(p.historico_pontos_piloto)/COUNT(pc.funcionario_id), 2) AS média_pontos
FROM projeto_f1.corridas_pilotos AS pc
INNER JOIN projeto_f1.pilotos AS p ON pc.funcionario_id = p.funcionario_id
INNER JOIN projeto_f1.funcionarios AS f ON p.funcionario_id = f.id_funcionario
INNER JOIN projeto_f1.equipes AS e ON f.equipe_id = e.id_equipe
GROUP BY e.nome_equipe, f.nome_funcionario, f.sobrenome_funcionario;


-- Terceira consulta: Quais as equipes e seus mecânicos que utilizam peças fornecidas por fabricantes com custo por temporado maior ou igual a 5 milhôes
SELECT  e.nome_equipe, f.nome_funcionario, f.sobrenome_funcionario, m.nivel_experiencia_mecanico
FROM projeto_f1.mecanicos_pecas AS mp
INNER JOIN projeto_f1.funcionarios AS f ON mp.funcionario_id = f.id_funcionario
INNER JOIN projeto_f1.mecanicos AS m ON f.id_funcionario = m.funcionario_id
INNER JOIN projeto_f1.equipes AS e ON f.equipe_id = e.id_equipe
WHERE mp.peca_id IN (
  SELECT p.id_peca
  FROM projeto_f1.pecas AS p
  INNER JOIN projeto_f1.fabricantes AS fb ON p.fabricante_id = fb.id_fabricante
  WHERE fb.custo_temporada_fabricante >= 5000000
)
GROUP BY e.nome_equipe, f.nome_funcionario, f.sobrenome_funcionario, m.nivel_experiencia_mecanico;
