/*Analyze Mobile (phone or tablet) vs Non-Mobile (Desktop, Laptop or Notebook)
average events as a weekly cohort from the time a user gets created. Are there any differences
or similarities in the two cohorts?*/

SELECT
    EXTRACT(WEEK FROM yammer_events.occurred_at) AS week_number,
    yammer_events.device,
    yammer_experiments.experiment_group,
    COUNT(DISTINCT yammer_events.user_id) AS unique_users,
    SUM(yammer_events.user_type) AS total_events,
    SUM(yammer_events.user_type) / COUNT(DISTINCT yammer_events.user_id) AS avg_events_per_user
FROM
    yammer_tut.yammer_events yammer_events
    JOIN yammer_tut.yammer_experiments yammer_experiments ON yammer_events.user_id = yammer_experiments.user_id
WHERE
    yammer_events.device IN ('phone', 'tablet', 'amazon fire phone', 'nexus 10', 'ipad mini', 'windows surface', 'samsumg galaxy tablet', 'iphone 5', 'nexus 7', 'kindle fire', 'iphone 5s', 'nexus 5', 'htc one', 'iphone 4s', 'samsung galaxy note', 'nokia lumia 635', 'ipad air', 'samsung galaxy s4')
   OR yammer_experiments.device IN ('Desktop', 'Laptop', 'Notebook', 'dell inspiron desktop', 'asus chromebook', 'macbook air', 'lenovo thinkpad', 'mac mini', 'acer aspire desktop', 'acer aspire notebook', 'dell inspiron notebook', 'macbook pro', 'hp pavilion desktop')
GROUP BY
    EXTRACT(WEEK FROM yammer_events.occurred_at),
    yammer_events.device,
    yammer_experiments.experiment_group;

-- Follow up with AB_exp_Yam.py 