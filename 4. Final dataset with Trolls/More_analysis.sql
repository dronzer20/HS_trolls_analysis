select
round(sum(is_victim_a_girl)/(count(distinct comment_id))*100,2) as Female_victims_percent,
round(sum(is_channel_teen)/(count(distinct comment_id))*100,2) as Teenage_victims_percent,
round(sum(is_victim_from_minority_race)/(count(distinct comment_id))*100,2) as Minority_race_victims_percent,
round(sum(is_toxic_comment_at_night)/(count(distinct comment_id))*100,2) as Toxicity_at_night_percent,
count(distinct victim_channel_id) as Total_victims,
count(distinct troll_channel_id) as Total_trolls
from
`hatespeech-2019.HS_trolls_analysis.Troll_comments`
