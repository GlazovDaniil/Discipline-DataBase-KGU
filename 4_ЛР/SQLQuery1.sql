SELECT ResProv * Result * Znak Result FROM
	(SELECT  exp(sum(log(abs(res)))) Result FROM
		(SELECT
		CASE
		WHEN ������ = '���������' OR ������ = '�������' OR ������ Is Null THEN Null
		WHEN ������ < 0 OR ������ > 0 THEN ������
		END res
		FROM Ocenki)R )REZ, 
	(SELECT 
		CASE
		WHEN sum(Prov) != Count(Prov) THEN 0
		ELSE 1 
		END ResProv 
	FROM
	(SELECT CASE 
	    WHEN ������ = '���������' OR ������ = '�������' OR ������ Is Null THEN 1
		WHEN ������ = 0 THEN 0
		ELSE 1
		END Prov
 	FROM Ocenki) P)RP,
	(SELECT 
	CASE
	WHEN Pro % 2 = 0 THEN 1
	ELSE -1
	END Znak
	FROM
		(SELECT count(������) Pro
 		FROM Ocenki 
		WHERE ������ < 0 AND ������ != '���������' AND ������ != '�������') M
	) MINU
