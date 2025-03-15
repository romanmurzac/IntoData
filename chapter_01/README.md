# Data warehouse modeling

## Business Area Definition
HiredCorp is a headhunting and workforce placement company that connects job seekers with employers. It operates by publishing job listings from its own contracts with companies and aggregating job postings from external sources.

### Business Requirements
HiredComp's platform aggregates job postings from external sources (APIs) and provides insights into job trends, salaries, required skills, and hiring companies.

#### Core Business Goals
1. **Centralized Job Data** – Aggregate job postings from multiple PIs.
2. **Job Market Insights** – Track trends in job demand, required skills, and salaries.
3. **Company Analysis** – Identify which companies are hiring the most.
4. **Salary Trends** – Provide benchmarks for different job roles.
5. **Technology Popularity** – Determine which programming languages and tools are most in demand.
6. **Candidate & Employer Matching (Future Scope)** – Identify candidate fit based on job requirements.

#### Reports, Dashboards & KPIs
The main goal is to track hiring trends, job distribution, and market demand.

**Key Reports**
| Report Name |	Description |
| ----------- | ----------- |
| Job Distribution by Technology	| Shows the number of job postings for each technology (Python, AWS, SQL, etc.). |
| Job Openings by Company	| Ranks companies based on the number of job openings. |
| Job Openings by Location	| Analyzes job availability by city/state. |
| Salary Trends by Job Role	| Tracks salary ranges across job types. |
| Remote vs. Onsite Jobs	| Compares the percentage of remote, hybrid, and onsite jobs. |
| Job Growth Over Time	| Displays the trend of job postings over months/years. |

**Key Dashboards**
| Dashboard Name |	Option 1 | Option 2 | Option 3 | Option 4 |
| -------------- | ------------ | ------------ | ------------ | ------------ |
| Executive Dashboard | Total job postings (weekly/monthly trends) | % of remote vs. onsite jobs | Top hiring companies | Most in-demand technologies |
| Job Market Insights | Salary ranges by job title |  Growth trends for different job roles | Demand for technologies | - |
| Company Hiring Dashboard | Hiring patterns for specific companies | Time-to-fill job roles | Job types (contract, full-time, part-time) | - |

**Key KPIs**
| KPI |	Description |
| ----| ----------- |
| Total Job Postings | Count of job postings per day/week/month. |
| % Remote Jobs	| Percentage of remote job listings. |
| Average Salary by Role	| Average salary per job role (Software Engineer, Data Scientist, etc.). |
| Top 10 Hiring Companies	| List of companies posting the most jobs. |
| Technology Demand Index	| Percentage of job postings requiring a specific technology. |
| Growth Rate of Job Postings	| % change in job postings over time. |

## Warehouse Design

### Source
The data sources for the company are:
* [DevITjobs](https://devitjobs.com/api/jobsLight) --> Platform for job posting.
* [Jobicy](https://jobicy.com/jobs-rss-feed) --> Platform for job posting.

### Bus Matrix
The Bus Matrix helps identify the key dimensions and facts required for reporting.

| Business Process | Date| Company| Technology | Location | Job Type | Salary | Form |
| ---------------- | --- | ------ | ---------- | -------- | -------- | ------ | ---- |
| Job Postings          | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ |
| Salary Trends         | ✓ | ✓ | ✓ | ✓ | ✗ | ✓ | ✗ |
| Technology Demand     | ✓ | ✓ | ✓ | ✗ | ✗ | ✗ | ✗ |
| Company Hiring Trends | ✓ | ✓ | ✗ | ✓ | ✓ | ✗ | ✗ |

### Dimensional Data Model
The dimensional model follows a Star Schema, optimized for analytics.

#### Fact Tables
| Fact Tables |	Description |
| ------------| ----------- |
| fact_job_postings | Stores job-related metrics. |
| fact_salaries | Captures salary details over time. |
| fact_technology_demand | Tracks tech demand across job postings. |
| fact_company_hiring | Analyzes company hiring trends. |

**`fact_job_postings`**
* Stores job-related metrics.
* Grain: Each row represents a unique job posting.
* Partitioning: By date_id for time-based analysis.
* Indexes: company_id, technology_id, location_id, job_type_id for efficient queries.

| Column Name | Data Type | FK Reference | Description | Availability in API |
| ----------- | --------- | ------------ | ----------- | ------------------- |
| job_id | BIGINT PRIMARY KEY |	- | Unique job identifier | jobId |
| date_id | INT | dim_date(date_id) | Job posting date | publishedAt |
| company_id | INT | dim_company(company_id) | Hiring company| company.name |
| location_id | INT |	dim_location(location_id) | Job location| location |
| job_type_id | INT |	dim_job_type(job_type_id) | Full-time, part-time, etc. | employmentType |
| salary_id | INT |	dim_salary(salary_id) | Salary range | salaryMin, salaryMax |
| remote_type_id | INT | dim_remote_type(remote_type_id) | Remote, hybrid, onsite | remote |
| technology_id | INT |	dim_technology(technology_id) | Required technologies | tags |
| job_title | VARCHAR(255) | - |	Job title | title |
| job_description | TEXT | - |	Full job description | description |
| job_url | TEXT | - | Job posting link | url |

**`fact_salaries`**
* Salary Trends Over Time.
* Grain: Salary data grouped by job title, company, and location.

| Column Name | Data Type | FK Reference | Description | Availability in API |
| ----------- | --------- | ------------ | ----------- | ------------------- |
| salary_fact_id	| BIGINT PRIMARY KEY	| -	| Unique row identifier	| - |
| date_id	| INT	| dim_date(date_id)	| Salary date | publishedAt |
| job_title	| VARCHAR(255)	| -	| Job role | title |
| company_id	| INT	| dim_company(company_id)	| Company hiring for role | company.name |
| location_id	| INT	| dim_location(location_id)	| Job location| location |
| min_salary	| DECIMAL(10,2)	| -	| Minimum salary	| salaryMin |
| max_salary	| DECIMAL(10,2)	| -	| Maximum salary	| salaryMax |
| currency	| VARCHAR(10)	| -	| Salary currency	| currency |

**`fact_technology_demand`**
* Tracks job demand for each technology.
* Grain: Each row represents a job listing that requires a specific technology.

| Column Name | Data Type | FK Reference | Description | Availability in API |
| ----------- | --------- | ------------ | ----------- | ------------------- |
| tech_demand_id	| BIGINT PRIMARY KEY	| -	| Unique row identifier	| - |
| date_id	| INT	| dim_date(date_id)	| Date of job posting	| publishedAt |
| job_id	| BIGINT	| fact_job_postings(job_id)	| Related job posting | jobId |
| technology_id	| INT	| dim_technology(technology_id)	| Technology required | tags |

**`fact_company_hiring`**
* Tracks hiring activity per company.
* Grain: Aggregated at company and location level.

| Column Name | Data Type | FK Reference | Description | Availability in API |
| ----------- | --------- | ------------ | ----------- | ------------------- |
| company_hiring_id	| BIGINT PRIMARY KEY	| -	| Unique row identifier	| - |
| date_id	| INT	| dim_date(date_id)	| Hiring date	| publishedAt |
| company_id	| INT	| dim_company(company_id)	| Hiring company | company.name |
| location_id	| INT	| dim_location(location_id)	| Hiring location	| location |
| total_jobs	| INT	| -	| Count of job postings by company	| Aggregated |

#### Dimension Tables
| Dimension Table | Description |
| ----------------| ----------- |
| dim_date | Stores dates for time-based analysis. |
| dim_company | Stores company details. |
| dim_technology | Stores programming languages and tech stacks. |
| dim_location | Stores geographical details. |
| dim_job_type | Full-time, part-time, contract, etc. |
| dim_salary | Stores salary range classifications. |
| dim_remote_type | Remote, hybrid, onsite classification. |

**`dim_date`**
* Stores time-related data.
* Preloaded with a calendar of dates.

| Column Name | Data Type | Description |
| ----------- | --------- | ----------- |
| date_id | INT PRIMARY KEY	| Surrogate key |
| date	| DATE	| Full date |
| day	| INT	| Day of month |
| month	| INT	| Month number |
| year	| INT	| Year |

**`dim_company`**
* Stores hiring company data.

| Column Name | Data Type | Description | Availability |
| ----------- | --------- | ----------- | ------------ |
| company_id	| INT PRIMARY KEY	| Surrogate key	| - |
| company_name	| VARCHAR(255)	| Name of the company	| company.name |

**`dim_location`**
* Stores job location details.

| Column Name | Data Type | Description | Availability |
| ----------- | --------- | ----------- | ------------ |
| location_id	| INT PRIMARY KEY	| Surrogate key	| - |
| city	| VARCHAR(255)	| City name	| location |
| country	| VARCHAR(100)	| Country name	| extracted |

**`dim_job_type`**
* Job type classification.

| Column Name | Data Type | Description | Availability |
| ----------- | --------- | ----------- | ------------ |
| job_type_id	| INT PRIMARY KEY	| Surrogate key	| - |
| job_type	| VARCHAR(50)	| Full-time, part-time, contract | employmentType |

**`dim_salary`**
* Salary classification.

| Column Name | Data Type | Description | Availability |
| ----------- | --------- | ----------- | ------------ |
| salary_id	| INT PRIMARY KEY	| Surrogate key	| - |
| min_salary	| DECIMAL(10,2)	| Minimum salary	| salaryMin |
| max_salary	| DECIMAL(10,2)	| Maximum salary	| salaryMax |
| currency	| VARCHAR(10)	| Currency	| currency |

**`dim_remote_type`**
* Remote vs. Onsite.

| Column Name | Data Type | Description | Availability |
| ----------- | --------- | ----------- | ------------ |
| remote_type_id	| INT PRIMARY KEY	| Surrogate key	| - |
| remote_type	| VARCHAR(50)	| Remote, Hybrid, Onsite | remote |

**`dim_technology`**
* Stores programming languages & tools.

| Column Name | Data Type | Description | Availability |
| ----------- | --------- | ----------- | ------------ |
| technology_id	| INT PRIMARY KEY	| Surrogate key	| - |
| technology_name	| VARCHAR(255)	| Tech name	| tags |

### Physical Model

#### Indexing
* Primary Keys:
   * fact_job_postings(job_id)
   * fact_technology_demand(tech_demand_id)
* Indexes:
   * dim_company(company_name) for company lookups.
   * dim_location(city, country) for location-based searches.
   * dim_technology(technology_name) for job skill analysis.

#### Partitioning
* Fact Tables Partitioned by *date_id*

#### Data Quality
* Ensure non-null key fields
* Ensure salary consistency (currency in USD)
* Remove duplicate jobs (same job ID)
* Validate job postings have descriptions