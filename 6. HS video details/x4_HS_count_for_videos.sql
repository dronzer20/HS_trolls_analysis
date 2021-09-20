SELECT
  DISTINCT video_id,
  SUM(is_toxicity) OVER (PARTITION BY video_id) toxic,
  SUM(is_severe_toxicity ) OVER (PARTITION BY video_id) severely_toxic,
  SUM(is_obscene ) OVER (PARTITION BY video_id) obscene,
  SUM(is_threat ) OVER (PARTITION BY video_id) threats,
  SUM(is_insult ) OVER (PARTITION BY video_id) insults,
  SUM(is_identity_hate ) OVER (PARTITION BY video_id) identity_hate
FROM
  `hatespeech-2019.HS_trolls_analysis.Final_with_Trolls`
WHERE
  video_id IN (
  SELECT
    video_id
  FROM
    `hatespeech-2019.HS_trolls_analysis.x2_first_toxic_comment`)
