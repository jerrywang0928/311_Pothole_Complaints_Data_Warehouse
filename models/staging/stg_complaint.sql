  SELECT FORMAT_DATE('%Y/%m/%d', CAST(substring(Created_Date,1,10) AS date )) as create_date,
  borough
  FROM `complaint-project-331901.311_Compaints.Pothole_Complaints` 