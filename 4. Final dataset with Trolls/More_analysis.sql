SELECT
  ROUND(SUM(is_victim_a_girl)/(COUNT(DISTINCT comment_id))*100,2) AS Female_victims_percent,
  ROUND(SUM(is_channel_teen)/(COUNT(DISTINCT comment_id))*100,2) AS Teenage_victims_percent,
  ROUND(SUM(is_victim_from_minority_race)/(COUNT(DISTINCT comment_id))*100,2) AS Minority_race_victims_percent,
  ROUND(SUM(is_toxic_comment_at_night)/(COUNT(DISTINCT comment_id))*100,2) AS Toxicity_at_night_percent,
  COUNT(DISTINCT victim_channel_id) AS Total_victims,
  COUNT(DISTINCT troll_channel_id) AS Total_trolls
FROM
  `hatespeech-2019.HS_trolls_analysis.Troll_comments`
