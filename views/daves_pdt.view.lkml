view: daves_pdt {
derived_table: {
sql:  SELECT
 accidents.id  AS "id",
  DATE(accidents.event_date ) AS "accidents.event_date",
  accidents.airport_name  AS "accidents.airport_name",
  DATE(aircrafts.air_worth_date ) AS "aircrafts.air_worth_date",
  aircrafts.name  AS "aircrafts.name",
  aircraft_models.model  AS "aircraft_models.model",
  COUNT(*) AS "accidents.count"
FROM faa.accidents  AS accidents
LEFT JOIN faa.aircrafts  AS aircrafts ON accidents.aircraft_id = aircrafts.id
LEFT JOIN faa.aircraft_models  AS aircraft_models ON aircrafts.aircraft_model_id = aircraft_models.id

WHERE
  (accidents.event_date  IS NOT NULL)
GROUP BY 1,2,3,4,5,6
ORDER BY 1 DESC ;;
sql_trigger_value: SELECT DATE_PART('hour', GETDATE()) ;;#
 }


dimension: id {
  primary_key: yes
}


dimension: event_date {}
dimension: airport_name {}
dimension: air_worth_date {}
dimension: name {}
dimension: model {}
dimension: count {}




}
