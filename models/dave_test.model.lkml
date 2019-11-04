connection: "faa_redshift"

# include all the views
include: "/views/**/*.view"

datagroup: dave_test_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: dave_test_default_datagroup

explore: accidents {
  access_filter: {
    field: aircrafts.aircraft_model_id
    user_attribute: allowed_model_id
  }
  join: aircrafts {
    type: left_outer
    sql_on: ${accidents.aircraft_id} = ${aircrafts.id} ;;
    relationship: many_to_one
  }

  join: aircraft_models {
    type: left_outer
    sql_on: ${aircrafts.aircraft_model_id} = ${aircraft_models.id} ;;
    relationship: many_to_one
  }

  join: daves_pdt {
    type: left_outer
    sql_on: ${daves_pdt.id} = ${accidents.id} ;;
    relationship: many_to_one

  }
}

explore: aircraft_models {}
explore: daves_pdt {}
explore: aircraftsA {
  from: aircrafts
}

explore: aircrafts {
  join: aircraft_models {
    type: left_outer
    sql_on: ${aircrafts.aircraft_model_id} = ${aircraft_models.id} ;;
    relationship: many_to_one
  }
}

explore: carriers {}

explore: flights {
  join: carriers {
    type: left_outer
    sql_on: ${flights.carrier_id} = ${carriers.id} ;;
    relationship: many_to_one
  }

  join: aircrafts {
    type: left_outer
    sql_on: ${flights.aircraft_id} = ${aircrafts.id} ;;
    relationship: many_to_one
  }

  join: aircraft_models {
    type: left_outer
    sql_on: ${aircrafts.aircraft_model_id} = ${aircraft_models.id} ;;
    relationship: many_to_one
  }
}
