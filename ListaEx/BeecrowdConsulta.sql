/* LISTAR TODAS AS CONTAS A PAGAR NOME DO FORNECEDOR, CIDADE, VALOR, SITUACAO */

-- FORMA UTILIZANDO WHERE
SELECT f.nome, c.nome,  cp.valor, cp.situacao
FROM contapagar cp, fornecedor f, cidade c
WHERE cp.idfornecedor = f.idfornecedor
  AND f.idcidade = c.idcidade
  AND cp.situacao = 'Aberto';
  
--  FORMA UTILIZANDO JOIN
SELECT f.nome, c.nome, cp.valor, cp.situacao
FROM contapagar cp
INNER JOIN fornecedor f ON f.idfornecedor = cp.idfornecedor
INNER JOIN cidade c ON c.idcidade = f.idcidade
WHERE cp.situacao = 'Aberto';

/**********************************************************************************/


-- 1 (100%)
SELECT c.id, c.name
FROM customers c
WHERE c.id NOT IN (
        SELECT l.id_customers
        FROM locations l
        WHERE l.id_customers = c.id
);
-- 2    
SELECT pd.name, pr.name
FROM products as pd
INNER JOIN providers as pr
ON pd.id_providers = pr.id
WHERE pr.name 'Ajax SA';
-- 3 (100%)
SELECT pd.name, pr.name, cat.name
FROM products as pd
INNER JOIN providers as pr ON pr.id = pd.id_providers
INNER JOIN categories as cat ON cat.id = pd.id_categories
WHERE pr.name = 'Sansul SA' AND cat.name = 'Imported';
-- 4 (100%)
SELECT pd.name, pr.name, pd.price
FROM products AS pd
INNER JOIN providers AS pr ON pr.id = pd.id_providers
INNER JOIN categories AS cat ON cat.id = pd.id_categories
WHERE pd.price > 1000 AND cat.name = 'Super Luxury';
-- 5 (100%)
SELECT c.name, o.id
FROM customers AS c
INNER JOIN orders AS o
ON c.id = o.id_customers 
WHERE EXTRACT(MONTH FROM orders_date) <= 6;
-- 6 (100%)
SELECT pd.name
FROM products AS pd
INNER JOIN providers AS pr
ON pr.id = pd.id_providers
WHERE pr.name LIKE 'P%' AND pd.amount BETWEEN 10 AND 20;
-- 7 (100%)
SELECT c.name
FROM customers AS c
INNER JOIN legal_person AS l ON l.id_customers = c.id
WHERE l.id_customers = c.id;
-- 8 (100%)
SELECT pd.name, cat.name
FROM products AS pd
INNER JOIN categories AS cat
ON cat.id = pd.id_categories
WHERE pd.amount > 100 AND cat.id IN(1, 2, 3, 6, 9)
ORDER BY cat.id
-- 9 (100%)
SELECT DISTINCT(count(*) city) FROM customers
-- 10 (35%)
SELECT np.cpf, CONCAT(
        SUBSTRING(np.cpf, 1, 3), '.', 
        SUBSTRING(np.cpf, 4, 3), '.', 
        SUBSTRING(np.cpf, 7, 3), '-', 
        SUBSTRING(np.cpf, 10, 2)
    )
FROM natural_person AS np;
-- 11 (80%)
SELECT 
    MAX(l.customers_number),
    MIN(l.customers_number),
    AVG(l.customers_number)
FROM lawyers AS l;
-- 12 (100%)
SELECT c.name, ROUND(
        ((math * 2) + (s.specific * 3) + (s.project_plan * 5)) / 10.0,
        2) AS final_score
    FROM candidate AS c
    INNER JOIN score AS s
    ON s.candidate_id = c.id
    ORDER BY final_score DESC;
-- 13 (10%)
SELECT l.name, EXTRACT(DAY FROM l.payday) as day
FROM loan AS l
-- 14 (50%)
SELECT CONCAT('Podium: ', team) AS name
FROM league
LIMIT 3;
SELECT CONCAT('Demoted: ', team) AS name
FROM league
LIMIT 2;
-- 15 (100%)
SELECT CONCAT('Approved: ', students.name) AS name, students.grade
FROM students 
WHERE grade >= 7
ORDER BY grade DESC