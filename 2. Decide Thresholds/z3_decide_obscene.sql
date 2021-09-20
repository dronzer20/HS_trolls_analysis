WITH cte AS(
SELECT comment_id,obscene, text
FROM `hatespeech-2019.Final_Dataset.Channel_Videos_Comments_Victims_Merged` main
LEFT JOIN `hatespeech-2019.Final_Dataset.Detoxify_Final`
USING (comment_id))

(SELECT * from cte WHERE obscene > 0.5 AND obscene < 0.6 limit 20)
UNION ALL
(SELECT * from cte WHERE obscene > 0.6 AND obscene < 0.7 limit 20)
UNION ALL
(SELECT * from cte WHERE obscene > 0.7 AND obscene < 0.8 limit 20)
UNION ALL
(SELECT * from cte WHERE obscene > 0.8 AND obscene < 0.9 limit 20)
UNION ALL
(SELECT * from cte WHERE obscene > 0.9 limit 20)
order by obscene asc;
