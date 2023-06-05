Select *
From games
ORDER BY 1

--------------------------------------------------------------------------------------------------

-- The Wii's best selling genre globaly
Select Genre, Sum(Global_Sales) as Total_Sales
From games
Where Platform IN ('Wii', 'WiiU')
group by Genre
order by 2 desc


-- The 3DS & DS's best selling genre globaly
Select Genre, Sum(Global_Sales) as Total_Sales
From games
Where Platform IN ('3DS', 'DS')
group by Genre
order by 2 desc

-- The PC's best selling genre globaly
Select Genre, Sum(Global_Sales) as Total_Sales
From games
Where Platform = 'PC'
group by Genre
order by 2 desc

-- The Playstations best selling genre globaly
Select Genre, Sum(Global_Sales) as Total_Sales
From games
Where Platform IN ('PS', 'PS2', 'PS3', 'PS4')
group by Genre
order by 2 desc

-- The XBOX best selling genre globaly
Select Genre, Sum(Global_Sales) as Total_Sales
From games
Where Platform IN ('X360', 'XB', 'XOne')
group by Genre
order by 2 desc


--------------------------------------------------------------------------------------------------------
Select Name, Year, Genre, JP_Sales
From games
ORDER BY 1

-- Japan's top selling genre over the years
Select Genre, Year, MAX(JP_Sales) as top_sales
From games
Where Year is not NULL and JP_Sales != 0
GROUP BY Genre, Year
Order by 2,1


-- Top 10 games sold in Japan
Select TOP 10 Name, Platform, Year, Genre, JP_Sales
From games
Where Year is not NULL and JP_Sales != 0
Order By 5 desc


-- Top 10 platform games sold in Japan
Select TOP 10 Name, Platform, Year, Genre, JP_Sales
From games
Where Genre = 'Platform' And Year is not NULL and JP_Sales != 0
Order By 5 desc


-- Top 10 RP games sold in Japan
Select TOP 10 Name, Platform, Year, Genre, JP_Sales
From games
Where Genre = 'Role-Playing' AND Year is not NULL and JP_Sales != 0
Order By 5 desc



-- Top 10 Shooter games sold in Japan
Select TOP 10 Name, Platform, Year, Genre, JP_Sales
From games
Where Genre = 'Shooter' AND Year is not NULL and JP_Sales != 0
Order By 5 desc


--------------------------------------------------------------------------------------------------------
Select Name, Year, Genre, NA_Sales
From games
ORDER BY 1

-- North America top selling genre over the years
Select Genre, Year, MAX(NA_Sales) as top_sales
From games
Where Year is not NULL and NA_Sales != 0
GROUP BY Genre, Year
Order by 2,1


-- Top 10 Platform games sold in North America
Select TOP 10 Name, Platform, Year, Genre, NA_Sales
From games
Where Genre = 'Platform' AND Year is not NULL and NA_Sales != 0
Order By 5 desc



-- Top 10 Strategy games sold in North America
Select TOP 10 Name, Platform, Year, Genre, NA_Sales
From games
Where Genre = 'Strategy' AND Year is not NULL and NA_Sales != 0
Order By 5 desc


--------------------------------------------------------------------------------------------------------
-- Top 10 publishers
Select TOP 10 Publisher, SUM(Global_Sales) as Publisher_Total_Sales
From games
group by Publisher
order by 2 desc


-- NA Top 10 Publishers
Select TOP 10 Publisher, SUM(NA_Sales) as NA_Publisher_Total_Sales
From games
group by Publisher
order by 2 desc


-- EU Top 10 Publishers
Select TOP 10 Publisher, SUM(EU_Sales) as EU_Publisher_Total_Sales
From games
group by Publisher
order by 2 desc


-- JP Top 10 Publishers
Select TOP 10 Publisher, SUM(JP_Sales) as JP_Publisher_Total_Sales
From games
group by Publisher
order by 2 desc