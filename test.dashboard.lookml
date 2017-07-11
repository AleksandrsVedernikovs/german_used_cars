- dashboard: Test_dash
  layout: newspaper
  elements:
  - name: Map of sales of Audi's based on ave_price of sale
    label: Map of sales of Audi's based on ave_price of sale
    model: german_used_cars
    explore: cars_data_large
    type: looker_map
    fields:
    - cars_data_large.brand
    - location_data.city
    - cars_data_large.location
    - cars_data_large.ave_price
    filters:
      cars_data_large.brand: audi
    sorts:
    - cars_data_large.ave_price desc
    limit: 500
    column_limit: 50
    query_timezone: America/Los_Angeles
    map_plot_mode: points
    heatmap_gridlines: false
    heatmap_opacity: 0.5
    show_region_field: true
    draw_map_labels_above_data: true
    map_tile_provider: positron
    map_position: custom
    map_scale_indicator: 'off'
    map_pannable: true
    map_zoomable: true
    map_marker_type: circle
    map_marker_icon_name: default
    map_marker_radius_mode: proportional_value
    map_marker_units: pixels
    map_marker_proportional_scale_type: log
    map_marker_color_mode: value
    show_view_names: false
    show_legend: true
    quantize_map_value_colors: false
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    series_types: {}
    map_value_scale_clamp_min:
    map_value_scale_clamp_max:
    map_latitude: 50.78510168548186
    map_longitude: 10.491943359375002
    map_zoom: 2
    listen: {}
    row:
    col:
    width:
    height:
