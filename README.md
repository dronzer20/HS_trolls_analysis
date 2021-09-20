# Hate Speech Virality Analysis

##1. Initial troll analysis

   Analyse toxic comments by using a rough threshold of 0.9 for each category of hate speech- toxic, severely toxic, obscene, threat, insult, identity_hate

##2. Decide thresholds

   Manually review toxic comments and decide threshold for each category.
   Upon inspection, the thresholds dedcided are:
   toxicity - 0.75, severe_toxicity- 0.05, obscene- 0.65, threat- 0.33, insult- 0.25, identity_hate- 0.20
   
##3. Identify Trolls & Victims

   Identify the trolls and the victims by analysing the comments that exceed the decided thresholds. Also create a database of all troll comments. 
   A troll exceeds  the threshold in at least one of the HS category and does it on atleast 2 channels. 
   
##4. Final Dataset with Trolls

   Create the final dataset of all comments (110M) which identifies the hate speech information through binary encoding. It also includes information about the troll for each comment. 
