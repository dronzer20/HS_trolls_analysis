WITH
  cte AS(
  SELECT
    *
  FROM
    `hatespeech-2019.HS_trolls_analysis.Comments_above_detoxify_threshold` main
  RIGHT JOIN
    `hatespeech-2019.HS_trolls_analysis.detoxify_trolls` trolls
  USING
    (authorChannelId) )
SELECT
  DISTINCT channel_id AS victim_channel_id,
  COUNT(comment_id) OVER (PARTITION BY channel_id) AS number_comments_from_multi_channel_troll,
  COUNT(DISTINCT video_id) OVER (PARTITION BY channel_id) AS number_videos_on_channel_trolled
FROM
  cte
ORDER BY
  number_comments_from_multi_channel_troll DESC,
  number_videos_on_channel_trolled DESC;
