SELECT *
FROM PorfolioProject..CovidDeaths
WHERE continent is not null
ORDER BY 3,4


-- Select Data that we are going to be starting with
SELECT location, date, total_cases, new_cases, total_deaths, population
FROM PorfolioProject..CovidDeaths
WHERE continent is not null
ORDER BY 1,2


-- total cases vs total deaths
-- Shows likelihood of dying if you contracted covid
SELECT location, date, total_cases, total_deaths, (total_deaths/total_cases)*100 as death_percentage
FROM PorfolioProject..CovidDeaths
WHERE continent is not null
ORDER BY 1,2


-- total cases vs population
-- Shows what percentage of popultion got covid
SELECT location, date, population, total_cases, (total_cases/population)*100 as percent_population_infected
FROM PorfolioProject..CovidDeaths
WHERE continent is not null
ORDER BY 1,2


-- contries with highest infection rate compared to population
SELECT location, population, MAX(total_cases) as highest_infection_count, MAX((total_cases/population))*100 as percent_population_infected
FROM PorfolioProject..CovidDeaths
WHERE continent is not null
GROUP BY location, population
ORDER BY percent_population_infected desc


-- Countries with highest death count per population
SELECT location, MAX(cast(total_deaths as int)) as total_death_counts
FROM PorfolioProject..CovidDeaths
WHERE continent is not null
GROUP BY location
ORDER BY total_death_counts desc


-- LET'S BREAK THINGS DOWN BY CONTINENT


-- Showing contintents with the highest death count per population
SELECT continent, MAX(cast(total_deaths as int)) as total_death_counts
FROM PorfolioProject..CovidDeaths
WHERE continent is not null
GROUP BY continent
ORDER BY total_death_counts desc



-- GLOBAL NUMBERS
Select SUM(new_cases) as total_cases, SUM(cast(new_deaths as int)) as total_deaths, SUM(cast(new_deaths as int))/SUM(New_Cases)*100 as death_percentage
From PorfolioProject..CovidDeaths
where continent is not null 
--Group By date
order by 1,2


-- Total population vs vaccinations
SELECT dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
, SUM(CAST(vac.new_vaccinations as int)) OVER (Partition by dea.location Order by dea.location,dea.date) as rolling_people_vaccinated
, 
FROM PorfolioProject..CovidDeaths dea
JOIN PorfolioProject..CovidVaccinations vac
	ON dea.location = vac.location 
	and dea.date = vac.date
where dea.continent is not null 
order by 2,3


-- Use CTE
With PopvsVac (continent, location, date, population, new_vaccinations, rolling_people_vaccinated)
as
(
SELECT dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
, SUM(CAST(vac.new_vaccinations as int)) OVER (Partition by dea.location Order by dea.location,dea.date) as rolling_people_vaccinated
FROM PorfolioProject..CovidDeaths dea
JOIN PorfolioProject..CovidVaccinations vac
	ON dea.location = vac.location 
	and dea.date = vac.date
where dea.continent is not null 
)
SELECT *, (rolling_people_vaccinated/population)*100 as vaccinated_percentage
FROM PopvsVac



-- Temp Table
DROP TABLE if exists #PerecentPopulationVaccinated
Create Table #PerecentPopulationVaccinated
(
continent nvarchar(255),
location nvarchar(255),
date datetime,
population numeric,
new_vaccinations numeric,
rolling_people_vaccinated numeric
)

Insert into #PerecentPopulationVaccinated
SELECT dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
, SUM(CAST(vac.new_vaccinations as int)) OVER (Partition by dea.location Order by dea.location,dea.date) as rolling_people_vaccinated
FROM PorfolioProject..CovidDeaths dea
JOIN PorfolioProject..CovidVaccinations vac
	ON dea.location = vac.location 
	and dea.date = vac.date
where dea.continent is not null 

SELECT *, (rolling_people_vaccinated/population)*100 as vaccinated_percentage
FROM #PerecentPopulationVaccinated



-- Creating View to store data for later vizualisations
CREATE VIEW PercentPopulationVaccinated AS
SELECT dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
, SUM(CAST(vac.new_vaccinations as int)) OVER (Partition by dea.location Order by dea.location,dea.date) as rolling_people_vaccinated
FROM PorfolioProject..CovidDeaths dea
JOIN PorfolioProject..CovidVaccinations vac
	ON dea.location = vac.location 
	and dea.date = vac.date
where dea.continent is not null  


-- Continents
SELECT location, SUM(cast(new_deaths as int)) as total_death_count
FROM PorfolioProject..CovidDeaths
WHERE continent is null
and location not in ('World', 'European Union', 'International')
Group by location
Order by total_death_count desc


--_ Percentage of population infected
SELECT location, population, MAX(total_cases) as highest_infection_count, MAX((total_cases/population))*100 as percent_population_infected
FROM PorfolioProject..CovidDeaths
Group by location, population
Order by percent_population_infected desc


SELECT location, population, date, MAX(total_cases) as highest_infection_count, MAX((total_cases/population))*100 as percent_population_infected
FROM PorfolioProject..CovidDeaths
Group by location, population, date
Order by percent_population_infected desc
