connection: "postgres"

# include all the views
include: "*.view"

# include all the dashboards
include: "*.dashboard"

explore: cars_data_large {

  join: location_data {
  type: left_outer
  relationship: many_to_one
  sql_on: ${location_data.postal_code} = ${cars_data_large.postal_code};;
  }

  join: sales_facts {
    type: left_outer
    relationship: many_to_one
    sql_on: ${cars_data_large.brand} = ${sales_facts.cars_brand} AND
            ${cars_data_large.year_of_registration} = ${sales_facts.year_of_registration};;
  }
}

explore: location_data {}

explore: sales_facts {}
