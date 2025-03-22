DELETE FROM staging.jobs
WHERE job_id IN (
    SELECT job_id FROM staging.jobs
    GROUP BY job_id HAVING COUNT(*) > 1
);