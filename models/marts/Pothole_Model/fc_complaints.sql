{{
  config(
    materialized = "table",
  )
}}

with complaint as (
  select
    format_date('%Y%m%d',Created_Date) as create_date
  from `complaint-project-331901.311_Compaints.Pothole_Complaints_Raw`
),

complaint_date as(
  select date_dim_id,substring(date_integer,3,6) as date_integer from {{ref ('dim_date')}}
),

complaint_loc as (
  select * from {{ref ('dim_location')}}
)

select  
    date_dim_id,
    Location_dim_ID,
    --Status_dim_ID,
    --Agency_dim_ID,
    --Number_complain
from complaint
inner join dim_date on complaint.create_date = complaint_date.date_integer
inner join dim_complaint_locattion on 
