select * from
`hatespeech-2019.HS_trolls_analysis.y1_final_with_days_passed`
where
(is_toxicity + is_severe_toxicity + is_obscene + is_threat + is_insult + is_identity_hate) >=1;
