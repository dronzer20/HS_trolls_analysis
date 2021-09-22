# Hate Speech Virality Analysis



### 1. Initial troll analysis
Analyse toxic comments by using a rough threshold of 0.9 for each category of hate speech- toxic, severely toxic, obscene, threat, insult, identity_hate
#

### 2. Decide thresholds
Manually review toxic comments and decide threshold for each category. Upon inspection, the thresholds dedcided are:
toxicity - 0.75, severe_toxicity- 0.05, obscene- 0.65, threat- 0.33, insult- 0.25, identity_hate- 0.20
#

### 3. Identify Trolls & Victims
Identify the trolls and the victims by analysing the comments that exceed the decided thresholds. Also create a database of all troll comments. A troll exceeds  the threshold in at least one of the HS category and does it on atleast 2 channels. 
#

### 4. Final Dataset with Trolls
Create the final dataset of all comments (110M) which identifies the hate speech information through binary encoding. It also includes information about the troll for each comment. Some key figures like toxicity at night, victims by gender and race etc. are analyzed in a separate table.
#

### 5. First Toxic Comment
For each video affected by toxic comments, find the first toxic comment made and the timeline involved. This is done to later on analyze how that first toxic comment possibly affected other toxic comments made on the video. 
#

### 6. HS video details
Create a table for affected videos which contains information about when the first toxic comment was made and the total hate comments made on the video after that. It contains this information across different categories of hate speech and the days passed. 
#

### 7. Prepare visualization
Plot the virality of hate speech. Here we will see how the first hate comment leads to more hate comments across the different categories of toxicity, severe toxicity, obscene, threat, insult and identity hate.

![toxic](https://user-images.githubusercontent.com/66757308/134305284-ec9fb162-728f-4d83-b551-859a6a0d1675.jpg)

![sev_tox](https://user-images.githubusercontent.com/66757308/134305326-bcd19355-c600-419f-afa8-e8045364bdc1.jpg)

![obscene](https://user-images.githubusercontent.com/66757308/134305364-3e3ec35f-8f3c-4d3a-b456-73ddb7e64590.jpg)

![threat](https://user-images.githubusercontent.com/66757308/134305393-907b5f53-e1ca-42a1-a98f-3b280c1ec998.jpg)

![insult](https://user-images.githubusercontent.com/66757308/134305440-e9a01a74-fc21-4015-b67d-ceb0a2ab9e6c.jpg)

![IH](https://user-images.githubusercontent.com/66757308/134305481-45c6f4ca-cd5c-47c3-9efb-32559a0eb572.jpg)

