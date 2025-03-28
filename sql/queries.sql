--TOTAL DE ITENS POR SECAO
SELECT SECAO, COUNT(*) AS Total_Itens
FROM EntregasProjetos
GROUP BY SECAO
ORDER BY Total_Itens DESC;

--DISTRIBUICAO DE ENTREGAS POR LANE
SELECT LANE, COUNT(*) AS Total_Itens
FROM EntregasProjetos
GROUP BY LANE
ORDER BY Total_Itens DESC;

--ITENS COM ENTREGA PREVISTA PARA OS PROXIMOS 7 DIAS
SELECT *
FROM EntregasProjetos
WHERE TARGET_DATE BETWEEN GETDATE() AND DATEADD(DAY, 7, GETDATE())
ORDER BY TARGET_DATE;

--CONTAGEM DE ITENS POR COLUMN_NAME
SELECT COLUMN_NAME, COUNT(*) AS Total_Itens
FROM EntregasProjetos
GROUP BY COLUMN_NAME
ORDER BY Total_Itens DESC;

--PROGRESSO POR SECAO E COLUMN_NAME
SELECT SECAO, COLUMN_NAME, COUNT(*) AS Total_Itens
FROM EntregasProjetos
GROUP BY SECAO, COLUMN_NAME
ORDER BY SECAO, COLUMN_NAME;

--ITENS ATRASADOS POR TARGET_DATE E DATA_FIM_ENTREGA VAZIO
SELECT *
FROM EntregasProjetos
WHERE TARGET_DATE < GETDATE()
  AND DATA_FIM_ENTREGA IS NULL
ORDER BY TARGET_DATE;

--TOTAL DE ENTREGAS POR SEMANA
SELECT 
    DATEPART(YEAR, DATA_FIM_ENTREGA) AS Ano,
    DATEPART(WEEK, DATA_FIM_ENTREGA) AS Semana,
    COUNT(*) AS Total_Entregues
FROM EntregasProjetos
WHERE DATA_FIM_ENTREGA IS NOT NULL
GROUP BY DATEPART(YEAR, DATA_FIM_ENTREGA), DATEPART(WEEK, DATA_FIM_ENTREGA)
ORDER BY Ano, Semana;
