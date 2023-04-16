--What is the email open rate for user type 2 in the week starting June 23, 2014?

/* Email open rate is defined as the number of users who opened the email divided by the
number of users who received the email.
Assume that the email opened event is triggered only once per email. And that the email
opened event corresponds to the email sent immediately preceding that email open event. 
*/

SELECT 
  (COUNT(CASE WHEN a.action = 'email_open' THEN 1 END) * 1.0) / 
  NULLIF(COUNT(CASE WHEN a.action = 'sent_weekly_digest' THEN 1 END), 0) AS ratio
FROM 
  (SELECT 
    *
  FROM 
    yammer_tut.yammer_emails e
    INNER JOIN yammer_tut.yammer_users u ON e.user_id = u.user_id
  WHERE 
    e.user_type = 2
    AND e.occurred_at >= '2014-06-23' AND e.occurred_at < '2014-06-30') AS a;


--0.3419

