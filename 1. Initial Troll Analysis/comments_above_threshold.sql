--Comments above detoxify threshold
WITH
  cte AS(
  SELECT
    *
  FROM
    `hatespeech-2019.Final_Dataset.Detoxify_Final`
  WHERE
    toxicity > 0.9
    OR severe_toxicity >0.9
    OR obscene > 0.9
    OR threat > 0.9
    OR insult > 0.9
    OR identity_hate > 0.9 )
SELECT
  *
FROM
  `hatespeech-2019.Final_Dataset.Channel_Videos_Comments_Victims_Merged` main
RIGHT JOIN
  cte threshold
USING
  (comment_id)
WHERE
  main.is_channel_teen = 1;
