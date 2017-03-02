connection: "postgres"

# include all the views
include: "*.view"

# include all the dashboards
include: "*.dashboard"

explore: cars_data_large {}

explore: location_data {}
