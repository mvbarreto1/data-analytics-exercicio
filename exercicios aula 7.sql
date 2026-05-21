select * from academico.disciplina;

select * from academico.escola;

select * from academico.estudantes;

select * from academico.genero;

select * from academico.matricula;

select * from academico.serie;

select * from academico.tipo_escola;


-- Liste o total de estudantes 1. por série.

SELECT serie.descricao,
       COUNT(matricula.id_estudante) AS total_estudantes
FROM academico.matricula
inner join academico.serie
ON matricula.id = serie.id
GROUP BY serie.descricao;

--  Liste as disciplinas com mais de 3 matrículas.

SELECT disciplina.descricao,
       COUNT(matricula.id_estudante) AS total_matriculas
FROM academico.matricula
INNER JOIN academico.disciplina
ON matricula.id_disciplina = disciplina.id
GROUP BY disciplina.descricao
HAVING COUNT(matricula.id_estudante) > 3;

--  Mostre a média de notas por disciplina, ordenada da maior para a menor.

SELECT disciplina.descricao,
       AVG(matricula.nota) AS media_notas
FROM academico.matricula
INNER JOIN academico.disciplina
ON matricula.id_disciplina = disciplina.id
GROUP BY disciplina.descricao
ORDER BY media_notas DESC;


-- Mostre os 5 estudantes com maior média de nota. 

SELECT estudantes.nome_estudante,
       ROUND(AVG(matricula.nota), 2) AS media_notas
FROM academico.matricula
INNER JOIN academico.estudantes
ON matricula.id_estudante = estudantes.id
GROUP BY estudantes.nome_estudante

--  Liste a quantidade de escolas por tipo de escola.

SELECT tipo_escola.descricao,
       COUNT(escola.id) AS quantidade_escolas
FROM academico.escola
INNER JOIN academico.tipo_escola
ON escola.id_tipo_escola = tipo_escola.id
GROUP BY tipo_escola.descricao;


-- ex 2


-- Mostre as escolas com mais de 2 matrículas, ordenadas pelo total.

SELECT escola.nome_escola,
       COUNT(matricula.id_estudante) AS total_matriculas
FROM academico.matricula
INNER JOIN academico.escola
ON matricula.id_escola = escola.id
GROUP BY escola.nome_escola
HAVING COUNT(matricula.id_estudante) > 2
ORDER BY total_matriculas DESC;

-- Exiba a média de nota por escola e disciplina.

SELECT escola.nome_escola,
       disciplina.descricao,
       ROUND(AVG(matricula.nota), 2) AS media_notas
FROM academico.matricula
INNER JOIN academico.escola
ON matricula.id_escola = escola.id
INNER JOIN academico.disciplina
ON matricula.id_disciplina = disciplina.id
GROUP BY escola.nome_escola, disciplina.descricao
ORDER BY escola.nome_escola;


-- Liste os gêneros com mais de 3 estudantes cadastrados.

SELECT genero.descricao,
       COUNT(estudantes.id) AS total_estudantes
FROM academico.estudantes
INNER JOIN academico.genero
ON estudantes.id_genero = genero.id
GROUP BY genero.descricao
HAVING COUNT(estudantes.id) >= 3;

-- Mostre as 3 disciplinas com maior média de nota.

SELECT disciplina.descricao,
       ROUND(AVG(matricula.nota), 2) AS media_notas
FROM academico.matricula
INNER JOIN academico.disciplina
ON matricula.id_disciplina = disciplina.id
GROUP BY disciplina.descricao
ORDER BY media_notas DESC
LIMIT 3;

--  Liste a quantidade de matrículas por série, apenas para séries com mais de 4 estudantes.

SELECT serie.descricao,
       COUNT(matricula.id_estudante) AS total_matriculas
FROM academico.matricula
INNER JOIN academico.serie
ON matricula.id = serie.id
GROUP BY serie.descricao
HAVING COUNT(matricula.id_estudante) > 4
ORDER BY total_matriculas DESC;
