/*
create table HISTORICO ( 
idHistorico SERIAL PRIMARY KEY,
idUsuario INTEGER REFERENCES USUARIO(idUsuario),
idLivro INTEGER REFERENCES LIVRO(idLivro),
dataDevolucao DATE,
diasEmAtraso INTEGER
);
*/
/*
create table EMPRESTIMO ( 
idUsuario INTEGER REFERENCES USUARIO(idUsuario),
idExemplar INTEGER REFERENCES EXEMPLAR(idExemplar),
dataRetirada DATE,
PRIMARY KEY (idUsuario, idExemplar)
);
*/
/*
create table EXEMPLAR ( 
idExemplar SERIAL PRIMARY KEY, 
idLivro INTEGER REFERENCES LIVRO(idLivro)
);
*/
/*
create table LIVRO ( 
idLivro SERIAL PRIMARY KEY, 
titulo VARCHAR(70)
);
*/
/*
create table USUARIO ( 
idUsuario SERIAL PRIMARY KEY, 
nome VARCHAR(70)
);
*/