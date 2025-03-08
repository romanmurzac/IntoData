# **Competency 5**: Data warehouse modeling

## Overview
**SecureData** company provides surveillance, patrolling, and alarm monitoring services. The company need a centralized data warehouse to analyze:
- Security incidents.
- Patrol reports.
- Alarm triggers.
- Client contracts.
- Guard schedules and performance.
- Incident response times.

## Data Sources
The sources from where data are colected:
- **IoT Security Devices:** Cameras, alarms, motion detectors.
- **Incident Reports:** Manual entries by security personnel.
- **Employee Shift Schedules:** Guard working hours and locations.
- **Client Contracts:** Service agreements with customers.
- **External Crime Database:** Public crime statistics for risk analysis.

## Business Area
The business area of the **SecureData** company revolves around providing on-demand security services to clients, ensuring safety across different locations, responding to security incidents, and monitoring alarm events. These processes involve coordination of guards, client requests, patrols, and alarm systems.

### Business Processes
**1. Incident Management:**
- This process tracks security incidents such as thefts, damages, or trespassing, involving a response from security guards.
- **Data:** fact_incidents, dim_guards, dim_clients, dim_locations, dim_time.
- **Goal:** To assess the number and severity of incidents, the locations, and guards involved. This helps in ensuring accountability, tracking trends, and improving response times.

**2. Patrol Management:**
- Security guards conduct scheduled patrols to ensure the safety of clients and their properties. Each patrol is logged to track effectiveness, completion, and status.
- **Data:** fact_patrols, dim_guards, dim_locations, dim_time.
- **Goal:** To monitor the guard patrols' adherence to schedules, identify patrol completion rates, and assess areas with frequent patrol failures.

**3. Alarm Event Management:**
- This process captures the triggering of alarms at client locations. The company responds to these triggers by sending security personnel to investigate.
- **Data:** fact_alarm_events, dim_clients, dim_locations, dim_time, dim_alarm_types.
- **Goal:** To analyze alarm events based on type, frequency, client, and location. It aids in optimizing response times, understanding alarm behavior, and improving overall service.

**4. Guard Performance Evaluation:**
- Tracks guards' activities, including incidents, patrols, and alarm responses. This is used for performance reviews, resource planning, and ensuring staff adequacy.
- **Data:** fact_incidents, fact_patrols, dim_guards.
- **Goal:** To assess individual guard effectiveness and their contribution to operational success, identifying top performers and areas requiring training.

**5. Client Contract and Service Management:**
- This process involves managing client contracts, their duration, and ensuring service delivery as per the agreement.
- **Data:** dim_clients.
- **Goal:** To track service level agreements, analyze contract start/end dates, renewals, and associated incidents or alarms triggered.

### Requirements, Reports, Dashboards, and KPIs

#### Key Performance Indicators
1. **Incident Frequency Rate** – Number of incidents per location per time period.
2. **Guard Response Time** – Average response time for guards to incidents or alarms.
3. **Patrol Completion Rate** – Percentage of scheduled patrols that are completed on time.
4. **Alarm Trigger Frequency** – Number of alarm triggers per client/location.
5. **Guard Performance Score** – Evaluating guard performance based on incidents, patrols, and alarm events.
6. **Client Service Level Compliance** – Monitoring whether service requirements as per the contract are met.
7. **Incident Severity Rate** – Breakdown of incidents by severity level.
8. **Alarm Type Frequency** – Frequency of different alarm types being triggered.

#### Reports
1. **Incident Trend Report** – Shows the trend of incidents over time, broken down by severity, client, and location.
2. **Guard Shift Report** – List of patrols assigned and completed, with performance evaluation.
3. **Alarm Event Report** – Detailed breakdown of triggered alarms by type, client, and location.
4. **Client Service Compliance Report** – Tracks adherence to service levels and contract terms.

#### Dashboards
1. **Security Activity Dashboard** – A real-time view of incidents, patrols, and alarms, displaying KPIs such as the number of incidents by severity, patrol completion rates, and alarm triggers.
2. **Guard Performance Dashboard** – Visualizes guard performance metrics, such as response times, patrol completion rates, and incidents handled.
3. **Alarm Event Analysis Dashboard** – Provides insights into alarm types, response times, and trends across different locations and clients.

#### Analytical Requirements
1. **Trend Analysis** – Analyzing incident rates, patrol activity, and alarm triggers over time to forecast future security needs.
2. **Geospatial Analysis** – Mapping incidents, patrols, and alarms on a geographic map to identify high-risk areas.
3. **Root Cause Analysis** – Understanding the underlying causes of incidents, alarms, and patrol failures, to reduce risk and improve operations.

## Warehouse Design

### Dimensional Design
**1. Incident Management:**
- **Business Process:** Incident Management and Reporting
- **Grain:** Each incident event.
- **Dimensions:** dim_guards, dim_clients, dim_locations, dim_time.
- **Facts:** Number of incidents, severity level, description, date/time of incident.

**2. Patrol Management:**
- **Business Process:** Patrol Logging and Monitoring
- **Grain:** Each patrol log entry.
- **Dimensions:** dim_guards, dim_locations, dim_time.
- **Facts:** Patrol status, guard assigned, patrol time.

**3. Alarm Event Management:**
- **Business Process:** Alarm Trigger Monitoring
- **Grain:** Each alarm event.
- **Dimensions:** dim_clients, dim_locations, dim_time, dim_alarm_types.
- **Facts:** Alarm type, time triggered, location, guard dispatched, response time.

**4. Guard Performance Evaluation:**
- **Business Process:** Performance Evaluation of Security Guards
- **Grain:** Guard performance per patrol, alarm, or incident.
- **Dimensions:** dim_guards, dim_locations, dim_time.
- **Facts:** Guard response time, patrol status, number of incidents handled.

**5. Client Contract and Service Management:**
- **Business Process:** Client Contract Monitoring and Management
- **Grain:** Each contract.
- **Dimensions:** dim_clients, dim_time.
- **Facts:** Contract start and end dates, service compliance, incidents linked to contract.

### Bus Matrix
| Fact Table     | dim_guards | dim_clients | dim_locations | dim_time | dim_alarm_types |
| :------------- | :--------: | :---------: | :-----------: | :------: | :-----------------: |
| fact_incidents |          ✓ |          ✓ |             ✓ |        ✓ |                  ✗ |
| fact_patrols   |          ✓ |          ✗ |             ✓ |        ✓ |                  ✗ |
| fact_patrols   |          ✗ |          ✓ |             ✓ |        ✓ |                  ✓ |

### Data Model
The data warehouse follows a **star schema**, ensuring efficient querying and analytics.

#### Fact Tables:
- **fact_incidents:** Stores records of security incidents
  - incident_id (PK)
  - guard_id (FK to dim_guards)
  - client_id (FK to dim_clients)
  - location_id (FK to dim_locations)
  - time_id (FK to dim_time)
  - severity_level
  - description
- **fact_patrols:** Tracks security patrol logs
  - patrol_id (PK)
  - guard_id (FK to dim_guards)
  - location_id (FK to dim_locations)
  - time_id (FK to dim_time)
  - status
- **fact_alarm_events:** Stores alarm trigger data
  - alarm_event_id (PK)
  - client_id (FK to dim_clients)
  - location_id (FK to dim_locations)
  - time_id (FK to dim_time)
  - alarm_type_id (FK to dim_alarm_types)
  - triggered_by

#### Dimension Tables:
- **dim_guards:** Security personnel details
  - guard_id (PK)
  - full_name
  - rank
  - shift_schedule

- **dim_clients:** Information on clients
  - client_id (PK)
  - client_name
  - contract_start_date
  - contract_end_date

- **dim_locations:** Security coverage areas
  - location_id (PK)
  - address
  - city
  - zone

- **dim_time:** Time dimension for analytics
  - time_id (PK)
  - date
  - month
  - year
  - day_of_week
  - hour_of_day

- **dim_alarm_types:** Types of alarms and triggers
  - alarm_type_id (PK)
  - alarm_type
  - risk_level



### Design storage

#### Cardinality
| Dimension Table | Related Fact Table | Cardinality                                                       |
| :-------------- | :----------------- | :---------------------------------------------------------------- | 
| dim_guards      | fact_incidents     | 1:M (One guard can be involved in multiple incidents)             |
| dim_guards      | fact_patrols       | 1:M (One guard can have multiple patrols)                         |
| dim_clients     | fact_incidents     | 1:M (One client can have multiple incidents)                      |
| dim_clients     | fact_alarm_events   | 1:M (One client can have multiple alarm events)                   |
| dim_locations   | fact_incidents     | 1:M (One location can have multiple incidents)                    |
| dim_locations   | fact_patrols       | 1:M (One location can have multiple patrols)                      |
| dim_locations   | fact_alarm_events   | 1:M (One location can have multiple alarm events)                 |
| dim_time        | fact_incidents     | 1:M (One time instance can relate to multiple incidents)          |
| dim_time        | fact_patrols       | 1:M (One time instance can relate to multiple patrol logs)        |
| dim_time        | fact_alarm_events   | 1:M (One time instance can relate to multiple alarm events)       |
| dim_alarm_types  | fact_alarm_events   | 1:M (One alarm type can be associated with multiple alarm events) |
|

#### Entity-Relationship Diagram
![Image 5.1](../media/image_5.1.PNG)

## Physical Data Model

**1. Indexing Strategy**
Indexes are critical for improving query performance. Based on the schema and common queries, the following indexing strategy is applied:

**Fact Tables**
```
-- fact_incidents: Index on frequently queried/filter columns
CREATE INDEX idx_fact_incidents_guard ON fact_incidents(guard_id);
CREATE INDEX idx_fact_incidents_client ON fact_incidents(client_id);
CREATE INDEX idx_fact_incidents_location ON fact_incidents(location_id);
CREATE INDEX idx_fact_incidents_time ON fact_incidents(time_id);
CREATE INDEX idx_fact_incidents_severity ON fact_incidents(severity_level);

-- fact_patrols: Index on common filters
CREATE INDEX idx_fact_patrols_guard ON fact_patrols(guard_id);
CREATE INDEX idx_fact_patrols_location ON fact_patrols(location_id);
CREATE INDEX idx_fact_patrols_time ON fact_patrols(time_id);
CREATE INDEX idx_fact_patrols_status ON fact_patrols(status);

-- fact_alarmevents: Indexing for performance
CREATE INDEX idx_fact_alarmevents_client ON fact_alarmevents(client_id);
CREATE INDEX idx_fact_alarmevents_location ON fact_alarmevents(location_id);
CREATE INDEX idx_fact_alarmevents_time ON fact_alarmevents(time_id);
CREATE INDEX idx_fact_alarmevents_alarmtype ON fact_alarmevents(alarm_type_id);
```

**Dimension Tables**
```
-- Unique index for primary keys (already created by default)
CREATE UNIQUE INDEX idx_dim_guards ON dim_guards(guard_id);
CREATE UNIQUE INDEX idx_dim_clients ON dim_clients(client_id);
CREATE UNIQUE INDEX idx_dim_locations ON dim_locations(location_id);
CREATE UNIQUE INDEX idx_dim_time ON dim_time(time_id);
CREATE UNIQUE INDEX idx_dim_alarm_types ON dim_alarm_types(alarm_type_id);

-- Indexes for faster lookup on non-PK attributes
CREATE INDEX idx_dim_guards_name ON dim_guards(full_name);
CREATE INDEX idx_dim_clients_name ON dim_clients(client_name);
CREATE INDEX idx_dim_locations_city ON dim_locations(city);
CREATE INDEX idx_dim_time_date ON dim_time(date);
```

**2. Partitioning Strategy**
Partitioning improves performance by breaking large tables into manageable segments. Partitioning is useful for Fact Tables due to their large size.

**Partitioning on Fact Tables**
```
-- Partition fact_incidents by year (time-based partitioning)
CREATE TABLE fact_incidents_Y2023 PARTITION OF fact_incidents
FOR VALUES FROM (20230101) TO (20231231);

CREATE TABLE fact_incidents_Y2024 PARTITION OF fact_incidents
FOR VALUES FROM (20240101) TO (20241231);

-- Creating partitions for patrol status
CREATE TABLE Fact_Patrols_Active PARTITION OF Fact_Patrols
FOR VALUES IN ('Active');

CREATE TABLE Fact_Patrols_Completed PARTITION OF Fact_Patrols
FOR VALUES IN ('Completed');
```