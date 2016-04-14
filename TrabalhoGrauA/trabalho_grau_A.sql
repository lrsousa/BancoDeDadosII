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