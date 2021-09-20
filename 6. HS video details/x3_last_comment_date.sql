SELECT
  video_id,
  comment_date AS last_comment_date
FROM (
  SELECT
    video_id,
    comment_date,
    ROW_NUMBER() OVER(PARTITION BY video_id ORDER BY comment_date DESC, comment_hour_of_the_day DESC) rn
  FROM
    `hatespeech-2019.HS_trolls_analysis.Final_with_Trolls`
  WHERE
    video_id IN (
    SELECT
      video_id
    FROM
      `hatespeech-2019.HS_trolls_analysis.x2_first_toxic_comment`))
WHERE
  rn=1;
