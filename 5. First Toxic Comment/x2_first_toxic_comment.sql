select
A.video_id,
A.first_toxic_comment,
A.comment_date,
B.video_timestamp as video_posted,
date_diff(date(A.comment_date), date(B.video_timestamp), DAY) as Days_before_toxic_comment
from
`hatespeech-2019.HS_trolls_analysis.temp_join` A
left join
`hatespeech-2019.Final_Dataset.Channel_Videos_Comments_Victims_Merged` B
using(video_id)
group by
A.video_id,
A.first_toxic_comment,
A.comment_date,
video_posted;
