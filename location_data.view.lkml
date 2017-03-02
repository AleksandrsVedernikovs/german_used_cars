view: location_data {
  sql_table_name: public.location_data ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: latitude {
    type: number
    sql: ${TABLE}.latitude ;;
  }

  dimension: longitude {
    type: number
    sql: ${TABLE}.longitude ;;
  }

  dimension: place_name {
    type: string
    sql: ${TABLE}.place_name ;;
  }

  dimension: postal_code {
    type: number
    sql: ${TABLE}.postal_code ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
  }

  dimension: state_abbreviation {
    type: string
    sql: ${TABLE}.state_abbreviation ;;
  }

  measure: count {
    type: count
    drill_fields: [id, place_name]
  }
}
