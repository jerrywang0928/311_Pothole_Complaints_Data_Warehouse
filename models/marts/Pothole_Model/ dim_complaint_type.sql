{{
  config(
    materialized = "table",
  )
}}
with dim_complaint_type as (SELECT
    ROW_NUMBER () OVER() AS dim_complaint_type_id,
    complaint_type
FROM (select distinct complaint_type from `complaint-project-331901.311_Compaints.Pothole_Complaints`) as s)

select * from dim_complaint_type