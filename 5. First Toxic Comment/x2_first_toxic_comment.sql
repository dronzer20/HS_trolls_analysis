SELECT
  A.video_id,
  A.first_toxic_comment,
  A.comment_date,
  B.video_timestamp AS video_posted,
  DATE_DIFF(DATE(A.comment_date), DATE(B.video_timestamp), DAY) AS Days_before_toxic_comment
FROM
  `hatespeech-2019.HS_trolls_analysis.temp_join` A
LEFT JOIN
  `hatespeech-2019.Final_Dataset.Channel_Videos_Comments_Victims_Merged` B
USING
  (video_id)
GROUP BY
  A.video_id,
  A.first_toxic_comment,
  A.comment_date,
  video_posted;
