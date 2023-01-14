SELECT ResProv * Result * Znak Result FROM
	(SELECT  exp(sum(log(abs(res)))) Result FROM
		(SELECT
		CASE
		WHEN Оценка = 'Незачтено' OR Оценка = 'Зачтено' OR Оценка Is Null THEN Null
		WHEN Оценка < 0 OR Оценка > 0 THEN Оценка
		END res
		FROM Ocenki)R )REZ, 
	(SELECT 
		CASE
		WHEN sum(Prov) != Count(Prov) THEN 0
		ELSE 1 
		END ResProv 
	FROM
	(SELECT CASE 
	    WHEN Оценка = 'Незачтено' OR Оценка = 'Зачтено' OR Оценка Is Null THEN 1
		WHEN Оценка = 0 THEN 0
		ELSE 1
		END Prov
 	FROM Ocenki) P)RP,
	(SELECT 
	CASE
	WHEN Pro % 2 = 0 THEN 1
	ELSE -1
	END Znak
	FROM
		(SELECT count(Оценка) Pro
 		FROM Ocenki 
		WHERE Оценка < 0 AND Оценка != 'Незачтено' AND Оценка != 'Зачтено') M
	) MINU
