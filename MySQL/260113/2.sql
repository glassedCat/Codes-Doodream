USE world;

SELECT 1+2;
SELECT 10%3;
-- ---------------------------- --
SELECT 10-7.7 AS RESULT;
SELECT 22+33 AS PLUS;
SELECT 44-22 AS MINUS;
SELECT 77*2 AS MULTIPLY;
-- ---------------------------- --
SELECT 2*44 AS NUMBER, 'THIS IS JUST SOME SHITTEXT' AS TEXT;
-- ---------------------------- --
SELECT "adding text with number: "+ 33 +"NUMBER" AS Sentence;
-- >> 33
SELECT 5*'BOYKISSER';
-- >> 0
SELECT '32'*'24' + 2 AS "ADDING TEXT NUMBER W NUMBER";
-- >> System automatically converts the text number to real number.
-- ---------------------------- --
SELECT TRUE, FALSE;
SELECT !TRUE, NOT 1, !FALSE, NOT FALSE, NOT TRUE, NOT 0;
-- ---------------------------- --
SELECT "BOTH TRUE / BOTH FALSE" AS "IS";
SELECT "A TRUE B FALSE" AS "IS NOT";
SELECT TRUE IS TRUE; -- 1
SELECT FALSE IS TRUE; -- 1 / 0 >> 0 (-1)*(+1)
-- ---------------------------- --
SELECT TRUE AND FALSE, TRUE OR FALSE; -- && (BOTH TRUE >> TRUE), || (A OR B IS TRUE >> TRUE)
SELECT 2>=0 && 3<=10; -- >> TRUE
SELECT 2>5 && 1<20; -- >> FALSE
SELECT 22>=20 OR 1>50; -- >> TRUE
SELECT 2<1 OR 7*7=51; -- >> FALSE
-- ---------------------------- --
/*
	|   연산자 | 의미        |
	|	=    | 양쪽 값이 같음 |
	| !=, <> | 양쪽 값이 다름 |
	| >, <   | (왼쪽, 오른쪽) 값이 더 큼 |
	| >=, <= | (왼쪽, 오른쪽) 값이 같거나 더 큼 |
*/
-- ---------------------------- --
SELECT 'A' = 'A';
SELECT 'A' >= 'D';
-- >> ASCII가 아닌 문자를 비교하게 된다.
SELECT BINARY 'A' <= 'C';
SELECT BINARY 'a' >= 'A';
SELECT ASCII('A'), ASCII('a'), ASCII('C');
-- >> ASCII를 비교하려면 BINARY를 사용, 숫자로 출력하려면 ASCII(); 를 사용
-- ---------------------------- --
SELECT 'A' = 'a', 'd' = 'D'; -- >> TRUE/TRUE | SQL의 사칙연산자는 대소문자 구분을 하지않는다.
-- ---------------------------- --
SELECT Name, LifeExpectancy >= 80 AS 'Countries with Life Expectancy over 80' FROM country;
SELECT Name, LifeExpectancy >= 65 AS 'Countries with Life Expectancy over 65' FROM country;
-- ---------------------------- --
# SELECT * FROM -NAME- WHERE : FROM -NAME-의 모든것 중에서 ~인 것을 ~해라

# 문자열 비교 - Name 컬럼이 'k' 이상이고 'l' 이하인 데이터를 조회
SELECT * FROM city WHERE Name BETWEEN 'k' and 'l';
SELECT * FROM city WHERE Name NOT BETWEEN 'k' and 'l';
SELECT * FROM city WHERE Name BETWEEN 'a' and 'b'; -- A보다 크고 B보다 작음 >> 알파벳순 A에서 시작해서 B가 오기전에 끝냄.
SELECT * FROM city WHERE Name BETWEEN 'a' and 'c'; -- a~b까지 출력함
-- ---------------------------- --
SELECT 1+2 IN (2,3,4);
SELECT 'Hello world' NOT IN ('hello wordl! My Name Is Jordan', 55); -- true
-- ---------------------------- --
SELECT * FROM country WHERE Name IN ('Canada', 'United States');
SELECT * FROM city WHERE Name IN ('kabul');
SELECT * FROM city WHERE Name IN ('tokyo', 'seoul', 'istanbul');
-- ---------------------------- --
# Wildcard: 모르는 글자를 어떻게 처리할지 정함
# LIKE '...%...' 0~N개 문자를 가진 패턴
# LIKE '..._...' _ 갯수만큼의 문자를 가진 패턴
SELECT 'HELLO WORLD OWO' LIKE '%OWO%',
'HELLO WORLD OWO' LIKE 'H%', -- FOUND H~ FROM <HELLO>
'HELLO WORLD OWO' LIKE '%O', -- FOUND ~O FROM <HELLO>
'HELLO WORLD OWO' LIKE '%WORLD%', -- FOUND ~WORLD~ FROM <HELLO WORLD OWO>
'HELLO WORLD OWO' LIKE '%D%', -- FOUND ~D~ FROM <WORLD>
'HELLO WORLD OWO' LIKE '%W%', -- FOUND ~W~ FROM <WORLD>
'HELLO WORLD OWO' LIKE '%OW%'; -- FOUND ~OW~ FROM <OWO>
##################################
SELECT 'HELLO WORLD OWO' LIKE '______W________',
'HELLO WORLD OWO' LIKE 'HE_____________',
'HELLO WORLD OWO' LIKE '________RLD____',
'HELLO WORLD OWO' LIKE '_______________',
'HELLO WORLD OWO' LIKE '_ELLO_____D____',
'HELLO WORLD OWO' LIKE 'H_____________O';
-- ---------------------------- --
SELECT *
FROM city
WHERE NAME LIKE '%tokyo%';
-- ---------------------------- --
/*
	ROUND()	반올림
	CEIL()	올림
	FLOOR()	내림
*/
SELECT ROUND(0.7758),
CEIL(1.33),
FLOOR(2.33);
-- country 테이블에서 대륙이 North America 인 나라의 기대수명을 반올림, 올림, 내림하시오.
SELECT NAME, Continent, ROUND(LifeExpectancy) FROM country WHERE Continent IN ('North America');
SELECT NAME, Continent, ROUND(LifeExpectancy) FROM country WHERE Continent IN ('Asia'); 
SELECT NAME, Continent, CEIL(LifeExpectancy) FROM country WHERE Continent IN ('Europe');
SELECT NAME, Continent, FLOOR(LifeExpectancy) FROM country WHERE NAME IN ('Japan');
-- ---------------------------- --
# ABS() 절대값 | ORDER BY ABS(VAR - VALUE) >> ~에 가장 가까운 값으로 정렬

# 각 나라의 GNP가 30만보다 얼마나 차이나는지를 계산 후 30만과 가장 가까운 나라부터 정렬
SELECT NAME, GNP 
FROM country 
WHERE ABS(GNP-300000)<50000
ORDER BY ABS(GNP-300000) ASC;
-- ---------------------------- --
# 기대 수명이 75 이상이면서 NULL 값이 아닌 값 중에 75에 가장 가까운 것부터 출력
SELECT NAME, LifeExpectancy 
From country 
WHERE LifeExpectancy IS NOT NULL && LifeExpectancy >= 75  
ORDER BY ABS(LifeExpectancy-75) ASC;
-- ---------------------------- --
# GNP와 30만과의 차이가 50000 미만인 걸 전부 찾아라
SELECT NAME, GNP 
FROM country
WHERE ABS(GNP-300000)<50000;
-- ---------------------------- --
SELECT NAME, GNP,
GREATEST(GNP, LifeExpectancy),
LEAST(GNP, LifeExpectancy)
FROM country;
-- ---------------------------- --
SELECT NAME, CountryCode,
MAX(Population) AS "MAX_Population",
MIN(Population) AS "MIN_Population",
SUM(Population) AS "SUM_Population",
AVG(Population) AS "AVG_Population",
COUNT(Population) AS "Population_COUNT" -- How many city names are there in data.
FROM city
GROUP BY NAME, CountryCode
ORDER BY MAX(Population) desc;
-- ---------------------------- --
SELECT
POW(5, 10) AS "A^B 1",
POWER(2,8) AS "A^B 2",
ROUND(SQRT(15), 2) AS "Square Root"; -- ROUND(VALUE), N) >> 소수점 몇자리까지 출력 (== TRUNCATE(SQRT(15), 2) )
-- ---------------------------- --
SELECT TRUNCATE(2458.157421581, 1) AS ".1",
TRUNCATE(2458.157421581, 2) AS ".01",
TRUNCATE(2458.157421581, 3) AS ".001",
TRUNCATE(2458.157421581, 4) AS ".0001",
TRUNCATE(2458.157421581, 0) AS "0",
TRUNCATE(2458.157421581, -1) AS "1",
TRUNCATE(2458.157421581, -2) AS "10",
TRUNCATE(2458.157421581, -3) AS "100",
2458.157421581 AS "Original value";
-- ---------------------------- --
SET @VAL := "hiiiiii, I'm Azu, your dearest friend.";
SELECT UCASE(@VAL),
UPPER(@VAL),
LCASE(@VAL),
LOWER(@VAL);
-- ---------------------------- --
SELECT
UCASE(NAME) AS "Uppercased",
LCASE(NAME) AS "Lowercased"
from country;
-- ---------------------------- --
SELECT UCASE("megalovania") AS "Now Playing";
-- ---------------------------- --
SET @VAL1:="hiiiiii,";
SET @VAL2:="I'm Azu,";
SET @VAL3:="your";
SET @VAL4:="dearest";
SET @VAL5:="friend.";
SET @BLANK:=" ";
SELECT 
CONCAT(@VAL1, @BLANK, @VAL2, @BLANK, @VAL3, @BLANK, @VAL4, @BLANK, @VAL5) AS "HELLO UwU";
SET @VAL1:="hiiiiii,";
SET @VAL2:="I'm Azu,";
SET @VAL3:="your";
SET @VAL4:="dearest";
SET @VAL5:="friend.";
SELECT 
CONCAT_WS(@VAL1, @VAL2, @VAL3, @VAL4, @VAL5) AS "HELLO UwU";















