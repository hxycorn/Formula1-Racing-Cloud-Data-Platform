-- Databricks notebook source
CREATE OR REPLACE TEMP VIEW v_dominant_drivers
AS
SELECT driver_name, 
      COUNT(1) AS total_races,
      SUM(calculated_point) as total_points,
      AVG(calculated_point) as avg_points,
      rank()over(ORDER BY AVG(calculated_point) DESC) as driver_rnk
FROM f1_presentation.calculated_race_results
GROUP BY driver_name
HAVING count(1)>=50
ORDER BY avg_points DESC

-- COMMAND ----------

SELECT race_year, 
      driver_name, 
      COUNT(1) AS total_races,
      SUM(calculated_point) as total_points,
      AVG(calculated_point) as avg_points
FROM f1_presentation.calculated_race_results
WHERE driver_name IN (SELECT driver_name FROM v_dominant_drivers WHERE driver_rnk<=10)
GROUP BY race_year, driver_name
ORDER BY race_year, avg_points DESC

-- COMMAND ----------

SELECT race_year, 
      driver_name, 
      COUNT(1) AS total_races,
      SUM(calculated_point) as total_points,
      AVG(calculated_point) as avg_points
FROM f1_presentation.calculated_race_results
WHERE driver_name IN (SELECT driver_name FROM v_dominant_drivers WHERE driver_rnk<=10)
GROUP BY race_year, driver_name
ORDER BY race_year, avg_points DESC

-- COMMAND ----------

SELECT race_year, 
      driver_name, 
      COUNT(1) AS total_races,
      SUM(calculated_point) as total_points,
      AVG(calculated_point) as avg_points
FROM f1_presentation.calculated_race_results
WHERE driver_name IN (SELECT driver_name FROM v_dominant_drivers WHERE driver_rnk<=10)
GROUP BY race_year, driver_name
ORDER BY race_year, avg_points DESC
