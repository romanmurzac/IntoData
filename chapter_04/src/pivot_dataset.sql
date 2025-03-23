SELECT 
    candidate_id,
    MAX(CASE WHEN job_type = 'Developer' THEN experience END) AS Developer,
    MAX(CASE WHEN job_type = 'Analyst' THEN experience END) AS Analyst,
    MAX(CASE WHEN job_type = 'Manager' THEN experience END) AS Manager
FROM raw.candidate
GROUP BY candidate_id;