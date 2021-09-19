WITH cte AS(
SELECT comment_id,toxicity, text
FROM `hatespeech-2019.Final_Dataset.Channel_Videos_Comments_Victims_Merged` main
LEFT JOIN `hatespeech-2019.Final_Dataset.Detoxify_Final`
USING (comment_id))

(SELECT * from cte WHERE toxicity > 0.5 AND toxicity < 0.6 limit 20)
UNION ALL
(SELECT * from cte WHERE toxicity > 0.6 AND toxicity < 0.7 limit 20)
UNION ALL
(SELECT * from cte WHERE toxicity > 0.7 AND toxicity < 0.8 limit 20)
UNION ALL
(SELECT * from cte WHERE toxicity > 0.8 AND toxicity < 0.9 limit 20)
UNION ALL
(SELECT * from cte WHERE toxicity > 0.9 limit 20)
order by toxicity asc;
