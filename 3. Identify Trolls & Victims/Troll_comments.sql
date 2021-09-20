SELECT
  m.authorChannelId as troll_channel_id,
  m.author as troll_name,
  m.comment_id,
  t.number_channels_trolled as victim_channels,
  t.total_number_toxic_comments as total_toxic_comments_by_troll,
  m.video_id,
  m.channel_id as victim_channel_id,
  m.comment_date,
  case when m.comment_hour_of_the_day in (18,19,20,21,22,23,0,1,2,3,4,5,6)
  then 1 else 0 end as is_toxic_comment_at_night,
  m.comment_hour_of_the_day,
  case when (m.gender <> "m") then 1 else 0 end as is_victim_a_girl,
  case when (m.race <> "white") then 1 else 0 end as is_victim_from_minority_race,
  case when (m.toxicity >0.75) then 1 else 0 end as is_toxicity,
  case when (m.severe_toxicity >0.05) then 1 else 0 end as is_severe_toxicity,
  case when (m.obscene >0.65) then 1 else 0 end as is_obscene,
  case when (m.threat >0.33) then 1 else 0 end as is_threat,
  case when (m.insult >0.25) then 1 else 0 end as is_insult,
  case when (m.identity_hate >0.2) then 1 else 0 end as is_identity_hate,
  m.is_channel_teen,
  m.v_duration_min,
  m.view_count,
  m.like_count,
  m.dislike_count,
  m.text
FROM
  `hatespeech-2019.HS_trolls_analysis.Comments_above_new_thresholds` m
RIGHT JOIN
  `hatespeech-2019.HS_trolls_analysis.Detoxify_trolls` t
USING
  (authorChannelId)
group by
troll_channel_id,
troll_name,
m.comment_id,
victim_channels,
total_toxic_comments_by_troll,
m.video_id,
victim_channel_id,
m.comment_date,
m.comment_hour_of_the_day,
is_victim_a_girl,
is_victim_from_minority_race,
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
comment_date desc,
comment_hour_of_the_day desc;
