use world; /* use를 사용하면 schema가 진한글씨로 바뀐다 */
#####################################################
-- 1. 테이블의 모든 내용 보기
select * from city;
select * from country;
select * from countrylanguage;
/*
	여러줄 주석
	여러줄 주석
*/
#한 줄 주석
-- 한 줄 주석

-- 자기가 실행하고 싶은 코드 부분만 드래그 한 후 번개 아이콘을 클릭하면 해당하는 코드만 실행할 수 있다.

#####################################################
select name from city;

-- city 테이블에서 도시이름과 국가코드열만 조회하기
select name, countryCode
from city;

-- 테이블의 컬럼이 아닌 값도 선택할 수 있다
select population, 1, 'hello', null 
from city;
#city 테이블의 데이터를 불러오면서, 상수와 문자열, NULL도 함께 출력

#####################################################
# 3. 원하는 조건의 row(행)만 걸러서 보기
# where 구문 뒤에 조건을 붙여 원하는 데이터만 가져올 수 있습니다.
# 3-1 인구가 2,000,000 이상인 행의 모든 열을 가지고 오기
select *
from city
where population >= 2000000;


# GNP가 30만 이상인 국가는?

select name, population
from country where gnp >= 300000;

select name, population, GNP -- select name, 한 후 뒤에 탭 이름을 선택하면 해당하는 것의 값만 보여준다.
from country where gnp >= 300000;


# 4-1. 국가 이름을 알파벳 순으로 정렬
# city 테이블에서 도시명을 기준으로 내림차순 하시오
-- ORDERBY
select name, population
from country
order by name desc;

select name, population, continent
from country
order by name asc;


# country 테이블에서 Asia 대륙이고 인구가 5천만 이상인 국가와 인구, 기대수명을 조회하되 인구에 대하여 내림차순 정렬 하시오.alter
select name, population, lifeExpectancy
from country where population >= (10000*5000)
order by name desc;

# 위 조건에 오름차순 정렬, 기대수명이 70살 이상이라는 조건을 하나 더 추가해보자
select name, population, lifeExpectancy
from country where population >= (10000*5000) && lifeExpectancy >= 70
order by name asc;

# 아시아 대륙에서 인구와 대륙을 오름차순으로 정렬해서 불러오자
select name, continent, population
from country where continent = 'Asia' -- 문자열인 값을 불러올 때는 따옴표로 감싸야한다. == 등호는 SQL에서는 =로 표기한다.
order by name asc;

# country 테이블에서 대륙은 Asia인 국가, 대륙, 인구를 조회하되, 인구가 많은 순으로 정렬하시오
select name Continent, population
from country where Continent = 'Asia'
order by Population desc;


# 4-3. city 테이블에서 도시이름, 국가코드, 인구를 조회하되, 국가 코드별 오름차순, 인구별 내림차순으로 정렬하시오
select name CountryCode, Population
from city 
order by CountryCode asc, Population desc;


# 면적이 넓은 상위 5개 나라 
select name, surfaceArea
from country
order by surfaceArea desc
limit 5;

 select name, LifeExpectancy
 from country
 order by LifeExpectancy desc
 limit 1, 5;















