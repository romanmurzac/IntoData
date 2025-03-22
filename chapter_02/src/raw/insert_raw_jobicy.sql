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
  %s, %s, %s, %s, %s, %s, %s, %s, %s, %s,
  %s, %s, %s, %s, %s, %s, %s, %s, CURRENT_TIMESTAMP
);