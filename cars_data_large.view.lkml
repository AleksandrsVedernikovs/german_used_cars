view: cars_data_large {
  sql_table_name: public.cars_data_large ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: brand {
    type: string
    sql: ${TABLE}.brand ;;
  }

  dimension_group: date_created {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    sql: ${TABLE}.date_created ;;
  }

  dimension: days_until_sold {
    type: number
    sql: ${TABLE}.days_until_sold ;;
  }
  measure: ave_days_sold {
    type: average
    sql: ${days_until_sold} ;;
    value_format_name: decimal_0
  }

  dimension: fuel_type {
    type: string
    sql: ${TABLE}.fuel_type ;;
  }

  dimension: gearbox {
    type: string
    sql: ${TABLE}.gearbox ;;
  }

  dimension: kilometer {
    type: number
    sql: ${TABLE}.kilometer ;;
  }

  dimension_group: last_seen {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    sql: ${TABLE}.last_seen ;;
  }

  dimension: model {
    type: string
    sql: ${TABLE}.model ;;
  }

  dimension: month_of_registration {
    type: number
    sql: ${TABLE}.month_of_registration ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: not_repaired_damage {
    type: string
    sql: ${TABLE}.not_repaired_damage ;;
  }

  dimension: postal_code {
    type: number
    sql: ${TABLE}.postal_code ;;
  }

  dimension: power_ps {
    type: number
    sql: ${TABLE}.power_ps ;;
  }

  dimension: power_ps_tier {
    type: tier
    tiers: [0, 100, 200, 300, 400, 500, 600, 700, 800]
    style: integer
    sql: ${power_ps} ;;
    value_format: "*00#"
  }

  dimension: price {
    type: number
    sql: ${TABLE}.price ;;
  }

  measure: max_price {
    type: max
    sql: ${price} ;;
    value_format_name: decimal_0
  }

  measure: min_price {
    type: min
    sql: ${price} ;;
    value_format_name: decimal_0
  }
  measure: ave_price {
    type: average
    sql: ${price} ;;
    value_format_name: decimal_0
  }

  measure: ave_kilometers {
    type: average
    sql: ${kilometer} ;;
    value_format_name: decimal_0
  }
  dimension: vehicle_type {
    type: string
    sql: ${TABLE}.vehicle_type ;;
  }

  dimension: year_of_registration {
    type: number
    sql: ${TABLE}.year_of_registration ;;
  }
  dimension: location {
    type: location
    sql_latitude: ${location_data.latitude} ;;
    sql_longitude: ${location_data.longitude} ;;
  }
  measure: count {
    type: count
    drill_fields: [id, name]
  }
  measure: most_recent_sold {
    type: date
    sql: MAX(${last_seen_date}) ;;
  }
  measure: percent_of_total_count {
    type: percent_of_total
    sql: ${count} ;;
  }
  measure: count_brand {
    type: count
    drill_fields: [id, name, price]
    filters: {
      field: days_until_sold
      value: "0"
    }
    }
}
