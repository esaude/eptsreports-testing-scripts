
-- SQL queries for data verification
-- List of patients who are (pregnant or breastfeeding) and are marked as "Male".

set @startDate='2017-04-24';
set @endDate='2019-04-24';
set @location=6;
select patient_id, state, date, p.gender
from person p join (select gravida_real.patient_id,
             if(gravida_real.data_gravida is null and lactante_real.data_parto is null, null,
                if(gravida_real.data_gravida is null, lactante_real.data_parto,
                   if(lactante_real.data_parto is null, gravida_real.data_gravida,
                      if(lactante_real.data_parto > gravida_real.data_gravida, lactante_real.data_parto, gravida_real.data_gravida)))) 'date',
             if(gravida_real.data_gravida is null and lactante_real.data_parto is null, null,
                if(gravida_real.data_gravida is null, 'breastfeeding',
                   if(lactante_real.data_parto is null, 'pregnant',
                      if(lactante_real.data_parto > gravida_real.data_gravida, 'breastfeeding', 'pregnant')))) state

      from
           (
             select patient_id, max(data_gravida) data_gravida
             from (Select p.patient_id, e.encounter_datetime data_gravida
                   from patient p
                          inner join encounter e on p.patient_id = e.patient_id
                          inner join obs o on e.encounter_id = o.encounter_id
                   where p.voided = 0
                     and e.voided = 0
                     and o.voided = 0
                     and concept_id = 1982
                     and value_coded = 44
                     and e.encounter_type in (5, 6)
                     and e.encounter_datetime between @startDate and @endDate
                     and e.location_id = @location


                   union

                   Select p.patient_id, e.encounter_datetime data_gravida
                   from patient p
                          inner join encounter e on p.patient_id = e.patient_id
                          inner join obs o on e.encounter_id = o.encounter_id
                   where p.voided = 0
                     and e.voided = 0
                     and o.voided = 0
                     and concept_id = 1279
                     and e.encounter_type in (5, 6)
                     and e.encounter_datetime between @startDate and @endDate
                     and e.location_id = @location

                   union

                   Select p.patient_id, e.encounter_datetime data_gravida
                   from patient p
                          inner join encounter e on p.patient_id = e.patient_id
                          inner join obs o on e.encounter_id = o.encounter_id
                   where p.voided = 0
                     and e.voided = 0
                     and o.voided = 0
                     and concept_id = 1600
                     and e.encounter_type in (5, 6)
                     and e.encounter_datetime between @startDate and @endDate
                     and e.location_id = @location


                   union

                   select pp.patient_id, pp.date_enrolled data_gravida
                   from patient_program pp
                   where pp.program_id = 8
                     and pp.voided = 0
                     and pp.date_enrolled between @startDate and @endDate
                     and pp.location_id = @location
                  ) gravida
             group by patient_id
           ) gravida_real
             left join
           (
             select patient_id, max(data_parto) data_parto
             from (
                    Select p.patient_id, e.encounter_datetime data_parto
                    from patient p
                           inner join encounter e on p.patient_id = e.patient_id
                           inner join obs o on e.encounter_id = o.encounter_id
                    where p.voided = 0
                      and e.voided = 0
                      and o.voided = 0
                      and concept_id = 6332
                      and value_coded = 1065
                      and e.encounter_type in (5, 6, 9)
                      and e.encounter_datetime between @startDate and @endDate
                      and e.location_id = @location

                    union

                    Select p.patient_id, e.encounter_datetime data_parto
                    from patient p
                           inner join encounter e on p.patient_id = e.patient_id
                           inner join obs o on e.encounter_id = o.encounter_id
                    where p.voided = 0
                      and e.voided = 0
                      and o.voided = 0
                      and concept_id = 6334
                      and value_coded = 6332
                      and e.encounter_type in (5, 6, 9)
                      and e.encounter_datetime between @startDate and @endDate
                      and e.location_id = @location

                    union

                    Select p.patient_id, o.value_datetime data_parto
                    from patient p
                           inner join encounter e on p.patient_id = e.patient_id
                           inner join obs o on e.encounter_id = o.encounter_id
                    where p.voided = 0
                      and e.voided = 0
                      and o.voided = 0
                      and concept_id = 5599
                      and e.encounter_type in (5, 6)
                      and o.value_datetime between @startDate and @endDate
                      and e.location_id = @location


                    union

                    select pg.patient_id, ps.start_date data_parto
                    from patient p
                           inner join patient_program pg on p.patient_id = pg.patient_id
                           inner join patient_state ps on pg.patient_program_id = ps.patient_program_id
                    where pg.voided = 0
                      and ps.voided = 0
                      and p.voided = 0
                      and pg.program_id = 8
                      and ps.state = 27
                      and ps.end_date is null
                      and ps.start_date between @startDate and @endDate
                      and location_id = @location
                  ) lactante
             group by patient_id
           ) lactante_real on lactante_real.patient_id = gravida_real.patient_id) gravidaLactante on gravidaLactante.patient_id = p.person_id
where p.gender = 'M';
