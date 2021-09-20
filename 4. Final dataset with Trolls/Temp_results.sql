SELECT
  m.comment_id,
  m.authorChannelId as author_channel_id,
  m.author as author_name,
  t.victim_channels,
  t.total_toxic_comments_by_troll as toxic_comments_by_author,
  m.video_id,
  m.channel_id,
  m.comment_date,
  case when m.comment_hour_of_the_day in (18,19,20,21,22,23,0,1,2,3,4,5,6)
  then 1 else 0 end as is_comment_at_night,
  m.comment_hour_of_the_day,
  case when (m.gender <> "m") then 1 else 0 end as is_female_channel,
  case when (m.race <> "white") then 1 else 0 end as is_minority_race,
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
group by
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
order by
m.comment_date asc,
m.comment_hour_of_the_day asc;
