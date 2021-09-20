WITH
  cte AS(
  SELECT
    *
  FROM
    `hatespeech-2019.Final_Dataset.Detoxify_Final`
  WHERE
    toxicity > 0.75
    OR severe_toxicity >0.05
    OR obscene > 0.65
    OR threat > 0.33
    OR insult > 0.25
    OR identity_hate > 0.2 )
SELECT
  *
FROM
  `hatespeech-2019.Final_Dataset.Channel_Videos_Comments_Victims_Merged` main
RIGHT JOIN
  cte threshold
USING
  (comment_id)
ORDER BY
  toxicity DESC;
