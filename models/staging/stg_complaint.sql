{{
  config(
    materialized = "table",
  )
}}
  SELECT 
    FORMAT_DATE('%Y/%m/%d', CAST(substring(Created_Date,1,10) AS date )) as create_date,
    borough,
    status,
    agency,
    open_data_channel_type as channel,
    complaint_type
  FROM `complaint-project-331901.311_Compaints.Pothole_Complaints` 