-- Databricks notebook source
SELECT team_name, 
      COUNT(1) AS total_races,
      SUM(calculated_point) as total_points,
      AVG(calculated_point) as avg_points
FROM f1_presentation.calculated_race_results
GROUP BY team_name
HAVING count(1)>=100
ORDER BY avg_points DESC

-- COMMAND ----------

SELECT team_name, 
      COUNT(1) AS total_races,
      SUM(calculated_point) as total_points,
      AVG(calculated_point) as avg_points
FROM f1_presentation.calculated_race_results
WHERE race_year BETWEEN 2011 AND 2020
GROUP BY team_name
HAVING count(1)>=100
ORDER BY avg_points DESC

-- COMMAND ----------

SELECT team_name, 
      COUNT(1) AS total_races,
      SUM(calculated_point) as total_points,
      AVG(calculated_point) as avg_points
FROM f1_presentation.calculated_race_results
WHERE race_year BETWEEN 2001 AND 2010
GROUP BY team_name
HAVING count(1)>=100
ORDER BY avg_points DESC
