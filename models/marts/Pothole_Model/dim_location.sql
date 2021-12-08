{{
  config(
    materialized = "table",
  )
}}

with dim_location as 
(SELECT DISTINCT
    upper(Borough) as borough,
    incident_zip as zip
 FROM `complaint-project-331901.311_Compaints.Pothole_Complaints`
)
select ROW_NUMBER () OVER() AS dim_location_id, * from dim_location
