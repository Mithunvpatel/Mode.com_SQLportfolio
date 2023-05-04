/* How many different companies are in the “test_group” experiment group for the experiment
“publisher_update”? */

SELECT COUNT(DISTINCT company_id)
FROM 
(SELECT *
FROM yammer_tut.yammer_users a
JOIN yammer_tut.yammer_experiments b
ON a.user_id = b.user_id ) as dd

WHERE experiment = 'publisher_update'
AND experiment_group = 'test_group'

--688