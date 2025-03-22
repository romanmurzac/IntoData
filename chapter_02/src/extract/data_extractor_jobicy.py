import psycopg2
import requests

# Database connection details.
DB_PARAMS = {
    "dbname": "hiredcorp_db",
    "user": "postgres",
    "password": "12345",
    "host": "localhost",
    "port": "5432",
}

# API Endpoint.
JOBICY_API = "https://jobicy.com/api/v2/remote-jobs"


# Connect to PostgreSQL.
def get_db_connection():
    return psycopg2.connect(**DB_PARAMS)


# Insert job data into raw table.
def insert_job_data(cursor, job_data, update_at, source):
    sql = """
        INSERT INTO raw.jobicy (
        id,
        url,
        jobSlug,
        jobTitle,
        companyName,
        companyLogo,
        jobIndustry,
        jobType,
        jobGeo,
        jobLevel,
        jobExcerpt,
        jobDescription,
        pubDate,
        annualSalaryMin,
        annualSalaryMax,
        salaryCurrency,
        lastUpdate,
        source,
        ingested_ts
        ) VALUES (
        %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, CURRENT_TIMESTAMP
        );
    """
    cursor.execute(
        sql,
        (
            job_data.get("id"),
            job_data.get("url"),
            job_data.get("jobSlug"),
            job_data.get("jobTitle"),
            job_data.get("companyName"),
            job_data.get("companyLogo"),
            job_data.get("jobIndustry"),
            job_data.get("jobType"),
            job_data.get("jobGeo"),
            job_data.get("jobLevel"),
            job_data.get("jobExcerpt"),
            job_data.get("jobDescription"),
            job_data.get("pubDate"),
            job_data.get("annualSalaryMin"),
            job_data.get("annualSalaryMax"),
            job_data.get("salaryCurrency"),
            update_at,
            source,
        ),
    )


# Fetch jobs from Jobicy API.
def fetch_jobicy():
    response = requests.get(JOBICY_API)
    result = response.json()
    jobs = result.get("jobs")
    last_update = result.get("lastUpdate")
    return last_update, jobs


# Main function to fetch and store data.
def ingest_data():
    try:
        conn = get_db_connection()
        cursor = conn.cursor()

        # Fetch and insert Jobicy data.
        jobicy_jobs = fetch_jobicy()[1]
        update_at = fetch_jobicy()[0]
        for job in jobicy_jobs:
            insert_job_data(cursor, job, update_at, "Jobicy")

        conn.commit()
    except Exception as e:
        conn.rollback()
    finally:
        cursor.close()
        conn.close()


# Run the ingestion.
if __name__ == "__main__":
    # Run ingestion.
    ingest_data()
