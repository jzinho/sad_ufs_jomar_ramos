
CREATE TABLE dim_tempo_1 (
                id_curso INTEGER NOT NULL,
                Descricao VARCHAR NOT NULL,
                CONSTRAINT dim_tempo_1_pk PRIMARY KEY (id_curso)
);


CREATE TABLE dim_tempo (
                id_tempo INTEGER NOT NULL,
                Semestre VARCHAR NOT NULL,
                Ano VARCHAR NOT NULL,
                CONSTRAINT dim_tempo_pk PRIMARY KEY (id_tempo)
);


CREATE TABLE dim_disciplina (
                id_disciplina INTEGER NOT NULL,
                Descricao VARCHAR NOT NULL,
                CONSTRAINT dim_disciplina_pk PRIMARY KEY (id_disciplina)
);


CREATE TABLE dim_aluno (
                id_aluno INTEGER NOT NULL,
                Nome VARCHAR NOT NULL,
                Idade INTEGER NOT NULL,
                CONSTRAINT dim_aluno_pk PRIMARY KEY (id_aluno)
);


CREATE TABLE fato_aulas (
                id_disciplina INTEGER NOT NULL,
                id_curso INTEGER NOT NULL,
                id_aluno INTEGER NOT NULL,
                id_tempo INTEGER NOT NULL,
                Quant_aprovados INTEGER NOT NULL,
                Quant_reprovados INTEGER NOT NULL,
                Quant_alunos_curso INTEGER NOT NULL,
                Quant_disc_curso INTEGER NOT NULL,
                CONSTRAINT fato_aulas_pk PRIMARY KEY (id_disciplina, id_curso, id_aluno, id_tempo)
);


ALTER TABLE fato_aulas ADD CONSTRAINT dim_tempo_fato_aulas_fk
FOREIGN KEY (id_curso)
REFERENCES dim_tempo_1 (id_curso)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE fato_aulas ADD CONSTRAINT dim_tempo_fato_aulas_fk1
FOREIGN KEY (id_tempo)
REFERENCES dim_tempo (id_tempo)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE fato_aulas ADD CONSTRAINT dim_disciplina_fato_aulas_fk
FOREIGN KEY (id_disciplina)
REFERENCES dim_disciplina (id_disciplina)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE fato_aulas ADD CONSTRAINT dim_aluno_fato_aulas_fk
FOREIGN KEY (id_aluno)
REFERENCES dim_aluno (id_aluno)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;
