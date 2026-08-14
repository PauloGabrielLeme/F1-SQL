# F1-SQL 🏎️

Projeto de banco de dados relacional que modela a estrutura de uma equipe de Fórmula 1: equipes, funcionários, pilotos, mecânicos, chefes de equipe, médicos, carros, peças, fabricantes, patrocinadores e corridas.

O projeto foi desenvolvido em SQL e cobre três etapas clássicas de um trabalho de banco de dados: **criação das tabelas (DDL)**, **inserção de dados (DML)** e **consultas analíticas (DQL)**.

## 📁 Estrutura do repositório

| Arquivo | Descrição |
|---|---|
| [`tabelas_projeto.sql`](tabelas_projeto.sql) | Script de criação do schema `projeto_f1` e de todas as tabelas, com chaves primárias, chaves estrangeiras e constraints de validação (`CHECK`). |
| [`dados_projeto.sql`](dados_projeto.sql) | Script de inserção (`INSERT`) de dados de exemplo em todas as tabelas do projeto. |
| [`consultas_projeto.sql`](consultas_projeto.sql) | Três consultas (`SELECT`) que respondem a perguntas de negócio sobre os dados do projeto. |
| `LICENSE` | Licença GPL-3.0. |

## 🗂️ Modelo de dados

Todo o modelo vive dentro do schema `projeto_f1` e é composto pelas seguintes tabelas:

- **equipes** — dados cadastrais das equipes (nome, país-sede, data de fundação).
- **funcionarios** — tabela base de pessoas que trabalham nas equipes (nome, e-mail, salário, endereço, data de nascimento), vinculada a uma equipe.
- **telefones** — telefones de contato de cada funcionário.
- **pilotos**, **mecanicos**, **chefes_equipes**, **departamentos_medicos** — especializações de `funcionarios` (relação 1:1 por `funcionario_id`), cada uma com atributos próprios (ex.: pontuação histórica do piloto, nível de experiência do mecânico, formação do chefe de equipe, especialidade do médico).
- **certificacoes** — certificações associadas aos profissionais da equipe médica.
- **carros** — carros vinculados a um piloto (cor, chassi, ano).
- **fabricantes** e **pecas** — fabricantes de peças e as peças que fornecem, com custo por temporada.
- **mecanicos_pecas** e **mecanicos_carros** — tabelas associativas entre mecânicos, peças e carros.
- **equipes_associadas** — associação entre equipes e fabricantes.
- **patrocinadores** e **equipes_patrocinadores** — patrocinadores e os contratos de patrocínio firmados com cada equipe (valor, duração, tipo).
- **corridas** — corridas/temporadas disputadas.
- **corridas_pilotos** e **corridas_equipes** — resultados de pilotos e equipes em cada corrida (pontuação e posição).

O modelo utiliza chaves estrangeiras para garantir integridade referencial entre todas as entidades relacionadas.

## 🔎 Consultas incluídas

O arquivo `consultas_projeto.sql` traz três consultas principais:

1. **Patrocinadores de alto valor** — quais patrocinadores investiram um valor de patrocínio maior ou igual a R$ 3 milhões, e em qual equipe.
2. **Média de pontos por corrida** — a média de pontos obtida por corrida, por piloto de cada equipe.
3. **Mecânicos e peças de fabricantes premium** — quais equipes e mecânicos utilizam peças fornecidas por fabricantes com custo de temporada maior ou igual a R$ 5 milhões.

## 🚀 Como executar

O projeto foi escrito em SQL padrão (PostgreSQL). Para rodar localmente:

1. Crie um banco de dados (ou utilize um já existente).
2. Execute os scripts na seguinte ordem:

```bash
psql -d nome_do_banco -f tabelas_projeto.sql
psql -d nome_do_banco -f dados_projeto.sql
psql -d nome_do_banco -f consultas_projeto.sql
```

Ou, se preferir, copie e cole o conteúdo dos arquivos diretamente no seu cliente SQL de preferência (DBeaver, pgAdmin, etc.), sempre respeitando a ordem: **tabelas → dados → consultas**.

## 🛠️ Tecnologias

- SQL (DDL, DML e DQL)
- Compatível com PostgreSQL

## 📄 Licença

Este projeto está licenciado sob os termos da [GPL-3.0](LICENSE).

## ✍️ Autor

Desenvolvido por:
[Paulo Gabriel](https://github.com/GabrielSugiura).
[Orlando Nagrockis](https://github.com/OrlandoOnabe).
[Lorenzo Colonnese](https://github.com/LorenzoColonnese).
[Morgana Zanetti](https://github.com/MorganaZanetti).
