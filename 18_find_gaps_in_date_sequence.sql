SELECT calendar_date + INTERVAL '1 day' AS missing_date
FROM calendar_dates current_day
WHERE NOT EXISTS (
    SELECT 1
    FROM calendar_dates next_day
    WHERE next_day.calendar_date = current_day.calendar_date + INTERVAL '1 day'
);
