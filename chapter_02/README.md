# Batch processing

## Source
In current phase the HiredCorp is using data from two partners and ingesting data from  their APIs.

### Source 1
Source 1 is [Jobicy](https://jobicy.com/) a Remote Jobs company.

#### API
The API's documentations is available [here](https://jobicy.com/jobs-rss-feed).

The company will make request to the API once per day at 08:00 AM UTC to the endpoint below.
```shell
https://jobicy.com/api/v2/remote-jobs
```

A sample of the result is shown below.
```json
{
  "apiVersion": "2.0",
  "documentationUrl": "https://jobi.cy/apidocs",
  "friendlyNotice": "We appreciate your use of Jobicy API in your projects!",
  "jobCount": 5,
  "xRayHash": "f34514999a794e106f0866e8fb0e6863",
  "clientKey": "c15cbfc379d0e662ad3655755eeb4989776166d0c2d2dd523493d8a0d6dd6319",
  "lastUpdate": "2025-03-15 02:50:57",
  "jobs": [
    {
      "id": 103940,
      "url": "https://jobicy.com/jobs/103940-customer-service-specialist",
      "jobSlug": "103940-customer-service-specialist",
      "jobTitle": "Community Support Engineer (AMER)",
      "companyName": "Exodus",
      "companyLogo": "https://jobicy.com/data/server-nyc0409/galaxy/mercury/2024/03/97caac3a-221.jpeg",
      "jobIndustry": [
        "Customer Success"
      ],
      "jobType": [
        "full-time"
      ],
      "jobGeo": "LATAM,  Canada,  USA",
      "jobLevel": "Any",
      "jobExcerpt": "Exodus receives hundreds of email messages daily from customers learning about digital assets.",
      "jobDescription": "<p>Exodus receives hundreds of email messages daily from customers learning about digital assets.</p>",
      "pubDate": "2025-03-14 03:54:10",
      "annualSalaryMin": 50000,
      "annualSalaryMax": 0,
      "salaryCurrency": "USD"
    }
  ]
}
```

#### Data


### Source 2

## Extract data

## Transform data

## Load data
