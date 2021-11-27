{{
  config(
    materialized = "table",
  )
}}
with dim_status as (SELECT
    ROW_NUMBER () OVER() AS dim_status_id,
    Status as status
FROM (select distinct Status from `complaint-project-331901.311_Compaints.Pothole_Complaints_Raw`) as s)

select * from dim_status