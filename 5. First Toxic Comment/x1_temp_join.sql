SELECT
  A.first_toxic_comment,
  A.video_id,
  A.comment_date,
  B.video_timestamp AS video_posted,
FROM (
  SELECT
    video_id,
    comment_id AS first_toxic_comment,
    comment_date
  FROM (
    SELECT
      ROW_NUMBER() OVER(PARTITION BY video_id ORDER BY comment_date, comment_hour_of_the_day) Rn,
      comment_id,
      video_id,
      comment_date
    FROM
      `hatespeech-2019.HS_trolls_analysis.Final_with_Trolls`
    WHERE
      is_toxicity + is_severe_toxicity + is_obscene + is_threat + is_insult + is_identity_hate >=1)
  WHERE
    rn = 1) A
LEFT JOIN
  `hatespeech-2019.Final_Dataset.Channel_Videos_Comments_Victims_Merged` B
USING
  (video_id)
group by
A.video_id,
A.first_toxic_comment ,
A.comment_date,
video_posted;
