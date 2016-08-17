- view: anomalies
  suggestions: false
  fields:

  - dimension: day
    type: number
    sql: ${TABLE}.day

  - dimension: event_location
    type: string
    sql: ${TABLE}.event_location

  - dimension: event_type_id
    type: number
    sql: ${TABLE}.event_type_id

  - dimension: host
    type: string
    sql: ${TABLE}.host

  - dimension: metric_name
    type: string
    sql: ${TABLE}.metric_name

  - dimension: month
    type: number
    sql: ${TABLE}.month

  - dimension: service
    type: string
    sql: ${TABLE}.service

  - dimension: severity
    type: number
    sql: ${TABLE}.severity

  - dimension: ts
    type: number
    sql: ${TABLE}.ts

  - dimension: year
    type: number
    sql: ${TABLE}.year

  - measure: count
    type: count
    drill_fields: [metric_name]

