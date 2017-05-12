connection: "postgres"

# include all the views
include: "*.view"

# include all the dashboards
include: "*.dashboard"

explore: data_large {
  join: location_data {
  type: left_outer
  relationship: many_to_one
  sql_on: ${location_data.postal_code} = ${data_large.postal_code};;
  }
}

explore: location_data {}
