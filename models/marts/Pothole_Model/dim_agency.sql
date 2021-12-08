{{
  config(
    materialized = "table",
  )
}}
with dim_agency as (SELECT
    ROW_NUMBER () OVER() AS dim_agency_id,
    agency
FROM (select distinct agency from `complaint-project-331901.311_Compaints.Pothole_Complaints`) as s)

select * from dim_agency