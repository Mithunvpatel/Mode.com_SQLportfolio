--What is the average number of users created per day in May 2014?
--Using Yammer_events Table

SELECT AVG(user_count) AS avg_users_created_per_day
FROM (
  SELECT COUNT(DISTINCT user_id) AS user_count
  FROM yammer_tut.yammer_events
  WHERE occurred_at >= '2014-05-01 00:00:00' AND occurred_at < '2014-06-01 00:00:00' 
    AND event_name = 'create_user'
  GROUP BY DATE(occurred_at) 
) AS daily_user_counts;

--51.5161