-- Databricks notebook source
-- MAGIC %python
-- MAGIC html = """<h1 style="color:Black; text-align: center; font-family:Ariel"> Report on Dominant Formula 1 Teams </h1>"""
-- MAGIC displayHTML(html)

-- COMMAND ----------

CREATE OR REPLACE TEMP VIEW v_dominant_team
AS
SELECT team_name, 
      COUNT(1) AS total_races,
      SUM(calculated_point) as total_points,
      AVG(calculated_point) as avg_points,
      rank()over(ORDER BY AVG(calculated_point) DESC) as team_rnk
FROM f1_presentation.calculated_race_results
GROUP BY team_name
HAVING count(1)>=100
ORDER BY avg_points DESC

-- COMMAND ----------

SELECT *
FROM v_dominant_team

-- COMMAND ----------

SELECT race_year, 
      team_name, 
      COUNT(1) AS total_races,
      SUM(calculated_point) as total_points,
      AVG(calculated_point) as avg_points
FROM f1_presentation.calculated_race_results
WHERE team_name IN (SELECT team_name FROM v_dominant_team WHERE team_rnk<=5)
GROUP BY race_year, team_name
ORDER BY race_year, avg_points DESC

-- COMMAND ----------

SELECT race_year, 
      team_name, 
      COUNT(1) AS total_races,
      SUM(calculated_point) as total_points,
      AVG(calculated_point) as avg_points
FROM f1_presentation.calculated_race_results
WHERE team_name IN (SELECT team_name FROM v_dominant_team WHERE team_rnk<=5)
GROUP BY race_year, team_name
ORDER BY race_year, avg_points DESC
