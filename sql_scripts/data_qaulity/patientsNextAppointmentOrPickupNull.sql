
-- SQL queries for data verification
-- List of patients who have "Next Scheduled Appointment" or "Next Scheduled Drugs Pick Up" equal to Null

set @startDate='1999-04-24';
set @endDate='2019-04-24';
set @location=6;
select obs.person_id, obs.value_datetime
from obs
where obs.concept_id in (1410,5096)
  and obs.value_datetime is null
and obs.obs_datetime between @startDate and @endDate
and obs.location_id = @location;
