/*For the experiment “publisher_update”, what is the average number of engagement events
per user per day before the experiment and after the experiment?*/

/*Here, date of the experiment for the user is defined by the “occurred at” timestamp in the
yammer_experiments table.
Engagement events per day is the average number of events where there is an engagement
event (yammer_events table)*/

WITH before_exp AS (
  SELECT 
    a.user_id,
    COUNT(DISTINCT a.occurred_at::DATE) AS days_engaged,
    COUNT(*) AS num_engagements_before
  FROM yammer_tut.yammer_events a
  JOIN yammer_tut.yammer_experiments b
  ON a.user_id = b.user_id
  WHERE a.event_type = 'engagement'
    AND a.occurred_at::DATE < b.occurred_at::DATE
    AND b.experiment = 'publisher_update'
  GROUP BY a.user_id
),
after_exp AS (
  SELECT 
    a.user_id,
    COUNT(DISTINCT a.occurred_at::DATE) AS days_engaged,
    COUNT(*) AS num_engagements_after
  FROM yammer_tut.yammer_events a
  JOIN yammer_tut.yammer_experiments b
  ON a.user_id = b.user_id
  WHERE a.event_type = 'engagement'
    AND a.occurred_at::DATE >= b.occurred_at::DATE
    AND b.experiment = 'publisher_update'
  GROUP BY a.user_id
)
SELECT 
  AVG(x.num_engagements_after/x.days_engaged) avg_eng, 
  AVG(y.num_engagements_before/y.days_engaged) avg_eng_before,
  AVG(x.num_engagements_after/x.days_engaged) - AVG(y.num_engagements_before/y.days_engaged) AS engagement_diff
FROM before_exp y
JOIN after_exp x
ON y.user_id = x.user_id;


--avg_eng = 8.4152
--avg_eng_before = 8.8110
--engagement_diff = -0.3958