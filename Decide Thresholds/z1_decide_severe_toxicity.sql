WITH cte AS(
SELECT comment_id,severe_toxicity st, text
FROM `hatespeech-2019.Final_Dataset.Channel_Videos_Comments_Victims_Merged` main
LEFT JOIN `hatespeech-2019.Final_Dataset.Detoxify_Final`
USING (comment_id))

(SELECT * from cte WHERE st > 0 AND st < 0.05 limit 10)
UNION ALL
(SELECT * from cte WHERE st > 0.05 AND st < 0.1 limit 10)
UNION ALL
(SELECT * from cte WHERE st > 0.1 AND st < 0.15 limit 10)
UNION ALL
(SELECT * from cte WHERE st > 0.15 AND st < 0.2 limit 10)
UNION ALL
(SELECT * from cte WHERE st > 0.25 limit 10)
order by st asc;
