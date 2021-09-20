WITH
  hs_trolls AS (
  SELECT
    DISTINCT authorChannelId,
    author,
    COUNT(DISTINCT channel_id) OVER (PARTITION BY authorChannelId, author ) AS number_channels_trolled,
    COUNT(comment_id) OVER (PARTITION BY authorChannelId, author) AS total_number_toxic_comments
  FROM
  `hatespeech-2019.HS_trolls_analysis.Comments_above_new_thresholds`
  GROUP BY
    authorChannelId,
    author,
    channel_id,
    comment_id
  ORDER BY
    number_channels_trolled DESC,
    total_number_toxic_comments DESC,
    author ASC )
SELECT
  *
FROM
  hs_trolls
WHERE
  number_channels_trolled >1;
