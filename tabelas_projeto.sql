CREATE SCHEMA IF NOT EXISTS projeto_f1;

DROP TABLE IF EXISTS projeto_f1.equipes CASCADE;
CREATE TABLE projeto_f1.equipes(
  id_equipe INT  PRIMARY KEY,
  nome_equipe VARCHAR(100) NOT NULL UNIQUE,
  pais_sede_equipe VARCHAR(100),
  dia_fundacao_equipe INT,
  mes_fundacao_equipe INT, 
  ano_fundacao_equipe INT
);

DROP TABLE IF EXISTS projeto_f1.funcionarios CASCADE;
CREATE TABLE projeto_f1.funcionarios(
  id_funcionario INT  PRIMARY KEY,
  nome_funcionario VARCHAR(100) NOT NULL,
  sobrenome_funcionario VARCHAR(100) NOT NULL,
  email_funcionario VARCHAR(100) UNIQUE,
  salario_funcionario INT NOT NULL,
  rua_funcionario VARCHAR(100),
  cidade_funcionario VARCHAR(100),
  pais_funcionario VARCHAR(100),
  cep_funcionario VARCHAR(100),
  dia_nascimento_funcionario INT,
  mes_nascimento_funcionario INT,
  ano_nascimento_funcionario INT,
  equipe_id INT,
  CONSTRAINT ck_salario_funcionario CHECK (salario_funcionario > 0),
  CONSTRAINT ck_dia_nascimento CHECK (dia_nascimento_funcionario > 0 AND dia_nascimento_funcionario < 32),
  CONSTRAINT ck_mes_nascimento CHECK (mes_nascimento_funcionario > 0 AND mes_nascimento_funcionario < 13),
  CONSTRAINT fk_equipe_id FOREIGN KEY (equipe_id) REFERENCES projeto_f1.equipes(id_equipe)
);

DROP TABLE IF EXISTS projeto_f1.patrocinadores CASCADE;
CREATE TABLE projeto_f1.patrocinadores(
  id_patrocinador INT PRIMARY KEY,
  nome_patrocinador VARCHAR(100) NOT NULL
);

DROP TABLE IF EXISTS projeto_f1.equipes_patrocinadores CASCADE;
CREATE TABLE projeto_f1.equipes_patrocinadores(
  equipe_id INT NOT NULL,
  patrocinador_id INT NOT NULL,
  valor_patrocinio INT NOT NULL,
  duracao_mes_patrocinio INT NOT NULL,
  tipo_patrocinio VARCHAR(100),
  PRIMARY KEY (equipe_id, patrocinador_id),
  CONSTRAINT ck_valor_patrocinio CHECK (valor_patrocinio > 0),
  CONSTRAINT fk_equipe_id FOREIGN KEY (equipe_id) REFERENCES projeto_f1.equipes(id_equipe),
  CONSTRAINT fk_patrocinador_id FOREIGN KEY (patrocinador_id) REFERENCES projeto_f1.patrocinadores(id_patrocinador)
);

DROP TABLE IF EXISTS projeto_f1.telefones CASCADE;
CREATE TABLE projeto_f1.telefones(
  telefone_funcionario VARCHAR(100) NOT NULL UNIQUE PRIMARY KEY,
  funcionario_id INT NOT NULL,
  CONSTRAINT fk_funcionario_id FOREIGN KEY (funcionario_id) REFERENCES projeto_f1.funcionarios(id_funcionario)
);

DROP TABLE IF EXISTS projeto_f1.corridas CASCADE;
CREATE TABLE projeto_f1.corridas(
  id_corrida INT  PRIMARY KEY,
  localizacao_cidade_corrida VARCHAR(100),
  temporada_corrida VARCHAR(100)
);

DROP TABLE IF EXISTS projeto_f1.fabricantes CASCADE;
CREATE TABLE projeto_f1.fabricantes(
  id_fabricante INT  PRIMARY KEY,
  nome_fabricante VARCHAR(100) NOT NULL UNIQUE,
  custo_temporada_fabricante INT,
  CONSTRAINT ck_custo_temporada CHECK (custo_temporada_fabricante > 0)
);

DROP TABLE IF EXISTS projeto_f1.equipes_associadas CASCADE;
CREATE TABLE projeto_f1.equipes_associadas(
  equipe_id INT NOT NULL,
  fabricante_id INT NOT NULL,
  PRIMARY KEY (equipe_id, fabricante_id),
  CONSTRAINT fk_equipe_id FOREIGN KEY (equipe_id) REFERENCES projeto_f1.equipes(id_equipe),
  CONSTRAINT fk_fabricante_id FOREIGN KEY (fabricante_id) REFERENCES projeto_f1.fabricantes(id_fabricante)
);

DROP TABLE IF EXISTS projeto_f1.pecas CASCADE;
CREATE TABLE projeto_f1.pecas(
  id_peca INT  PRIMARY KEY,
  nome_peca VARCHAR(200) NOT NULL,
  fabricante_id INT,
  CONSTRAINT fk_fabricante_id FOREIGN KEY (fabricante_id) REFERENCES projeto_f1.fabricantes(id_fabricante)
);

DROP TABLE IF EXISTS projeto_f1.chefes_equipes CASCADE;
CREATE TABLE projeto_f1.chefes_equipes(
  funcionario_id INT PRIMARY KEY,
  formacao_chefe VARCHAR(255),
  experiencia_anos_chefe INT,
  CONSTRAINT fk_funcionario_id FOREIGN KEY (funcionario_id) REFERENCES projeto_f1.funcionarios(id_funcionario)
);

DROP TABLE IF EXISTS projeto_f1.pilotos CASCADE;
CREATE TABLE projeto_f1.pilotos(
  funcionario_id INT PRIMARY KEY, 
  tipo_piloto VARCHAR(100),
  historico_pontos_piloto INT NOT NULL,
  CONSTRAINT fk_funcionario_id FOREIGN KEY (funcionario_id) REFERENCES projeto_f1.funcionarios(id_funcionario)
);

DROP TABLE IF EXISTS projeto_f1.carros CASCADE;
CREATE TABLE projeto_f1.carros(
  id_carro INT  PRIMARY KEY,
  cor_carro VARCHAR(100),
  chassi_carro VARCHAR(100) UNIQUE,
  ano_carro INT,
  funcionario_id INT, 
  CONSTRAINT fk_funcionario_id FOREIGN KEY (funcionario_id) REFERENCES projeto_f1.pilotos(funcionario_id)
);

DROP TABLE IF EXISTS projeto_f1.departamentos_medicos CASCADE;
CREATE TABLE projeto_f1.departamentos_medicos(
  funcionario_id INT PRIMARY KEY, 
  especialidade_medico VARCHAR(200),
  CONSTRAINT fk_funcionario_id FOREIGN KEY (funcionario_id) REFERENCES projeto_f1.funcionarios(id_funcionario)
);

DROP TABLE IF EXISTS projeto_f1.certificacoes CASCADE;
CREATE TABLE projeto_f1.certificacoes(
  certificacao VARCHAR(100),
  funcionario_id INT NOT NULL,
  PRIMARY KEY (certificacao, funcionario_id),
  CONSTRAINT fk_funcionario_id FOREIGN KEY (funcionario_id) REFERENCES projeto_f1.departamentos_medicos(funcionario_id)
);

DROP TABLE IF EXISTS projeto_f1.mecanicos CASCADE;
CREATE TABLE projeto_f1.mecanicos(
  funcionario_id INT PRIMARY KEY,
  id_crea_mecanico VARCHAR(100) NOT NULL,
  nivel_experiencia_mecanico VARCHAR(100),
  CONSTRAINT fk_funcionario_id FOREIGN KEY (funcionario_id) REFERENCES projeto_f1.funcionarios(id_funcionario)
);

DROP TABLE IF EXISTS projeto_f1.mecanicos_pecas CASCADE;
CREATE TABLE projeto_f1.mecanicos_pecas(
  peca_id INT NOT NULL,
  funcionario_id INT NOT NULL,
  PRIMARY KEY (peca_id, funcionario_id),
  CONSTRAINT fk_peca_id FOREIGN KEY (peca_id) REFERENCES projeto_f1.pecas(id_peca),
  CONSTRAINT fk_funcionario_id FOREIGN KEY (funcionario_id) REFERENCES projeto_f1.mecanicos(funcionario_id)
);

DROP TABLE IF EXISTS projeto_f1.mecanicos_carros CASCADE;
CREATE TABLE projeto_f1.mecanicos_carros(
  funcionario_id INT NOT NULL,
  carro_id INT NOT NULL,
  PRIMARY KEY (funcionario_id, carro_id),
  CONSTRAINT fk_funcionario_id FOREIGN KEY (funcionario_id) REFERENCES projeto_f1.mecanicos(funcionario_id),
  CONSTRAINT fk_carro_id FOREIGN KEY (carro_id) REFERENCES projeto_f1.carros(id_carro)
);

DROP TABLE IF EXISTS projeto_f1.corridas_pilotos CASCADE;
CREATE TABLE projeto_f1.corridas_pilotos(
  corrida_id INT NOT NULL,
  funcionario_id INT NOT NULL,
  pontuacao_piloto INT,
  PRIMARY KEY (corrida_id, funcionario_id),
  CONSTRAINT fk_corrida_id FOREIGN KEY (corrida_id) REFERENCES projeto_f1.corridas(id_corrida),
  CONSTRAINT fk_funcionario_id FOREIGN KEY (funcionario_id) REFERENCES projeto_f1.pilotos(funcionario_id)
);

DROP TABLE IF EXISTS projeto_f1.corridas_equipes CASCADE;
CREATE TABLE projeto_f1.corridas_equipes(
  corrida_id INT NOT NULL,
  equipe_id INT NOT NULL,
  posicao_equipe INT,
  PRIMARY KEY (corrida_id, equipe_id),
  CONSTRAINT fk_corrida_id FOREIGN KEY (corrida_id) REFERENCES projeto_f1.corridas(id_corrida),
  CONSTRAINT fk_equipe_id FOREIGN KEY (equipe_id) REFERENCES projeto_f1.equipes(id_equipe)
);
