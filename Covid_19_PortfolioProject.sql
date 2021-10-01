
--- SHOW ALL FROM PortfolioProject 
SELECT location, date, population, total_vaccinations, people_fully_vaccinated, total_vaccinations_per_hundred
FROM PortfolioProject.dbo.Sheet1$
WHERE date = '2021-08-31'

--- CHANGE DATE COLUMN DATATYPE
ALTER TABLE PortfolioProject.dbo.Sheet1$
ALTER COLUMN date date 

ALTER TABLE PortfolioProject.dbo.Sheet1$
ALTER COLUMN people_vaccinated float 


-------------------------AND, NOT IN CLAUSE------------------------------------

--- SHOW SPECIFIC COLUMNS FOR ALL COUNTRIES EXCLUDING TOTAL FIGURES FROM CONTINENT WITH HIGH NUMBER ON 31-08-2021 

SELECT  location, date, total_cases, total_deaths, total_cases_per_million 
FROM 
PortfolioProject.dbo.Deaths
WHERE date = '2021-08-31'
AND 
location NOT IN ('world', 'Asia', 'Europe' , 'North America' , 'South America','Africa','Oceania','European Union')
ORDER BY total_cases DESC

--- SHOW TOP 20 ORDER  COUNTRIES ORDERED BY TOTAL CASES ON 31-08-2021 


SELECT  TOP 20 location, date, total_cases, total_deaths, total_cases_per_million
FROM 
PortfolioProject.dbo.Deaths
WHERE date = '2021-08-31'
AND 
location NOT IN ('world', 'Asia', 'Europe' , 'North America' , 'South America','Africa','Oceania','European Union')
ORDER BY total_cases DESC


--- SHOW TOP 20 ORDER  COUNTRIES ORDERED BY TOTAL CASES PER MILLION ON 31-08-2021 


SELECT  TOP 20 location, date, total_cases, total_deaths, total_cases_per_million
FROM 
PortfolioProject.dbo.Deaths
WHERE date = '2021-08-31'
AND 
location NOT IN ('world', 'Asia', 'Europe' , 'North America' , 'South America','Africa','Oceania','European Union')
ORDER BY total_cases_per_million DESC

--- SHOW TOP 20 ORDER  COUNTRIES ORDERED BY TOTAL DEATHS ON 31-08-2021 


SELECT  TOP 20 location, date, total_cases, total_deaths, total_cases_per_million
FROM 
PortfolioProject.dbo.Deaths
WHERE date = '2021-08-31'
AND 
location NOT IN ('world', 'Asia', 'Europe' , 'North America' , 'South America','Africa','Oceania','European Union')
ORDER BY total_deaths DESC


--- SHOW ALL FROM PortfolioProject database schema table Shee1$
SELECT location, date, population, total_vaccinations, people_fully_vaccinated, total_vaccinations_per_hundred
FROM PortfolioProject.dbo.Sheet1$
WHERE date = '2021-08-31'
AND 
location NOT IN ('world', 'Asia', 'Europe' , 'North America' , 'South America','Africa','Oceania','European Union')
ORDER BY people_fully_vaccinated DESC

---- SHOW COUNTRIES AND PERCENTAGE VACCINATED  AS AT 2021-08-31
SELECT location, date, population, total_vaccinations, people_fully_vaccinated, (people_fully_vaccinated/population) *100 as Percentage_Vaccinated 
FROM PortfolioProject.dbo.Sheet1$
WHERE date = '2021-08-31' 
AND people_fully_vaccinated > 0
AND
location NOT IN ('world', 'Asia', 'Europe' , 'North America' , 'South America','Africa','Oceania','European Union')
ORDER BY Percentage_Vaccinated DESC

---- SHOW COUNTRIES PERFORMANCE ON VACCINATION  AS AT 2021-08-31
SELECT location, date, population, total_vaccinations, people_fully_vaccinated, (people_fully_vaccinated/population) *100 as Percentage_Vaccinated,
CASE 
WHEN (people_fully_vaccinated/population) *100 BETWEEN 0 AND 33 THEN 'POOR'
WHEN (people_fully_vaccinated/population) *100 BETWEEN 33 AND 66 THEN 'AVERAGE'
WHEN (people_fully_vaccinated/population) *100 >= 66 THEN 'GOOD'
END AS Perfomance
FROM PortfolioProject.dbo.Sheet1$
WHERE date = '2021-08-31' 
AND people_fully_vaccinated > 0
AND
location NOT IN ('world', 'Asia', 'Europe' , 'North America' , 'South America','Africa','Oceania','European Union')
ORDER BY Percentage_Vaccinated DESC
