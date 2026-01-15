use world;
SELECT CURDATE(), CURTIME(), NOW();
-- --------------------------------------------------------- --
SELECT YEAR("2025-10-15 14:35:50") AS "YEAR",
MONTH("2025-10-15 14:35:50") AS "MONTH (NUM)",
MONTHNAME("2025-10-15 14:35:50") AS "MONTH (ENG)",
DAY("2025-10-15 14:35:50") AS "DAY (NUM)",
DAYOFMONTH("2025-10-15 14:35:50") AS "DAY",
WEEKDAY("2025-10-15 14:35:50") AS "DAY OF WEEK VALUE",
DAYNAME("2025-10-15 14:35:50") AS "NAME OF DAY OF WEEK";
-- --------------------------------------------------------- --
#IF문 
#IF문 내부에 TRUE/FALSE; IF/ELSE 가 전부 포함이 된다.
# 인구 수 인구 상태를 조회, 인구가 1억명 이상이면 인구많음, 아니면 인구적음으로 표시 및 인구를 기준으로 내림차 정렬
SELECT NAME, Population,
IF(Population>=(10000*10000), "인구많음", "인구적음") AS "인구상태"
FROM country
ORDER BY Population DESC;
-- --------------------------------------------------------- --
#날짜 비교
SELECT 
IF(CURDATE()>'2026-08-15','생일이후','생일이전') AS 판단기준;

#앞의 IF문 예제를 CASE문으로 수정

# CASE WHEN (조건) THEN "거짓" ELSE "참" END;
SELECT
	CASE WHEN 1=1 THEN "참" ELSE "거짓" END;
SELECT 
	CASE WHEN CURDATE()<'2026-08-15' THEN "생일이전" ELSE "생일이후" END AS "판단기준";
-- --------------------------------------------------------- --
# IFNULL(검사할 값, '대신 반환할 값');
SELECT IFNULL(NULL, '값 없음') AS 결과;
SELECT IFNULL('안뇽 OwO', '값 없음') AS 결과;

SELECT 
NAME AS 국가명,
IFNULL(GNPOLD, 0) AS 국민총생산
FROM country
ORDER BY GNP DESC;	
-- --------------------------------------------------------- --
# CONCAT(): 문자열 결합 (컬럼과 문자를 결합 가능) 

SELECT
CONCAT(NAME, '(', IFNULL(IndepYear, '정보없음'), ')') AS 국가정보
FROM country
LIMIT 5;
-- --------------------------------------------------------- --





















































