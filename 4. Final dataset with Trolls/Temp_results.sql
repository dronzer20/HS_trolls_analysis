SELECT
  m.comment_id,
  m.authorChannelId AS author_channel_id,
  m.author AS author_name,
  t.victim_channels,
  t.total_toxic_comments_by_troll AS toxic_comments_by_author,
  m.video_id,
  m.channel_id,
  m.comment_date,
  CASE WHEN m.comment_hour_of_the_day IN (18, 19, 20, 21, 22, 23, 0, 1, 2, 3, 4, 5, 6) THEN 1
  ELSE 0 END AS is_comment_at_night,
  m.comment_hour_of_the_day,
  CASE WHEN (m.gender <> "m") THEN 1
  ELSE 0 END AS is_female_channel,
  CASE WHEN (m.race <> "white") THEN 1
  ELSE 0 END AS is_minority_race,
  t.is_toxicity,
  t.is_severe_toxicity,
  t.is_obscene,
  t.is_threat,
  t.is_insult,
  t.is_identity_hate,
  m.is_channel_teen,
  m.v_duration_min,
  m.view_count,
  m.like_count,
  m.dislike_count,
  m.text
FROM
  `hatespeech-2019.Final_Dataset.Channel_Videos_Comments_Victims_Merged` m
LEFT JOIN
  `hatespeech-2019.HS_trolls_analysis.Troll_comments` t
USING
  (comment_id)
GROUP BY
  author_channel_id,
  author_name,
  m.comment_id,
  victim_channels,
  toxic_comments_by_author,
  m.video_id,
  channel_id,
  m.comment_date,
  is_comment_at_night,
  m.comment_hour_of_the_day,
  is_female_channel,
  is_minority_race,
  is_toxicity,
  is_severe_toxicity,
  is_obscene,
  is_threat,
  is_insult,
  is_identity_hate,
  m.is_channel_teen,
  m.v_duration_min,
  m.view_count,
  m.like_count,
  m.dislike_count,
  m.text
ORDER BY
  m.comment_date ASC,
  m.comment_hour_of_the_day ASC;
