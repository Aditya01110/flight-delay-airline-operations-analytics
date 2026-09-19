-- PostgreSQL analysis queries
-- Assumes a cleaned table named flights_clean.

-- 1. Airline delay rates
SELECT airline_name,
       COUNT(*) AS total_flights,
       ROUND(100.0 * SUM(is_delayed) / NULLIF(SUM(is_eligible),0), 2) AS delay_rate_pct
FROM flights_clean
GROUP BY airline_name
HAVING COUNT(*) >= 10000
ORDER BY delay_rate_pct DESC;

-- 2. Highest average departure delay by origin airport
SELECT origin_airport,
       COUNT(*) AS total_flights,
       ROUND(AVG(departure_delay), 2) AS avg_departure_delay_min
FROM flights_clean
WHERE cancelled = 0
GROUP BY origin_airport
HAVING COUNT(*) >= 10000
ORDER BY avg_departure_delay_min DESC;

-- 3. Route cancellation rates
SELECT route,
       COUNT(*) AS total_flights,
       ROUND(100.0 * SUM(cancelled) / COUNT(*), 2) AS cancellation_rate_pct
FROM flights_clean
GROUP BY route
HAVING COUNT(*) >= 500
ORDER BY cancellation_rate_pct DESC;

-- 4. Overall on-time percentage
SELECT ROUND(
    100.0 * SUM(is_on_time) / NULLIF(SUM(is_eligible),0), 2
) AS on_time_pct
FROM flights_clean;

-- 5. Monthly delay rate
SELECT month,
       ROUND(100.0 * SUM(is_delayed) / NULLIF(SUM(is_eligible),0), 2) AS delay_rate_pct
FROM flights_clean
GROUP BY month
ORDER BY month;

-- 6. Weekday delay rate
SELECT day_of_week, weekday_name,
       ROUND(100.0 * SUM(is_delayed) / NULLIF(SUM(is_eligible),0), 2) AS delay_rate_pct
FROM flights_clean
GROUP BY day_of_week, weekday_name
ORDER BY day_of_week;

-- 7. Hourly delay rate
SELECT departure_hour,
       ROUND(100.0 * SUM(is_delayed) / NULLIF(SUM(is_eligible),0), 2) AS delay_rate_pct
FROM flights_clean
WHERE departure_hour BETWEEN 0 AND 23
GROUP BY departure_hour
ORDER BY departure_hour;

-- 8. High-volume route operational-risk score
WITH route_metrics AS (
    SELECT route,
           COUNT(*) AS total_flights,
           100.0 * SUM(is_delayed) / NULLIF(SUM(is_eligible),0) AS delay_rate_pct,
           100.0 * SUM(cancelled) / COUNT(*) AS cancellation_rate_pct
    FROM flights_clean
    GROUP BY route
    HAVING COUNT(*) >= 1000
)
SELECT route, total_flights,
       ROUND(delay_rate_pct,2) AS delay_rate_pct,
       ROUND(cancellation_rate_pct,2) AS cancellation_rate_pct,
       ROUND(0.70*delay_rate_pct + 0.30*cancellation_rate_pct,2) AS operational_risk_score
FROM route_metrics
ORDER BY operational_risk_score DESC;

-- 9. Cancellation reasons
SELECT cancellation_reason,
       COUNT(*) AS cancelled_flights
FROM flights_clean
WHERE cancelled = 1
GROUP BY cancellation_reason
ORDER BY cancelled_flights DESC;

-- 10. Airline delay recovery
SELECT airline_name,
       ROUND(AVG(delay_recovery),2) AS avg_minutes_recovered
FROM flights_clean
WHERE departure_delay > 0
  AND cancelled = 0
  AND diverted = 0
  AND arrival_delay IS NOT NULL
GROUP BY airline_name
HAVING COUNT(*) >= 5000
ORDER BY avg_minutes_recovered DESC;
