import psycopg2
import requests

# Database connection details.
DB_PARAMS = {
    "dbname": "intodata_db",
    "user": "postgres",
    "password": "12345",
    "host": "localhost",
    "port": "5432",
}

# API Endpoint.
DEVITJOBS_API = "https://devitjobs.com/api/jobsLight"


# Connect to PostgreSQL.
def get_db_connection():
    return psycopg2.connect(**DB_PARAMS)


# Insert job data into raw table.
def insert_job_data(cursor, job_data, source):
    sql = """
        INSERT INTO raw.devitjobs (
        cpc,
        _id,
        jobUrl,
        isPartner,
        isPaused,
        longitude,
        latitude,
        cityCategory,
        stateCategory,
        logoImg,
        activeFrom,
        candidateContactWay,
        redirectJobUrl,
        remoteType,
        workplace,
        company,
        address,
        actualCity,
        postalCode,
        companyType,
        companySize,
        hasVisaSponsorship,
        language,
        perkKeys,
        name,
        jobType,
        expLevel,
        annualSalaryFrom,
        annualSalaryTo,
        techCategory,
        technologies,
        filterTags,
        source,
        ingested_ts
        ) VALUES (
        %s, %s, %s, %s, %s, %s, %s, %s, %s, %s,
        %s, %s, %s, %s, %s, %s, %s, %s, %s, %s,
        %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, CURRENT_TIMESTAMP
        );
    """
    cursor.execute(
        sql,
        (
            job_data.get("cpc"),
            job_data.get("_id"),
            job_data.get("jobUrl"),
            job_data.get("isPartner"),
            job_data.get("isPaused"),
            job_data.get("longitude"),
            job_data.get("latitude"),
            job_data.get("cityCategory"),
            job_data.get("stateCategory"),
            job_data.get("logoImg"),
            job_data.get("activeFrom"),
            job_data.get("candidateContactWay"),
            job_data.get("redirectJobUrl"),
            job_data.get("remoteType"),
            job_data.get("workplace"),
            job_data.get("company"),
            job_data.get("address"),
            job_data.get("actualCity"),
            job_data.get("postalCode"),
            job_data.get("companyType"),
            job_data.get("companySize"),
            job_data.get("hasVisaSponsorship"),
            job_data.get("language"),
            job_data.get("perkKeys"),
            job_data.get("name"),
            job_data.get("jobType"),
            job_data.get("expLevel"),
            job_data.get("annualSalaryFrom"),
            job_data.get("annualSalaryTo"),
            job_data.get("techCategory"),
            job_data.get("technologies"),
            job_data.get("filterTags"),
            source,
        ),
    )


# Fetch jobs from DevITjobs API.
def fetch_devitjobs():
    response = requests.get(DEVITJOBS_API)
    result = response.json()
    return result


# Main function to fetch and store data.
def ingest_data():
    try:
        conn = get_db_connection()
        cursor = conn.cursor()

        # Fetch and insert DevITjobs data.
        devitjobs_jobs = fetch_devitjobs()
        for job in devitjobs_jobs:
            insert_job_data(cursor, job, "DevITjobs")

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
