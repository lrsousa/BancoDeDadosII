/*
CREATE OR REPLACE FUNCTION criar_historico() RETURNS TRIGGER AS
$$
DECLARE
	intervalo INTEGER;
BEGIN
	intervalo := CURRENT_DATE - OLD.DATARETIRADA;
	INSERT INTO historico (idusuario, idlivro, datadevolucao, diasematraso)
	VALUES(
		OLD.IDUSUARIO,
		(SELECT idlivro from exemplar WHERE idexemplar = OLD.IDEXEMPLAR),
		CURRENT_DATE,
		(CASE WHEN (intervalo > 14) THEN (intervalo - 14) ELSE 0 END)
	);
		
	RAISE NOTICE 'FEITOOOOO';
	RETURN NEW;
END
$$ LANGUAGE plpgsql;


CREATE TRIGGER criar_historico_on_delete_emprestimo
	AFTER DELETE
	ON emprestimo
	FOR EACH ROW
	EXECUTE PROCEDURE criar_historico();
*/
DELETE FROM emprestimo WHERE idusuario = 4 AND idexemplar = 4;


--retornar dados para inserir na tabela historico
/*
INSERT INTO historico (idusuario, idlivro, datadevolucao, diasematraso)
SELECT * FROM(
SELECT em.idusuario, ex.idlivro, CURRENT_DATE AS datadevolucao, (CASE WHEN CURRENT_DATE - em.dataretirada > 14 THEN CURRENT_DATE - em.dataretirada ELSE 0 END) AS diasematraso
FROM emprestimo em JOIN exemplar ex
USING(idexemplar)
WHERE idusuario = 4 AND ex.idexemplar = 10
) j
*/

/*
CREATE OR REPLACE FUNCTION checar_qtd_livros_alugados() RETURNS TRIGGER AS
$$
DECLARE
	qtd INTEGER;
BEGIN
	SELECT SUM(CASE WHEN e.idUsuario = NEW.idUsuario THEN 1 END)
	FROM emprestimo e
	INTO qtd;
	RAISE NOTICE '%', qtd;
	IF qtd > 2 THEN
		RETURN NULL;
	END IF;
	RETURN NEW;
END
$$ LANGUAGE plpgsql;
*/
/*
CREATE TRIGGER checa_emprestimo_qtd_livros
	BEFORE INSERT ON emprestimo
	FOR EACH ROW
	EXECUTE PROCEDURE checar_qtd_livros_alugados();
*/
--INSERT INTO emprestimo (idusuario, idexemplar, dataretirada) values (4,10,'2016-04-10');
/*
CREATE OR REPLACE FUNCTION calcDifDatas(Date, Date)
RETURNS integer AS
$$
DECLARE
BEGIN
    RETURN $2 - $1;
END
$$ LANGUAGE plpgsql;
*/
--SELECT calcDifDatas('2016-03-04', '2016-04-05');

/*
CREATE VIEW dadosGeraisEmprestimo(nomeUsuario, emprestados, diasSematraso, diascomatraso) AS
SELECT u.nome, COUNT(e.idexemplar) AS emprestado, j.DiasSemAtraso, k.DiasComAtraso 
FROM
usuario u LEFT JOIN emprestimo e USING(idusuario)
LEFT JOIN (
	SELECT h.idusuario AS idusuario, COUNT(CASE WHEN h.diasematraso = 0 THEN 1 END) AS DiasSemAtraso
	FROM historico h
	GROUP BY idusuario
	) j USING(idusuario)
LEFT JOIN (
	SELECT h.idusuario AS idusuario, COUNT(CASE WHEN h.diasematraso > 0 THEN 1 END) AS DiasComAtraso
	FROM historico h
	GROUP BY idusuario
	) k USING(idusuario)
GROUP BY u.idusuario, u.nome, j.DiasSemAtraso, k.DiasComAtraso 
*/
--SELECT * FROM dadosgeraisemprestimo 
