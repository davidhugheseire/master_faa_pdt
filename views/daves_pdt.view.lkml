view: daves_pdt {
derived_table: {
sql:  SELECT
 accidents.id  AS "id",
  DATE(accidents.event_date ) AS "event_date",
  accidents.airport_name  AS "airport_name1",
  DATE(aircrafts.air_worth_date ) AS "air_worth_date",
  aircrafts.name  AS "name",
  aircraft_models.model  AS "model",
  COUNT(*) AS "count"
FROM faa.accidents  AS accidents
LEFT JOIN faa.aircrafts  AS aircrafts ON accidents.aircraft_id = aircrafts.id
LEFT JOIN faa.aircraft_models  AS aircraft_models ON aircrafts.aircraft_model_id = aircraft_models.id

WHERE
  (accidents.event_date  IS NOT NULL)
GROUP BY 1,2,3,4,5,6
ORDER BY 1 DESC ;;
distribution_style: all
sql_trigger_value: SELECT DATE_PART('hour', GETDATE()) ;;
 }


dimension: id {
  primary_key: yes
}


dimension: event_date {
  type: date
}
dimension: airport_name1 {
  type: string
}
dimension: air_worth_date {
  type: date
}
dimension: name {
  type: string
}
dimension: model {
  type: string
}
dimension: count {
  type: number
}




}
