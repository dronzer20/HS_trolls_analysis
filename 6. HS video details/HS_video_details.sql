SELECT
  A.video_id,
  A.first_toxic_comment,
  A.comment_date,
  DATE(A.video_posted) AS video_posted_on,
  A.Days_before_toxic_comment AS Days_before_first_toxic_comment,
  DATE_DIFF(DATE(B.last_comment_date),DATE(A.comment_date),DAY) AS Days_after_first_toxic_comment,
  C.toxic,
  C.severely_toxic,
  C.obscene,
  C.threats,
  C.insults,
  C.identity_hate
FROM
  `hatespeech-2019.HS_trolls_analysis.x2_first_toxic_comment` A
LEFT JOIN
  `hatespeech-2019.HS_trolls_analysis.x3_last_comment_date` B
USING
  (video_id)
LEFT JOIN
  `hatespeech-2019.HS_trolls_analysis.x4_HS_count_for_videos` C
USING
  (video_id)
ORDER BY
  toxic DESC;
