- view: events_1020
  suggestions: false
  fields:

  - dimension: id
    primary_key: true
    type: string
    sql: ${TABLE}.id

  - dimension: attr_c_ip
    type: string
    sql: ${TABLE}.attr_c_ip

  - dimension: attr_cs_bytes
    type: string
    sql: ${TABLE}.attr_cs_bytes

  - dimension: attr_cs_host
    type: string
    sql: ${TABLE}.attr_cs_host

  - dimension: attr_cs_method
    type: string
    sql: ${TABLE}.attr_cs_method

  - dimension: attr_cs_uri_path
    type: string
    sql: ${TABLE}.attr_cs_uri_path

  - dimension: attr_cs_uri_query
    type: string
    sql: ${TABLE}.attr_cs_uri_query

  - dimension: attr_cs_uri_scheme
    type: string
    sql: ${TABLE}.attr_cs_uri_scheme

  - dimension: attr_cs_user_agent
    type: string
    sql: ${TABLE}.attr_cs_user_agent

  - dimension: attr_cs_username
    type: string
    sql: ${TABLE}.attr_cs_username

  - dimension: attr_date_part
    type: string
    sql: ${TABLE}.attr_date_part

  - dimension: attr_geoip
    type: string
    sql: ${TABLE}.attr_geoip

  - dimension: attr_geoip_city
    type: string
    sql: ${TABLE}.attr_geoip_city

  - dimension: attr_geoip_country
    type: string
    sql: ${TABLE}.attr_geoip_country

  - dimension: attr_geoip_latitude
    type: string
    sql: ${TABLE}.attr_geoip_latitude

  - dimension: attr_geoip_longitude
    type: string
    sql: ${TABLE}.attr_geoip_longitude

  - dimension: attr_geoip_timezone
    type: string
    sql: ${TABLE}.attr_geoip_timezone

  - dimension: attr_geoip_zipcode
    type: string
    sql: ${TABLE}.attr_geoip_zipcode

  - dimension: attr_rs_content_type
    type: string
    sql: ${TABLE}.attr_rs_content_type

  - dimension: attr_s_action
    type: string
    sql: ${TABLE}.attr_s_action

  - dimension: attr_s_hierarchy
    type: string
    sql: ${TABLE}.attr_s_hierarchy

  - dimension: attr_s_ip
    type: string
    sql: ${TABLE}.attr_s_ip

  - dimension: attr_s_sitename
    type: string
    sql: ${TABLE}.attr_s_sitename

  - dimension: attr_s_supplier_name
    type: string
    sql: ${TABLE}.attr_s_supplier_name

  - dimension: attr_sc_bytes
    type: string
    sql: ${TABLE}.attr_sc_bytes

  - dimension: attr_sc_filter_category
    type: string
    sql: ${TABLE}.attr_sc_filter_category

  - dimension: attr_sc_filter_result
    type: string
    sql: ${TABLE}.attr_sc_filter_result

  - dimension: attr_sc_status
    type: string
    sql: ${TABLE}.attr_sc_status

  - dimension: attr_tailed_file_byte_offset
    type: string
    sql: ${TABLE}.attr_tailed_file_byte_offset

  - dimension: attr_tailed_file_inode
    type: string
    sql: ${TABLE}.attr_tailed_file_inode

  - dimension: attr_tailed_file_path
    type: string
    sql: ${TABLE}.attr_tailed_file_path

  - dimension: attr_time_part
    type: string
    sql: ${TABLE}.attr_time_part

  - dimension: attr_time_taken
    type: string
    sql: ${TABLE}.attr_time_taken

  - dimension: attr_timestamp
    type: string
    sql: ${TABLE}.attr_timestamp

  - dimension: attr_x_icap_error_code
    type: string
    sql: ${TABLE}.attr_x_icap_error_code

  - dimension: attr_x_icap_error_details
    type: string
    sql: ${TABLE}.attr_x_icap_error_details

  - dimension: attr_x_virus_details
    type: string
    sql: ${TABLE}.attr_x_virus_details

  - dimension: attr_x_virus_id
    type: string
    sql: ${TABLE}.attr_x_virus_id

  - dimension: day
    type: number
    sql: ${TABLE}.day

  - dimension: event_type_id
    type: number
    sql: ${TABLE}.event_type_id

  - dimension: host
    type: string
    sql: ${TABLE}.host

  - dimension: location
    type: string
    sql: ${TABLE}.`location`

  - dimension: month
    type: number
    sql: ${TABLE}.month

  - dimension: service
    type: string
    sql: ${TABLE}.service

  - dimension: ts
    type: number
    sql: ${TABLE}.ts

  - dimension: year
    type: number
    sql: ${TABLE}.year

  - measure: count
    type: count
    drill_fields: [id, attr_cs_username, attr_s_sitename, attr_s_supplier_name]

  - dimension: ip_location
    type: location
    sql_latitude: ${attr_geoip_latitude}
    sql_longitude: ${attr_geoip_longitude}
    
  - dimension: previous_day_year
    type: int
    sql: extract(year from days_sub(now(), 1))
    
  - dimension: previous_day_month
    type: int
    sql: extract(month from days_sub(now(), 1))

  - dimension: previous_day_day
    type: int
    sql: extract(day from days_sub(now(), 1))
    
  - dimension: is_yesterday_ts
    type: yesno
    sql: from_unixtime(round(${ts}/1000),"yyyy-MM-dd") = trunc(subdate(now(), 1), 'HH')
    
  - dimension: is_yesterday
    type: yesno
    sql: (${previous_day_year} = ${year}) AND (${previous_day_month} = ${month}) AND (${previous_day_day} = ${day})


