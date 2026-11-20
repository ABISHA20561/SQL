WITH login_days AS (
    SELECT DISTINCT user_id, CAST(login_time AS DATE) AS login_day
    FROM user_logins
),
numbered AS (
    SELECT user_id, login_day,
           login_day - (ROW_NUMBER() OVER (PARTITION BY user_id ORDER BY login_day) * INTERVAL '1 day') AS streak_group
    FROM login_days
)
SELECT user_id, MIN(login_day) AS streak_start,
       MAX(login_day) AS streak_end, COUNT(*) AS streak_length
FROM numbered
GROUP BY user_id, streak_group
ORDER BY streak_length DESC;
