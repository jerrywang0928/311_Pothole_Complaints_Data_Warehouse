{{
  config(
    materialized = "table",
  )
}}

with complaint as (
  SELECT *
  FROM {{ref ('stg_complaints')}}
),

complaint_date as(
  select dim_date_id,substring(date_integer,3,6) as date_integer from {{ref ('dim_date')}}
),

complaint_loc as (
  select * from {{ref ('dim_location')}}
)

select  
    dim_date_id,
    dim_location_id,
    --Status_dim_ID,
    --Agency_dim_ID,
    --Number_complain
from complaint
inner join complaint_date on complaint.create_date = complaint_date.date_integer
inner join complaint_loc on complaint.borough = complaint_loc.borough

