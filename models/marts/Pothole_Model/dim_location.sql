{{
  config(
    materialized = "table",
  )
}}

with dim_location as 
(SELECT DISTINCT
    upper(Borough) as borough
 FROM `complaint-project-331901.311_Compaints.Weather_Raw`
)
select ROW_NUMBER () OVER() AS dim_location_id, * from dim_location
