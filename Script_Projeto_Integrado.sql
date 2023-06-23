--CRIAÇÃO DAS TABELAS


--CRIAR TABELA FUNCIONARIOS
CREATE TABLE funcionarios (
                funcionario_id NUMERIC(38)   NOT NULL,
                nome VARCHAR(255)            NOT NULL,
                telefone VARCHAR(20)         NOT NULL,
                email VARCHAR(255)           NOT NULL,
                CONSTRAINT funcionarios_pk PRIMARY KEY (funcionario_id)
);

--FAZER OS COMENTÁRIOS DA TABELA E COLUNAS
COMMENT ON TABLE funcionarios                          IS 'Tabela funcionarios, armazena os dados dos funcionarios';
COMMENT ON COLUMN funcionarios.funcionario_id          IS 'Coluna funcionario_id,Pk da tabela funcionarios, contém o ID do funcionario';
COMMENT ON COLUMN funcionarios.nome                    IS 'Coluna nome da tabela funcionarios, contém o nome do funcionario';
COMMENT ON COLUMN funcionarios.telefone                IS 'Coluna telefone da tabela funcionarios, contém o telefone do funcionario';
COMMENT ON COLUMN funcionarios.email                   IS 'Coluna email da tabela funcionarios, contém o email do funcionario';

--CRIAR TABELA ENDERECO
CREATE TABLE endereco (
                CEP VARCHAR(10)              NOT NULL,
                continente VARCHAR(255)      NOT NULL,
                pais VARCHAR(255)            NOT NULL,
                estado VARCHAR(255)          NOT NULL,
                cidade VARCHAR(255)          NOT NULL,
                bairro VARCHAR               NOT NULL,
                rua VARCHAR(255)             NOT NULL,
                funcionario_id NUMERIC(38)   NOT NULL,
                CONSTRAINT endereco_pk PRIMARY KEY (CEP)
);

--FAZER OS COMENTÁRIOS DA TABELA E COLUNAS
COMMENT ON TABLE endereco                              IS 'Tabela endereco, armazena dados do endereco do funcionario';
COMMENT ON COLUMN endereco.CEP                         IS 'Coluna CEP da tabela endereco, PK da tabela endereco, contém o C.E.P do funcionario';
COMMENT ON COLUMN endereco.continente                  IS 'Coluna continente da tabela endereco, contém o continete de endereco do funcionario';
COMMENT ON COLUMN endereco.pais                        IS 'Coluna pais da tabela endereco, contém pais de endereco do funcionario';
COMMENT ON COLUMN endereco.estado                      IS 'Coluna estado da tabela endereco, contém o estado de endereco do funcionario';
COMMENT ON COLUMN endereco.cidade                      IS 'Coluna cidade da tabela endereco, contém cidade de endereco do funcionario';
COMMENT ON COLUMN endereco.bairro                      IS 'Coluna bairro da tabela endereco, contém o bairro de endereco do funcionario';
COMMENT ON COLUMN endereco.rua                         IS 'Coluna rua da tabela endereco, contém a rua de endereco do funcionario';
COMMENT ON COLUMN endereco.funcionario_id              IS 'Coluna funcionario_id da tabela endereco, FK para a tabela funcionarios, contém o  id do funcionario';

--CRIAR TABELA USUARIO
CREATE TABLE usuario (
                curso_id NUMERIC(38)         NOT NULL,
                funcionario_id NUMERIC(38)   NOT NULL,
                certificados VARCHAR         NOT NULL,
                senha VARCHAR                NOT NULL,
                CONSTRAINT usuario_pk PRIMARY KEY (curso_id, funcionario_id)
);

--FAZER OS COMENTÁRIOS DA TABELA E COLUNAS
COMMENT ON TABLE usuario                               IS 'Tabela usuario, armazena os dados do perfil do funcionario';
COMMENT ON COLUMN usuario.curso_id                     IS 'Coluna curso_id da tabela usuario, PFK da tabela usuario, FK para a tabela cursos,  contém o id do curso';
COMMENT ON COLUMN usuario.funcionario_id               IS 'Coluna funcionario_id da tabela usuario,PFK da tabela usuario, FK para a tabela funcionarios, contém o ID do funcionario';
COMMENT ON COLUMN usuario.certificados                 IS 'Coluna certificados da tabela usuario, contém os certificados obtidos ao realizar cursos';
COMMENT ON COLUMN usuario.senha                        IS 'Coluna senha da tabela usuário, contém a senha do usuário';

--CRIAR TABELA CURSOS
CREATE TABLE cursos (
                curso_id NUMERIC(38)         NOT NULL,
                nome_do_curso VARCHAR(255)   NOT NULL,
                duracao VARCHAR              NOT NULL,
                CONSTRAINT cursos_pk PRIMARY KEY (curso_id)
);

--FAZER OS COMENTÁRIOS DA TABELA E COLUNAS
COMMENT ON TABLE cursos                                IS 'Tabela cursos, armazena os cursos disponiveis';
COMMENT ON COLUMN cursos.curso_id                      IS 'Coluna curso_id da tabela cursos, PK da tabela cursos, contém o id do curso';
COMMENT ON COLUMN cursos.nome_do_curso                 IS 'Coluna nome_do_curso da tabela cursos, contém o nome do curso';
COMMENT ON COLUMN cursos.duracao                       IS 'Coluna duracao da tabela cursos, contém a dura��o de cada curso em horas';

--CRIAR TABELA PONTOS
CREATE TABLE pontos (
                pontos NUMERIC               NOT NULL,
                pontos_atuais NUMERIC        NOT NULL,
                pontos_adquiridos NUMERIC    NOT NULL,
                CONSTRAINT pontos_pk PRIMARY KEY (pontos)
);

--FAZER OS COMENTÁRIOS DA TABELA E COLUNAS
COMMENT ON TABLE pontos                                IS 'Tabela pontos, contém dados sobre os pontos do usuario';
COMMENT ON COLUMN pontos.pontos                        IS 'Coluna pontos da tabela pontos, PK da tabela pontos, contém os pontos do usuário';
COMMENT ON COLUMN pontos.pontos_atuais                 IS 'Coluna pontos_atuais da tabela pontos, contém os pontos que o usuario possui no momento';
COMMENT ON COLUMN pontos.pontos_adquiridos             IS 'Coluna pontos_adquiridos da tabela pontos, contém os pontos totais adquiridos pelo usuário';

--CRIAR TABELA PONTUACAO
CREATE TABLE pontuacao (
                pontos NUMERIC               NOT NULL,
                funcionario_id NUMERIC(38)   NOT NULL,
                curso_id NUMERIC(38)         NOT NULL,
                pontos_por_curso NUMERIC     NOT NULL,
                CONSTRAINT pontuacao_pk PRIMARY KEY (pontos)
);

--FAZER OS COMENTÁRIOS DA TABELA E COLUNAS
COMMENT ON TABLE pontuacao                             IS 'Tabela pontuacao, armazena a pontuacao do funcionario na plataforma';
COMMENT ON COLUMN pontuacao.pontos                     IS 'Coluna pontos da tabela pontuacao,PFK da tabela pontuacao, FK para a tabela pontos,  contém os pontos do usuário';
COMMENT ON COLUMN pontuacao.funcionario_id             IS 'Coluna funcionario_id, PFK da tabela pontuacao,FK para a tabela funcionarios, contém o id do funcionario';
COMMENT ON COLUMN pontuacao.curso_id                   IS 'Coluna curso_id da tabela pontuacao,PFK da tabela pontuacao, FK para a tabela cursos, contém o id do curso';
COMMENT ON COLUMN pontuacao.pontos_por_curso           IS 'Coluna pontos_por_curso da tabela pontuacao, contém quantidade de pontos recebidos ao realizar X curso';

--CRIAR TABELA CLASSIFICACAO
CREATE TABLE classificacao (
                funcionario_id NUMERIC(38)   NOT NULL,
                colocacao_no_ranking NUMERIC NOT NULL,
                pontos NUMERIC               NOT NULL,
                CONSTRAINT classificacao_pk PRIMARY KEY (funcionario_id)
);

--FAZER OS COMENTÁRIOS DA TABELA E COLUNAS
COMMENT ON TABLE classificacao                         IS 'Tabela classificacao, armazena dados sobre a classificacao dos funcionarios';
COMMENT ON COLUMN classificacao.funcionario_id         IS 'Coluna funcionario_id da tabela classificacao, PFK da tabela classificacao, FK para a tabela funcionarios, contém o id do funcionario';
COMMENT ON COLUMN classificacao.colocacao_no_ranking   IS 'Coluna colocacao_no_ranking da tabela classificacao, contém a coloca�ao no ranking de pontos';
COMMENT ON COLUMN classificacao.pontos                 IS 'Coluna pontos da tabela classificacao, contém os pontos do usuário';

--CRIAR TABELA RECOMPENSAS
CREATE TABLE recompensas (
                recompensa_id NUMERIC(38)    NOT NULL,
                pontos NUMERIC               NOT NULL,
                CONSTRAINT recompensas_pk PRIMARY KEY (recompensa_id)
);

--FAZER OS COMENTÁRIOS DA TABELA E COLUNAS
COMMENT ON TABLE recompensas                           IS 'Tabela recompensas, armazena dados das recompensas';
COMMENT ON COLUMN recompensas.recompensa_id            IS 'Coluna recompensa_id da tabela recompensas, PK da tabela recompensas, contém o id da recompensa';
COMMENT ON COLUMN recompensas.pontos                   IS 'Coluna pontos da tabela recompensas, FK para a tabela pontos, contém os pontos do usuário';

--CRIAR TABELA NOME_RECOMPENSA
CREATE TABLE nome_recompensa (
                recompensa_id NUMERIC(38)            NOT NULL,
                nome_da_recompensa VARCHAR           NOT NULL,
                CONSTRAINT nome_recompensa_pk PRIMARY KEY (recompensa_id)
);

--FAZER OS COMENTÁRIOS DA TABELA E COLUNAS
COMMENT ON TABLE nome_recompensa                       IS 'Tabela nome_recompensa, contém o nome da recompensa';
COMMENT ON COLUMN nome_recompensa.recompensa_id        IS 'Coluna recompensa_id da tabela recompensas, PK da tabela recompensas, id da recompensa';
COMMENT ON COLUMN nome_recompensa.nome_da_recompensa   IS 'Coluna nome_da_recompensa da tabela nome_recompensa, contém o nome da recompensa';

--CRIAR TABELA PRECO_RECOMPENSA
CREATE TABLE preco_recompensa (
                recompensa_id NUMERIC(38)    NOT NULL,
                preco_da_recompensa NUMERIC  NOT NULL,
                CONSTRAINT preco_recompensa_pk PRIMARY KEY (recompensa_id)
);

--FAZER OS COMENTÁRIOS DA TABELA E COLUNAS
COMMENT ON TABLE preco_recompensa                      IS 'Tabela preco_recompensa, contém o preço das recompensas';
COMMENT ON COLUMN preco_recompensa.recompensa_id       IS 'Coluna recompensa_id da tabela recompensas, PK da tabela recompensas, id da recompensa';
COMMENT ON COLUMN preco_recompensa.preco_da_recompensa IS 'Coluna preco_da_recompensa da tabela preco_recompensa, contém o preço da recompensa';






--CRIAR AS CONSTRAINTS DE FOREIGN KEY ENTRE AS TABELAS
ALTER TABLE pontuacao ADD CONSTRAINT pontos_pontuacao_fk
FOREIGN KEY (pontos)
REFERENCES pontos (pontos)
ON DELETE NO ACTION
ON UPDATE NO ACTION
             NOT DEFERRABLE;

ALTER TABLE recompensas ADD CONSTRAINT pontos_recompensas_fk
FOREIGN KEY (pontos)
REFERENCES pontos (pontos)
ON DELETE NO ACTION
ON UPDATE NO ACTION
             NOT DEFERRABLE;

ALTER TABLE preco_recompensa ADD CONSTRAINT recompensas_preco_recompensa_fk
FOREIGN KEY (recompensa_id)
REFERENCES recompensas (recompensa_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
             NOT DEFERRABLE;

ALTER TABLE nome_recompensa ADD CONSTRAINT recompensas_nome_recompensa_fk
FOREIGN KEY (recompensa_id)
REFERENCES recompensas (recompensa_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
             NOT DEFERRABLE;

ALTER TABLE pontuacao ADD CONSTRAINT cursos_pontuacao_fk
FOREIGN KEY (curso_id)
REFERENCES cursos (curso_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
             NOT DEFERRABLE;

ALTER TABLE usuario ADD CONSTRAINT cursos_perfil_fk
FOREIGN KEY (curso_id)
REFERENCES cursos (curso_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
             NOT DEFERRABLE;

ALTER TABLE endereco ADD CONSTRAINT funcionarios_endereco_fk
FOREIGN KEY (funcionario_id)
REFERENCES funcionarios (funcionario_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
             NOT DEFERRABLE;

ALTER TABLE pontuacao ADD CONSTRAINT funcionarios_pontuacao_fk
FOREIGN KEY (funcionario_id)
REFERENCES funcionarios (funcionario_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
             NOT DEFERRABLE;

ALTER TABLE classificacao ADD CONSTRAINT funcionarios_classificacao_fk
FOREIGN KEY (funcionario_id)
REFERENCES funcionarios (funcionario_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
             NOT DEFERRABLE;

ALTER TABLE usuario ADD CONSTRAINT funcionarios_perfil_fk
FOREIGN KEY (funcionario_id)
REFERENCES funcionarios (funcionario_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
             NOT DEFERRABLE;

ALTER TABLE classificacao ADD CONSTRAINT pontuacao_classificacao_fk1
FOREIGN KEY (pontos)
REFERENCES pontuacao (pontos)
ON DELETE NO ACTION
ON UPDATE NO ACTION
             NOT DEFERRABLE;
