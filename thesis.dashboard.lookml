- dashboard: sasha_thesis
  title: sasha_thesis
  layout: newspaper
  elements:
  - title: amount_of_adverts_published
    name: amount_of_adverts_published
    model: german_used_cars
    explore: cars_data_large
    type: looker_pie
    fields:
    - cars_data_large.date_created_month
    - cars_data_large.count
    sorts:
    - cars_data_large.date_created_month desc
    limit: 500
    column_limit: 50
    value_labels: labels
    label_type: labVal
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
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
    show_null_points: true
    point_style: none
    interpolation: linear
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    ordering: none
    show_null_labels: false
    column_spacing_ratio:
    column_group_spacing_ratio:
    series_types: {}
    row: 0
    col: 0
    width: 10
    height: 6
  - title: breakdown_of_ads_per_day_published_april
    name: breakdown_of_ads_per_day_published_april
    model: german_used_cars
    explore: cars_data_large
    type: looker_funnel
    fields:
    - cars_data_large.count
    - cars_data_large.date_created_day_of_week
    filters:
      cars_data_large.date_created_month_name: March
    sorts:
    - cars_data_large.count desc
    limit: 500
    column_limit: 50
    leftAxisLabelVisible: false
    leftAxisLabel: ''
    rightAxisLabelVisible: false
    rightAxisLabel: ''
    barColors:
    - 'palette: Tomato to Steel Blue'
    smoothedBars: true
    orientation: columns
    labelPosition: left
    percentType: total
    percentPosition: inline
    valuePosition: right
    labelColorEnabled: true
    labelColor: "#4d3d3d"
    groupBars: true
    labelSize: 10pt
    showLegend: true
    show_value_labels: false
    font_size: 12
    color_range:
    - "#dd3333"
    - "#80ce5d"
    - "#f78131"
    - "#369dc1"
    - "#c572d3"
    - "#36c1b3"
    - "#b57052"
    - "#ed69af"
    stacking: ''
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
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
    value_labels: labels
    label_type: labVal
    show_null_points: true
    point_style: none
    interpolation: linear
    series_types: {}
    row: 0
    col: 10
    width: 10
    height: 6
  - title: Top_10_brands_for_sale
    name: Top_10_brands_for_sale
    model: german_used_cars
    explore: cars_data_large
    type: looker_column
    fields:
    - cars_data_large.count
    - cars_data_large.logo
    sorts:
    - cars_data_large.count desc
    limit: 500
    column_limit: 50
    stacking: ''
    show_value_labels: true
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    limit_displayed_rows: true
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
    value_labels: labels
    label_type: labVal
    show_null_points: true
    point_style: none
    interpolation: linear
    series_types: {}
    colors:
    - 'palette: Santa Cruz'
    series_colors: {}
    label_color:
    - black
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '10'
    row: 11
    col: 0
    width: 20
    height: 12
  - title: Fuel_type_brakedown
    name: Fuel_type_brakedown
    model: german_used_cars
    explore: cars_data_large
    type: looker_column
    fields:
    - cars_data_large.count
    - cars_data_large.fuel_type
    sorts:
    - cars_data_large.count desc
    limit: 500
    dynamic_fields:
    - table_calculation: fuel_type
      label: Fuel_type
      expression: |-
        if(contains(${cars_data_large.fuel_type},"benzin"),"Petrol",
            if(contains(${cars_data_large.fuel_type},"diesel"),"Diesel",
                if(contains(${cars_data_large.fuel_type},"lpg"),"Liquefied Petroleum Gas",
                    if(contains(${cars_data_large.fuel_type},"cng"),"Compressed Natural Gas",
                        if(contains(${cars_data_large.fuel_type},"hybrid"),"Hybrid",
                            if(contains(${cars_data_large.fuel_type},"elektro"),"Electric",
                                if(contains(${cars_data_large.fuel_type},"andere"),"Bad_Data","Value_not_Entered")))))))
      value_format:
      value_format_name:
      _kind_hint: dimension
      _type_hint: string
    query_timezone: America/Los_Angeles
    stacking: ''
    show_value_labels: true
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
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
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_null_points: true
    point_style: circle
    interpolation: linear
    value_labels: legend
    label_type: labPer
    map_plot_mode: points
    heatmap_gridlines: false
    heatmap_gridlines_empty: false
    heatmap_opacity: 0.5
    show_region_field: true
    draw_map_labels_above_data: true
    map_tile_provider: positron
    map_position: fit_data
    map_scale_indicator: 'off'
    map_pannable: true
    map_zoomable: true
    map_marker_type: circle
    map_marker_icon_name: default
    map_marker_radius_mode: proportional_value
    map_marker_units: meters
    map_marker_proportional_scale_type: linear
    map_marker_color_mode: fixed
    show_legend: true
    quantize_map_value_colors: false
    reverse_map_value_colors: false
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    color_range:
    - "#dd3333"
    - "#80ce5d"
    - "#f78131"
    - "#369dc1"
    - "#c572d3"
    - "#36c1b3"
    - "#b57052"
    - "#ed69af"
    series_types: {}
    colors:
    - "#a6cee3"
    - "#1f78b4"
    - "#b2df8a"
    - "#33a02c"
    - "#fb9a99"
    - "#e31a1c"
    - "#fdbf6f"
    - "#ff7f00"
    - "#cab2d6"
    - "#7438b4"
    - "#edbc0e"
    - "#b15928"
    series_colors:
      cars_data_large.count: "#4752a5"
    label_color:
    - black
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: 0
    conditional_formatting:
    - type: not null
      value:
      background_color: "#ded825"
      font_color:
      palette:
        name: Red to Yellow to Green
        colors:
        - "#F36254"
        - "#FCF758"
        - "#4FBC89"
      bold: false
      italic: false
      strikethrough: false
      fields:
    - type: 'null'
      value:
      background_color: "#5868fc"
      font_color: "#0e0e0f"
      palette:
        name: Red to Yellow to Green
        colors:
        - "#F36254"
        - "#FCF758"
        - "#4FBC89"
      bold: false
      italic: false
      strikethrough: false
      fields: []
    hidden_fields:
    - cars_data_large.fuel_type
    row: 27
    col: 0
    width: 10
    height: 9
  - title: Gearbox_brakedown
    name: Gearbox_brakedown
    model: german_used_cars
    explore: cars_data_large
    type: looker_column
    fields:
    - cars_data_large.count
    - cars_data_large.gearbox
    sorts:
    - cars_data_large.count desc
    limit: 500
    dynamic_fields:
    - table_calculation: label_test
      label: label_test
      expression: |-
        if(contains(${cars_data_large.gearbox},"automatik"),"Auto",
          if(contains(${cars_data_large.gearbox},"manuell"),"Manual","Data_not_entered"))
      value_format:
      value_format_name:
      _kind_hint: dimension
      _type_hint: string
    query_timezone: America/Los_Angeles
    stacking: ''
    show_value_labels: true
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
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
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_null_points: true
    point_style: circle
    interpolation: linear
    value_labels: legend
    label_type: labPer
    map_plot_mode: points
    heatmap_gridlines: false
    heatmap_gridlines_empty: false
    heatmap_opacity: 0.5
    show_region_field: true
    draw_map_labels_above_data: true
    map_tile_provider: positron
    map_position: fit_data
    map_scale_indicator: 'off'
    map_pannable: true
    map_zoomable: true
    map_marker_type: circle
    map_marker_icon_name: default
    map_marker_radius_mode: proportional_value
    map_marker_units: meters
    map_marker_proportional_scale_type: linear
    map_marker_color_mode: fixed
    show_legend: true
    quantize_map_value_colors: false
    reverse_map_value_colors: false
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    color_range:
    - "#dd3333"
    - "#80ce5d"
    - "#f78131"
    - "#369dc1"
    - "#c572d3"
    - "#36c1b3"
    - "#b57052"
    - "#ed69af"
    series_types: {}
    colors:
    - "#a6cee3"
    - "#1f78b4"
    - "#b2df8a"
    - "#33a02c"
    - "#fb9a99"
    - "#e31a1c"
    - "#fdbf6f"
    - "#ff7f00"
    - "#cab2d6"
    - "#7438b4"
    - "#edbc0e"
    - "#b15928"
    series_colors:
      cars_data_large.count: "#4752a5"
    label_color:
    - black
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: 0
    conditional_formatting:
    - type: not null
      value:
      background_color: "#ded825"
      font_color:
      palette:
        name: Red to Yellow to Green
        colors:
        - "#F36254"
        - "#FCF758"
        - "#4FBC89"
      bold: false
      italic: false
      strikethrough: false
      fields:
    - type: 'null'
      value:
      background_color: "#5868fc"
      font_color: "#0e0e0f"
      palette:
        name: Red to Yellow to Green
        colors:
        - "#F36254"
        - "#FCF758"
        - "#4FBC89"
      bold: false
      italic: false
      strikethrough: false
      fields: []
    series_labels: {}
    y_axes:
    - label: ''
      maxValue:
      minValue:
      orientation: left
      showLabels: true
      showValues: true
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      unpinAxis: false
      valueFormat: ''
      series:
      - id: cars_data_large.count
        name: Cars Data Large
        axisId: cars_data_large.count
    hide_legend: false
    x_axis_datetime_label: ''
    hidden_fields:
    - cars_data_large.gearbox
    note_state: collapsed
    note_display: above
    note_text: ''
    row: 27
    col: 10
    width: 10
    height: 9
  - name: Fuel Type
    type: text
    title_text: Fuel Type
    body_text: |-
      “Alternative”" sources of energy are almost negligible in this dataset, which is not surprising considering that over 50% of the vehicles were 12 to 13 years old when this data was extracted.

      Petrol is roughly twice as prominent as Diesel.
      Dataset contains ~21000 NAs
    row: 23
    col: 0
    width: 10
    height: 4
  - name: Gearbox
    type: text
    title_text: Gearbox
    body_text: The European market is primarily a manual transmission market, so no
      surprises here. Again, there are about 6,000 NAs.
    row: 23
    col: 10
    width: 10
    height: 4
  - name: Brands
    type: text
    title_text: Brands
    body_text: |-
      The top 5 brands are German. Number 6 is Ford, which in Europe is largely perceived as German as it has its European headquarters in Cologne and many of its European products are actually designed and built in Germany. The next two brands are French, then Fiat is Italian. Seat is Spanish but it is actually part of the VW Group and their cars share almost all their components with VW products.
      In other words, German manufacturers are hugely dominant on their home turf.
    row: 6
    col: 0
    width: 20
    height: 5
  - title: Vehicle_type_brakedown
    name: Vehicle_type_brakedown
    model: german_used_cars
    explore: cars_data_large
    type: looker_column
    fields:
    - cars_data_large.vehicle_type
    - cars_data_large.count
    sorts:
    - cars_data_large.count desc
    limit: 500
    column_limit: 50
    dynamic_fields:
    - table_calculation: vehicle_type
      label: Vehicle_type
      expression: |-
        if(contains(${cars_data_large.vehicle_type},"limousine"),"Sedan",
          if(contains(${cars_data_large.vehicle_type},"kleinwagen"),"Small car",
             if(contains(${cars_data_large.vehicle_type},"kombi"),"Estate",
              if(contains(${cars_data_large.vehicle_type},"bus"),"People Carrier",
                if(contains(${cars_data_large.vehicle_type},"cabrio"),"Convertible",
                  if(contains(${cars_data_large.vehicle_type},"coupe"),"Coupe",
                    if(contains(${cars_data_large.vehicle_type},"suv"),"Suv",
                      if(contains(${cars_data_large.vehicle_type},"andere"),"Other","No_Data"))))))))
      value_format:
      value_format_name:
      _kind_hint: dimension
      _type_hint: string
    stacking: ''
    show_value_labels: true
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
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
    colors:
    - "#a6cee3"
    - "#1f78b4"
    - "#b2df8a"
    - "#33a02c"
    - "#fb9a99"
    - "#e31a1c"
    - "#fdbf6f"
    - "#ff7f00"
    - "#cab2d6"
    - "#3094c9"
    - "#edbc0e"
    - "#b15928"
    label_color:
    - black
    hide_legend: false
    series_colors:
      cars_data_large.count: "#5252dd"
    series_labels: {}
    series_types: {}
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: 0
    y_axes:
    - label: Amount of cars
      maxValue:
      minValue:
      orientation: left
      showLabels: true
      showValues: true
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      unpinAxis: false
      valueFormat: ''
      series:
      - id: cars_data_large.count
        name: Cars Data Large Count
        axisId: cars_data_large.count
    x_axis_datetime_label: ''
    hidden_fields:
    - cars_data_large.vehicle_type
    row: 41
    col: 0
    width: 20
    height: 9
  - name: Vehicle_type_brakedown_
    type: text
    title_text: Vehicle_type_brakedown_
    subtitle_text: This categorical variable has 8 levels and indicates the body style
      of the car (sedan, coupe, SUV etc.).
    body_text: This tends to reflect the general Western European market, with a prominence
      of “family” vehicles and smaller volumes of “niche” products (although a sample
      of new car registrations would probably show a higher proportion of SUVs considering
      the rise of this body style in recent years). Also note the large number of
      NAs – about ~25,000. E-Bay could definitely do a better job at encouraging their
      customers to write their ads properly.
    row: 36
    col: 0
    width: 20
    height: 5
  - title: Price_distribution
    name: Price_distribution
    model: german_used_cars
    explore: cars_data_large
    type: looker_scatter
    fields:
    - cars_data_large.count
    - cars_data_large.price
    filters:
      cars_data_large.price: "[500, 1000000]"
    sorts:
    - cars_data_large.price desc
    limit: 5000
    column_limit: 50
    stacking: ''
    show_value_labels: false
    label_density: 21
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
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
    show_null_points: true
    point_style: circle_outline
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    colors:
    - "#a6cee3"
    - "#1f78b4"
    - "#b2df8a"
    - "#33a02c"
    - "#fb9a99"
    - "#e31a1c"
    - "#fdbf6f"
    - "#ff7f00"
    - "#cab2d6"
    - "#3094c9"
    - "#edbc0e"
    - "#b15928"
    label_color:
    - black
    hide_legend: false
    series_colors:
      cars_data_large.count: "#5252dd"
    series_labels: {}
    series_types: {}
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: 0
    y_axes:
    - label: Amount of cars
      maxValue:
      minValue:
      orientation: left
      showLabels: true
      showValues: true
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      unpinAxis: false
      valueFormat: ''
      series:
      - id: cars_data_large.count
        name: Cars Data Large Count
        axisId: cars_data_large.count
    x_axis_datetime_label: ''
    x_axis_label: Price_range
    trend_lines:
    - color: "#f01111"
      label_position: right
      period: 7
      regression_type: exponential
      series_index: 1
      show_label: true
      label_type: string
    row: 55
    col: 0
    width: 20
    height: 9
  - name: Price_distribution_
    type: text
    title_text: Price_distribution_
    body_text: We can see that data lines out in the half shape of the bell curve,
      which give us normal distribution. Also please note that vast majority would
      fall in below 50k mark which makes total sense as we talking about mostly second
      hand vehicles.
    row: 50
    col: 0
    width: 20
    height: 5
  - title: registration year distribution
    name: registration year distribution
    model: german_used_cars
    explore: cars_data_large
    type: looker_column
    fields:
    - cars_data_large.year_of_registration
    - cars_data_large.count
    filters:
      cars_data_large.year_of_registration: "[1960, 2016]"
    sorts:
    - cars_data_large.year_of_registration desc
    limit: 500
    column_limit: 50
    stacking: ''
    show_value_labels: true
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
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
    reference_lines:
    - reference_type: line
      line_value: mean
      range_start: max
      range_end: min
      margin_top: deviation
      margin_value: mean
      margin_bottom: deviation
      label_position: right
      color: "#e61717"
      label: Average Price 5500,44$
    trend_lines: []
    y_axes:
    - label: ''
      maxValue:
      minValue:
      orientation: left
      showLabels: true
      showValues: true
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      unpinAxis: false
      valueFormat:
      series:
      - id: cars_data_large.count
        name: Cars Data Large Count
        axisId: cars_data_large.count
    series_types: {}
    colors:
    - 'palette: Santa Cruz'
    series_colors:
      calculation_1: "#23d923"
    series_labels:
      calculation_1: mean
    label_color:
    - black
    font_size: '11'
    row: 74
    col: 0
    width: 20
    height: 13
  - name: year_brakedown
    type: text
    title_text: year_brakedown
    body_text: |-
      The distribution is close to normal, with the following exceptions:

      A significant right tail
      Three peaks: one in 1999-2000, one in 2005-2006 and a large one in 2016.
      I did some research and it turns out that 1999, 2000, 2005, 2006 were all among the strongest years for new car registrations in Germany in the last 20 years. As they are also in the heart of the used car market in terms of age, it makes sense that they would translate into these peaks.
      As for 2016, the explanation is less obvious, especially as the data was collected in March and April, which is quite ealy in the year. The peak could be due to some listing errors (on purpose or not) where owners enter a date at random or to attract visitors to their ad. It could also be linked to the website’s features when creating an ad (eg. default value in drop-down menu).
      But there could also be a number of genuine 2016 cars suddenly arriving on the market. Employees in the automotive industry have often access to cheap car leasing schemes, whereby they can change their vehicle every 6 months or so. More importantly, most manufacturers register large numbers of demonstrators, press units and self-registered cars (new vehicles registered by the manufacturer or its dealers, in order to artificially boost market share and / or create cheaper opportunities to capture some customers over the competition).

      Maybe further investigation will tell us whether this theory holds.
    row: 64
    col: 0
    width: 20
    height: 10
