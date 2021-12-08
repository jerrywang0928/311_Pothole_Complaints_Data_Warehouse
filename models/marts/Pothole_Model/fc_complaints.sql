{{
  config(
    materialized = "table",
  )
}}

select  
    ROW_NUMBER () OVER() AS complaint_fact_id,
    dim_date_id,
    dim_location_id,
    dim_status_id,
    dim_agency_id,
    dim_channel_id,
    --dim_complaint_type_id
    --Number_complain
from {{ref ('stg_complaint')}} as complaint
inner join {{ref ('dim_date')}} as complaint_date on complaint.create_date = complaint_date.full_date
inner join {{ref ('dim_location')}} as complaint_loc on complaint.borough = complaint_loc.borough
inner join {{ref ('dim_status')}} as complaint_status on complaint.status = complaint_status.status
inner join {{ref ('dim_agency')}} as complaint_agency on complaint.agency = complaint_agency.agency
inner join {{ref ('dim_channel')}} as complaint_channel on complaint.channel = complaint_channel.channel

 







