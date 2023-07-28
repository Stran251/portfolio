Select *
From games
ORDER BY 1

--------------------------------------------------------------------------------------------------------
-- Top 10 Selling Games
SELECT TOP 10 name, Global_Sales
FROM games
ORDER BY 2 desc;

--------------------------------------------------------------------------------------------------------
-- Top Selling Genres Globaly
Select Genre, ROUND(SUM(Global_Sales), 2) AS Total_Global_Sales
From games
GROUP BY Genre
ORDER BY 2 desc;


-- Top Selling Genres NA
Select Genre, ROUND(SUM(NA_Sales), 2) Total_NA_Sales
From games
GROUP BY Genre
ORDER BY 2 desc;


-- Top Selling Genres EU
Select Genre, ROUND(SUM(EU_Sales), 2) Total_EU_Sales
From games
GROUP BY Genre
ORDER BY 2 desc;


-- Top Selling Genres JP
Select Genre, ROUND(SUM(JP_Sales), 2) Total_JP_Sales
From games
GROUP BY Genre
ORDER BY 2 desc;


-- Top Selling Genres Other
Select Genre, ROUND(SUM(Other_Sales), 2) Total_Other_Sales
From games
GROUP BY Genre
ORDER BY 2 desc;


--------------------------------------------------------------------------------------------------------
-- Top Selling Platforms Globaly
Select Top 10 Publisher, ROUND(SUM(Global_Sales), 2) Top_Publishers
From games
GROUP BY Publisher
ORDER BY 2 desc;


-- Top Selling Platforms NA
Select Top 10 Publisher, ROUND(SUM(NA_Sales), 2) Top_NA_Publishers
From games
GROUP BY Publisher
ORDER BY 2 desc;


-- Top Selling Platforms EU
Select Top 10 Publisher, ROUND(SUM(EU_Sales), 2) Top_EU_Publishers
From games
GROUP BY Publisher
ORDER BY 2 desc;


-- Top Selling Platforms JP
Select Top 10 Publisher, ROUND(SUM(JP_Sales), 2) Top_JP_Publishers
From games
GROUP BY Publisher
ORDER BY 2 desc;


-- Top Selling Platforms Other
Select Top 10 Publisher, ROUND(SUM(Other_Sales), 2) Top_Other_Publishers
From games
GROUP BY Publisher
ORDER BY 2 desc;


--------------------------------------------------------------------------------------------------------
-- Games in Dataset
Select COUNT(distinct(Name))
From games


-- Publishers in Dataset
Select COUNT(distinct(Publisher))
From games


-- Platforms in Dataset
Select COUNT(distinct(Platform))
From games
