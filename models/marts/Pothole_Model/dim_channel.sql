{{
  config(
    materialized = "table",
  )
}}
with dim_channel as (SELECT
    ROW_NUMBER () OVER() AS dim_channel_id,
    channel
FROM (select distinct open_data_channel_type as channel from `complaint-project-331901.311_Compaints.Pothole_Complaints`) as s)

select * from dim_channel