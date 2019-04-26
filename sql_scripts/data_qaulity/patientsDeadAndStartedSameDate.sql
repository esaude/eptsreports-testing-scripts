-- SQL queries for data verification
-- List of patients who have last state = Dead and the the state date is equal to ART Program Enrollment Date.

set @startDate = '2010-06-20';
set @endDate = '2018-09-21';
set @location = 6;
select inicio.patient_id, inicio.data_inicio, obitou.start_date as data_obito
from (Select patient_id, min(data_inicio) data_inicio
      from (select pg.patient_id, date_enrolled data_inicio
            from patient p
                   inner join patient_program pg on p.patient_id = pg.patient_id
            where pg.voided = 0
              and p.voided = 0
              and program_id = 2
              and date_enrolled <= @endDate
              and location_id = @location
           ) inicio_real
      group by patient_id
     ) inicio
       inner join (SELECT pg.patient_id, ps.start_date
                   FROM patient p
                          INNER JOIN patient_program pg ON p.patient_id = pg.patient_id
                          INNER JOIN patient_state ps ON pg.patient_program_id = ps.patient_program_id
                   WHERE pg.voided = 0
                     AND ps.voided = 0
                     AND p.voided = 0
                     AND pg.program_id in (1, 2)
                     AND ps.state in (5, 10)
                     AND ps.end_date is null) obitou
                  on inicio.patient_id = obitou.patient_id
where inicio.data_inicio = obitou.start_date
  and data_inicio between @startDate and @endDate;