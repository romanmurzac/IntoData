import psycopg2
import requests
import faker
import time


# Database connection details.
DB_PARAMS = {
    "dbname": "hiredcorp_db",
    "user": "postgres",
    "password": "12345",
    "host": "localhost",
    "port": "5432",
}


# Connect to PostgreSQL.
def get_db_connection():
    print("Connecting to the PostgreSQL database...")
    return psycopg2.connect(**DB_PARAMS)


# Insert job data into raw table.
def insert_job_data(cursor, job_data, source):
    print("Inserting job data into raw table...")
    sql = """
        INSERT INTO raw.candidate (
        candidate_id,
        first_name,
        last_name
        age,
        gender,
        experience,
        prefered_post,
        technologies,
        job_type,
        location,
        is_available,
        available_from,
        min_salary,
        created_at,
        source,
        ingested_ts
        ) VALUES (
        %s, %s, %s, %s, %s, %s, %s, %s, %s, %s,
        %s, %s, %s, CURRENT_TIMESTAMP, %s, CURRENT_TIMESTAMP
        );
    """
    cursor.execute(
        sql,
        (
            job_data.get("first_name"),
            job_data.get("last_name"),
            job_data.get("age"),
            job_data.get("gender"),
            job_data.get("experience"),
            job_data.get("prefered_post"),
            job_data.get("technologies"),
            job_data.get("job_type"),
            job_data.get("location"),
            job_data.get("is_available"),

            job_data.get("min_salary"),
            source,
        ),
    )
    print("Job data inserted successfully.")


# Fetch jobs from HiredCorp API.
def fetch_candidate():
    fake = faker.Faker()
    candidate = {
        "first_name": fake.first_name(),
        "last_name": fake.last_name(),
        "age": fake.random_int(min=18, max=65),
        "gender": fake.passport_gender(),
        "experience": fake.random_int(min=0, max=47),
        "prefered_post": fake.job(),
        "technologies": fake.random_element(
            elements=("Python", "Java", "JavaScript", "C++", "Go")
        ),
        "job_type": fake.random_element(
            elements=("Internship", "Full-time", "Part-time", "Contract")
        ),
        "location": fake.city(),
        "is_available": fake.random_element(elements=("Yes", "No")),
        "min_salary": fake.random_int(min=10000, max=250000),
    }
    print("Candidate data fetched successfully: ", candidate)
    return candidate


# Main function to fetch and store data.
def ingest_data():
    try:
        conn = get_db_connection()
        cursor = conn.cursor()

        # Fetch and insert candidate data.
        candidate_resume = fetch_candidate()
        insert_job_data(cursor, candidate_resume, "HiredCorp")

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
