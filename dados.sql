INSERT INTO projeto_f1.equipes (id_equipe, nome_equipe, pais_sede_equipe, dia_fundacao_equipe, mes_fundacao_equipe, ano_fundacao_equipe)
VALUES
   (1, 'Ferrari', 'Itália', 13, 2,  1929),
   (2, 'Aston Martin', 'Inglaterra', 23, 11, 1913),
   (3, 'Mercedes', 'Alemanha', 1, 12, 1926),
   (4, 'Red Bull', 'Áustria', 5, 5, 2005),
   (5, 'McLaren', 'Inglaterra', 17, 9, 1963);

INSERT INTO projeto_f1.funcionarios(id_funcionario, nome_funcionario, sobrenome_funcionario, email_funcionario, salario_funcionario, rua_funcionario, cidade_funcionario, pais_funcionario, cep_funcionario, dia_nascimento_funcionario, mes_nascimento_funcionario, ano_nascimento_funcionario, equipe_id)
VALUES
   (1, 'Charles', 'Leclerc', 'charles.leclerc@gmail.com', 37200, 'Rua das Garagens', 'Mócano-Ville', 'Mónaco', '41015', 16, 10, 1997, 1),
   (2, 'George', 'Russel', 'george.russel@gmail.com', 20800, 'Via Roma', 'Kings Lynn', 'Inglaterra', '41016', 25, 9, 1998, 3),
   (3, 'Oscar', 'Piastri', 'oscar.piastri@gmail.com', 16400, 'Kangaroo', 'Melbourne', 'Australia', '41017', 8, 2, 1988, 5),
   (4, 'Giovanni', 'Silva', 'giovanni.silva@gmail.com', 4500, 'Via Modena', 'Maranello', 'Itália', '41018', 30, 11, 1995, 1),
   (5, 'Fernando', 'Alonso', 'fernando.alonso@gmail.c;om', 17100, 'Pinheiro Machado', 'Santo André', 'Brasil', '41019', 17, 4, 1987, 2),
   (6, 'Henry', 'Brown', 'henry.brown@gmail.com', 5000, 'King Street', 'Silverstone', 'Inglaterra', '98768', 14, 8, 1989, 4),
   (7, 'Oliver', 'Clark', 'oliver.clark@gmail.com', 8200, 'Tijuca', 'São Bernardo do Campo', 'Brasil', '56746', 21, 3, 1991, 4),
   (8, 'George', 'Evans', 'george.evans@gmail.com', 12900, 'Bridge Road', 'Silverstone', 'Inglaterra', '34356', 9, 7, 1990, 2),
   (9, 'Ethan', 'Walker', 'ethan.walker@gmail.com', 4100, 'Aston St', 'Silverstone', 'Inglaterra', '89765', 3, 12, 1994, 3),
   (10, 'William', 'Baker', 'william.baker@gmail.com', 7300, 'Elm Road', 'Broklynn', 'Inglaterra', '41345', 22, 6, 1988, 1),
   (11, 'Hans', 'Müller', 'hans.muller@gmail.com', 8000, 'Ringstraße', 'Stuttgart', 'Alemanha', '70173', 11, 10, 1985, 5),
   (12, 'Klaus', 'Becker', 'klaus.becker@gmail.com', 7700, 'Hauptstraße', 'Munique', 'Alemanha', '70174', 6, 1, 1987, 5),
   (13, 'Lukas', 'Schneider', 'lukas.schneider@gmail.com', 4600, 'Benzstraße', 'Toquio', 'Japão', '70175', 19, 2, 1990, 4),
   (14, 'Markus', 'Weber', 'markus.weber@gmail.com', 10000, 'Karlstraße', 'Nova Iorque', 'USA', '70176', 27, 5, 1986, 3),
   (15, 'Thomas', 'Fischer', 'thomas.fischer@gmail.com', 8300, 'Poststraße', 'Buenos Aires', 'Argentina', '70177', 15, 8, 1989, 3),
   (16, 'Max', 'Verstappen', 'max.verstappen@gmail.com', 40000, 'Racing Ave', 'Hasselt', 'Bélgica', '50203', 30, 9, 1997, 4),
   (17, 'Sergio', 'Perez', 'sergio.perez@gmail.com', 8700, 'Bull Lane', 'Seul', 'Coreia do sul', '5021', 26, 1, 1990, 4),
   (18, 'Christian', 'Horner', 'christian.horner@gmail.com', 9500, 'Track Road', 'Salzburg', 'Áustria', '50226', 16, 11, 1973, 4),
   (19, 'Daniel', 'Ricciardo', 'daniel.ricciardo@gmail.com', 6600, 'Circuit Way', 'Salzburg', 'Áustria', '50235', 1, 7, 1989, 1),
   (20, 'Pierre', 'Gasly', 'pierre.gasly@gmail.com', 9500, 'Pit Street', 'Pequim', 'China', '50247', 7, 2, 1996, 2);

INSERT INTO projeto_f1.patrocinadores (id_patrocinador, nome_patrocinador) VALUES
   (1, 'AMD'),
   (2, 'Petronas'),
   (3, 'Oracle'),
   (4, 'Pirelli'),
   (5, 'Castrol');

INSERT INTO projeto_f1.equipes_patrocinadores (equipe_id, patrocinador_id, valor_patrocinio, duracao_mes_patrocinio, tipo_patrocinio) VALUES
   (1, 1, 3000000, 24, 'Técnico'),
   (2, 5, 2000000, 18, 'Oficial'),
   (3, 2, 3500000, 36, 'Principal'),
   (4, 3, 4000000, 24, 'Principal'),
   (5, 4, 2500000, 30, 'Técnico');

INSERT INTO projeto_f1.telefones (telefone_funcionario, funcionario_id) VALUES
   ('11985743321', 1),
   ('11977665544', 2),
   ('11999887766', 3),
   ('21988997755', 4),
   ('31988776655', 5),
   ('11999882211', 6),
   ('11988774433', 7),
   ('21977668899', 8),
   ('31988779900', 9),
   ('41999884422', 10),
   ('51988773322', 11),
   ('61988776699', 12),
   ('71988997711', 13),
   ('81999886622', 14),
   ('91988775533', 15),
   ('11977554433', 16),
   ('11966443322', 17),
   ('21955332211', 18),
   ('31944221100', 19),
   ('41933110099', 20);

INSERT INTO projeto_f1.corridas (id_corrida, localizacao_cidade_corrida, temporada_corrida) VALUES
   (1, 'Mônaco', '2024'),
   (2, 'Silverstone', '2024'),
   (3, 'Interlagos', '2024'),
   (4, 'Suzuka', '2024'),
   (5, 'Monza', '2024');

INSERT INTO projeto_f1.fabricantes (id_fabricante, nome_fabricante, custo_temporada_fabricante) VALUES
   (1, 'Ferrari Power Unit', 5000000),
   (2, 'Mercedes AMG', 5200000),
   (3, 'Renault Sport', 4800000),
   (4, 'Honda Racing', 5300000),
   (5, 'Cosworth Engines', 4500000);

INSERT INTO projeto_f1.equipes_associadas (equipe_id, fabricante_id) VALUES
   (1, 1),
   (2, 3),
   (3, 2),
   (4, 4),
   (5, 5);

INSERT INTO projeto_f1.pecas (id_peca, nome_peca, fabricante_id) VALUES
   (1, 'Motor V6 Turbo Híbrido', 1),
   (2, 'Câmbio Sequencial de 8 Marchas', 2),
   (3, 'Asa Dianteira Aerodinâmica', 3),
   (4, 'Sistema ERS', 4),
   (5, 'Suspensão Ativa', 5);

INSERT INTO projeto_f1.chefes_equipes (funcionario_id, formacao_chefe, experiencia_anos_chefe) VALUES
   (18, 'Engenharia Mecânica', 20),
   (4, 'Gestão Esportiva', 18),
   (10, 'Engenharia Automobilística', 15),
   (17, 'Administração', 22),
   (3, 'Engenharia de Produção', 17);

INSERT INTO projeto_f1.pilotos (funcionario_id, tipo_piloto, historico_pontos_piloto) VALUES
   (1, 'Titular', 240),
   (2, 'Titular', 195),
   (3, 'Titular', 175),
   (16, 'Titular', 380),
   (5, 'Reserva', 150);

INSERT INTO projeto_f1.carros (id_carro, cor_carro, chassi_carro, ano_carro, funcionario_id) VALUES
   (1, 'Vermelho', 'CHSFER1929', 2024, 1),
   (2, 'Verde', 'CHSAST1913', 2023, 2),
   (3, 'Prata', 'CHSMER1926', 2024, 3),
   (4, 'Azul', 'CHSRED2005', 2024, 16),
   (5, 'Laranja', 'CHSMCL1963', 2023, 5);

INSERT INTO projeto_f1.departamentos_medicos (funcionario_id, especialidade_medico) VALUES
   (6, 'Ortopedia'),
   (7, 'Fisioterapia'),
   (8, 'Cardiologia Esportiva'),
   (9, 'Nutrição Esportiva'),
   (11, 'Psicologia do Esporte');

INSERT INTO projeto_f1.certificacoes (certificacao, funcionario_id) VALUES
   ('ATLS', 6),
   ('SBOT', 6),
   ('CFP Fisioterapia Avançada', 7),
   ('CardioSport Elite', 8),
   ('Psicologia de Alta Performance', 11);

INSERT INTO projeto_f1.mecanicos (funcionario_id, id_crea_mecanico, nivel_experiencia_mecanico) VALUES
   (12, '12345', 'Sênior'),
   (13, '12346', 'Pleno'),
   (14, '12347', 'Júnior'),
   (15, '12348', 'Sênior'),
   (19, '12349', 'Pleno');

INSERT INTO projeto_f1.mecanicos_pecas (peca_id, funcionario_id) VALUES
   (1, 12),
   (2, 13),
   (3, 14),
   (4, 15),
   (5, 19);

INSERT INTO projeto_f1.mecanicos_carros (funcionario_id, carro_id) VALUES
   (12, 1),
   (13, 2),
   (14, 3),
   (15, 4),
   (19, 5);

INSERT INTO projeto_f1.corridas_pilotos (corrida_id, funcionario_id, pontuacao_piloto) VALUES
   (1, 1, 25),
   (2, 2, 18),
   (3, 3, 15),
   (4, 16, 26),
   (5, 5, 12);

INSERT INTO projeto_f1.corridas_equipes (corrida_id, equipe_id, posicao_equipe) VALUES
   (1, 1, 1),
   (2, 2, 2),
   (3, 3, 3),
   (4, 4, 1),
   (5, 5, 2);
