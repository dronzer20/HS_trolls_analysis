SELECT
  A.*,
  B.first_toxic_comment,
  B.comment_date AS first_toxic_com_on,
  B.video_posted,
  B.Days_before_toxic_comment as days_before_first_toxic,
  date_diff(date(A.comment_date),date(B.comment_date), day) as days_since_first_toxic
FROM
  `hatespeech-2019.HS_trolls_analysis.Final_with_Trolls` AS A
LEFT JOIN
  `hatespeech-2019.HS_trolls_analysis.x2_first_toxic_comment` AS B
USING
  (video_id)
