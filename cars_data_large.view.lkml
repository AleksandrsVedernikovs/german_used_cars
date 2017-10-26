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
    drill_fields: [brand,model,name,price,count]
    link:{
      label: "nice"
      url: "/explore/german_used_cars/cars_data_large?fields=cars_data_large.brand,cars_data_large.gearbox&f[cars_data_large.count]={{ _filters['cars_data_large.count'] | url_encode }}&f[cars_data_large.brand]={{ _filters['cars_data_large.brand'] | url_encode }}"
      icon_url: "http://www.looker.com/favicon.ico"
    }

  }

  dimension_group: date_created {
    type: time
    timeframes: [
      raw,
      date,
      day_of_week,
      day_of_week_index,
      week,
      month,
      month_name,
      quarter,
      week_of_year,
      year
    ]
    convert_tz: no
    sql: ${TABLE}.date_created ;;
  }

  dimension: days_on_site {
    type: number
    sql:  date ${last_seen_date} - date ${date_created_date} ;;
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
    drill_fields: [brand,name]
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
    value_format_name: usd_0
    link:{
      label: "test"
      url: "/dashboards/german_used_cars::price?price_bucket={{value}}"
    }
  }

  dimension: difference_from_average_price {
    type: number
    sql: ${sales_facts.average_price} - ${price} ;;
    value_format_name: eur_0
  }

  measure: most_expensive_item {
    type: max
    sql: ${price} ;;
    #value_format_name: eur_0
    value_format: "\"€ \"#,##0"
  }

  measure: least_expensive_item {
    type: min
    sql: ${price} ;;
    value_format_name: decimal_0
  }
  measure: average_sale_price {
    type: average
    sql: ${price} ;;
    value_format:  "\"€ \"#,##0.00"
  }
  measure: total_sale_price {
    type: sum
    sql: ${price} ;;
    value_format_name: decimal_0
  }

  parameter: sale_price_metric_picker {
    description: "Use with the Sale Price Metric measure"
    type: unquoted
    allowed_value: {
      label: "Total Sale Price"
      value: "SUM"
    }
    allowed_value: {
      label: "Average Sale Price"
      value: "AVG"
    }
    allowed_value: {
      label: "Maximum Sale Price"
      value: "MAX"
    }
    allowed_value: {
      label: "Minimum Sale Price"
      value: "MIN"
    }
  }

  measure: sale_price_metric {
    description: "Use with the Sale Price Metric Picker filter-only field"
    type: number
    label_from_parameter: sale_price_metric_picker
    sql: {% parameter sale_price_metric_picker %}(${price}) ;;
    value_format_name: usd
  }




  filter: brand_count_picker {
    description: "Use with the Category Count measure"
    type: string
    suggest_explore: cars_data_large
    suggest_dimension: cars_data_large.brand
  }

  measure: category_count {
    description: "Use with the Brand Count Picker filter-only field"
    type: sum
    sql:
    CASE
      WHEN {% condition brand_count_picker %} ${cars_data_large.brand} {% endcondition %}
      THEN 1
      ELSE 0
    END
  ;;
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
    drill_fields: [id, name, count]
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
  measure: count_filter_value_yes {
    type: count
    drill_fields: [id, name, price]
    filters: {
      field: brand_selector
      value: "yes"
    }
  }
measure: revenue {
  type: sum
  drill_fields: [id, name, price]
  sql: ${price} ;;
  value_format_name: usd_0

#  link:{
#   label: "test"
#    url: "/dashboards/german_used_cars::Test_dash"
#  }

}


  measure: total_Dau_2 {
    type: sum
    sql: ${price} ;;
    html:
    <summary style="outline:none"> Dau: {{ revenue._rendered_value }}
    </summary>Total Dau: {{ count._rendered_value }}
    <summary style="outline:none"> Percentage: {{ percent_of_total_count._rendered_value }}
    </summary> <br/>;;
  }


measure: median_price {
  type: median
  sql: ${price} ;;
  value_format_name: eur
}

  measure: count_filter_value_no {
    type: count
    drill_fields: [id, name, price]
    filters: {
      field: brand_selector
      value: "no"
    }
  }

  measure: sum_per_brand_revenue {
    type: number
    sql: CASE
          WHEN (${brand} = 'bmw') THEN Sum(${price})
          WHEN (${brand} = 'audi') THEN Sum(${price})
          WHEN (${brand} = 'alfaromeo') THEN Sum(${price})
          WHEN (${brand} = 'daewoo') THEN Sum(${price})
          WHEN (${brand} = 'lancia') THEN Sum(${price})
          WHEN (${brand} = 'renault') THEN Sum(${price})
          WHEN (${brand} = 'ford') THEN Sum(${price})
          WHEN (${brand} = 'toyota') THEN Sum(${price})
          WHEN (${brand} = 'sonstigeautos') THEN Sum(${price})
          WHEN (${brand} = 'kia') THEN Sum(${price})
          WHEN (${brand} = 'peugeot') THEN Sum(${price})
          WHEN (${brand} = 'subaru') THEN Sum(${price})
          WHEN (${brand} = 'nissan') THEN Sum(${price})
          WHEN (${brand} = 'rover') THEN Sum(${price})
          WHEN (${brand} = 'mitsubishi') THEN Sum(${price})
          WHEN (${brand} = 'dacia') THEN Sum(${price})
          WHEN (${brand} = 'chevrolet') THEN Sum(${price})
          WHEN (${brand} = 'honda') THEN Sum(${price})
          WHEN (${brand} = 'daihatsu') THEN Sum(${price})
          WHEN (${brand} = 'hyundai') THEN Sum(${price})
          WHEN (${brand} = 'porsche') THEN Sum(${price})
          WHEN (${brand} = 'smart') THEN Sum(${price})
          WHEN (${brand} = 'suzuki') THEN Sum(${price})
          WHEN (${brand} = 'mazda') THEN Sum(${price})
          WHEN (${brand} = 'landrover') THEN Sum(${price})
          WHEN (${brand} = 'mercedesbenz') THEN Sum(${price})
          WHEN (${brand} = 'volkswagen') THEN Sum(${price})
          WHEN (${brand} = 'volvo') THEN Sum(${price})
          WHEN (${brand} = 'fiat') THEN Sum(${price})
          WHEN (${brand} = 'seat') THEN Sum(${price})
          WHEN (${brand} = 'mini') THEN Sum(${price})
          WHEN (${brand} = 'saab') THEN Sum(${price})
          WHEN (${brand} = 'opel') THEN Sum(${price})
          WHEN (${brand} = 'jaguar') THEN Sum(${price})
          WHEN (${brand} = 'skoda') THEN Sum(${price})
          WHEN (${brand} = 'chrysler') THEN Sum(${price})
          WHEN (${brand} = 'jeep') THEN Sum(${price})
          WHEN (${brand} = 'citroen') THEN Sum(${price})
          WHEN (${brand} = 'lada') THEN Sum(${price})
          WHEN (${brand} = 'trabant') THEN Sum(${price})



     ELSE
     NULL END;;
  }


  dimension: brand_selector {
    type: yesno
    sql: {% condition cars_data_large.brand_filter %}${brand} {% endcondition %};;
    }
  filter: brand_filter {suggest_dimension: brand
    type: string
  }


}
