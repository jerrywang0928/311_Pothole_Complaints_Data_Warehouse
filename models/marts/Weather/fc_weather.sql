{{
  config(
    materialized = "table",
  )
}}

select
    dim_date_id,
    dim_location_id,
    Temperature_Max,
    Temperature_Avg,		
    Temperature_M,		
    Dewpot_Max,		
    Dewpot_Avg,		
    Dewpot_M,		
    Humidity_Max,		
    Humidity_Avg,		
    Humidity_M,	
    Wdspeed_Max,		
    Wdspeed_Avg,		
    Wdspeed_M,	
    Pressure_Max,		
    Pressure_M,		
    Precipitation_Total
from `complaint-project-331901.311_Compaints.Weather_Raw` as weather 

INNER JOIN {{ref ('dim_date')}} AS date_dimension on weather.WDate = date_dimension.full_date

INNER JOIN {{ref ('dim_location')}} AS location_dimension on upper(weather.Borough) = location_dimension.borough

