USE projeto_relojoaria;
CREATE TABLE relojoaria(
id INT NOT NULL,
nome VARCHAR(45) NOT NULL,
cnpj VARCHAR(100) NOT NULL,
endereco VARCHAR(100) NOT NULL,
telefone VARCHAR(45) NOT NULL,
email VARCHAR(100) NOT NULL,
CONSTRAINT pk_Relojoaria PRIMARY KEY(idRelojoaria)
);

CREATE TABLE funcionario(
id INT NOT NULL,
nome VARCHAR(100) NOT NULL,
idRelojoaria INT NOT NULL,
cpf VARCHAR(100) NOT NULL,
funcao VARCHAR(45) NOT NULL,
telefone VARCHAR(45) NOT NULL,
email VARCHAR(100) NOT NULL,
CONSTRAINT pk_funcionario PRIMARY KEY(idfuncionario),
CONSTRAINT fk_relojoaria FOREIGN KEY(idRelojoaria)
REFERENCES Relojoaria(id)
);
CREATE TABLE cadastro_cliente(
id INT NOT NULL AUTO_INCREMENT,
nome VARCHAR(45) NOT NULL,
idRelojoaria INT NOT NULL,
cpf VARCHAR(45) NOT NULL,
endereço VARCHAR(100),
email VARCHAR(100) NOT NULL,
telCell VARCHAR(45) NOT NULL,
CONSTRAINT pk_cadastro PRIMARY KEY(id),
CONSTRAINT fk_sistema_relojoaria FOREIGN KEY(idRelojoaria)
REFERENCES Relojoaria(id)
);
CREATE TABLE cliente_pagante(
id INT NOT NULL AUTO_INCREMENT,
nome VARCHAR(45) NOT NULL,
idCadastro INT NOT NULL,
fatura VARCHAR(100)NOT NULL,
data_pagamento VARCHAR(45) NOT NULL,
email_de_confirmacao VARCHAR(100) NOT NULL,
CONSTRAINT pk_pagante PRIMARY KEY(id),
CONSTRAINT fk_documentacao_cliente FOREIGN KEY(idCadastro)
REFERENCES cadastro_cliente(id)
);
CREATE TABLE nao_pagante(
id INT NOT NULL AUTO_INCREMENT,
nome VARCHAR(45) NOT NULL,
idCadastro INT NOT NULL,
fatura VARCHAR(45) NOT NULL,
data_vencimento VARCHAR(45) NOT NULL,
juros_pDia VARCHAR(45) NOT NULL,
email_cobranca VARCHAR(100) NOT NULL,
CONSTRAINT pk_NP PRIMARY KEY(id),
CONSTRAINT fk_devedor FOREIGN KEY(idCadastro)
REFERENCES cadastro_cliente(id)
);
CREATE TABLE venda(
id INT NOT NULL AUTO_INCREMENT,
idfuncionario INT NOT NULL,
quant_prod VARCHAR(45) NOT NULL,
valor_unitario VARCHAR(45) NOT NULL,
valor_tot VARCHAR(45) NOT NULL,
CONSTRAINT pk_venda PRIMARY KEY(id),
CONSTRAINT fk_resp_venda FOREIGN KEY(idFuncionario)
REFERENCES funcionario(id)
);
CREATE TABLE produto(
id INT NOT NULL AUTO_INCREMENT,
nome VARCHAR(45) NOT NULL,
idRelojoaria INT NOT NULL,
tipo VARCHAR(45) NOT NULL,
marca VARCHAR(45)NOT NULL,
valor_unidade VARCHAR(45)NOT NULL,
modelo VARCHAR(45)NOT NULL,
material VARCHAR(45)NOT NULL,
CONSTRAINT pk_produto PRIMARY KEY(id),
CONSTRAINT fk_loja FOREIGN KEY(idRelojoaria)
REFERENCES Relojoaria(id)
);
CREATE TABLE estoque(
id INT NOT NULL AUTO_INCREMENT,
quant_armazenado VARCHAR(45) NOT NULL,
idProduto INT NOT NULL,
CONSTRAINT pk_estoque PRIMARY KEY(id),
CONSTRAINT fk_produto FOREIGN KEY(idProduto)
REFERENCES produto(id)
);
