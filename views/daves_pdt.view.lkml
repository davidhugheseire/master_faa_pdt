view: daves_pdt {
  derived_table: {
    explore_source: accidents {
      column: event_date {}
      column: id {}
      column: airport_name {}
      column: air_worth_date { field: aircrafts.air_worth_date }
      column: name { field: aircrafts.name }
      column: model { field: aircraft_models.model }
    }
    sql_trigger_value: SELECT DATE_PART('hour', GETDATE()) ;;
    distribution_style: all
  }


  dimension: id{}
  dimension: event_date {
    type: date
  }
  dimension: airport_name {}
  dimension: air_worth_date {
    type: date
  }
  dimension: name {}
  dimension: model {}
}
