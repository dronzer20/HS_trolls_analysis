WITH cte AS(
SELECT comment_id, toxicity, insult,text
FROM `hatespeech-2019.Final_Dataset.Channel_Videos_Comments_Victims_Merged` main
LEFT JOIN `hatespeech-2019.Final_Dataset.Detoxify_Final`
USING (comment_id))

(SELECT * from cte WHERE insult < 0.1 limit 15)
UNION ALL
(SELECT * from cte WHERE insult > 0.1 AND insult < 0.2 limit 15)
UNION ALL
(SELECT * from cte WHERE insult > 0.2 AND insult < 0.3 limit 15)
UNION ALL
(SELECT * from cte WHERE insult > 0.3 AND insult < 0.4 limit 15)
UNION ALL
(SELECT * from cte WHERE insult > 0.4 AND insult < 0.5 limit 15)
UNION ALL
(SELECT * from cte WHERE insult > 0.5 limit 15)
order by insult asc;
