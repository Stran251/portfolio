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
