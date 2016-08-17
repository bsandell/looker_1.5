- view: events
  suggestions: false
  fields:

  - dimension: id
    primary_key: true
    type: string
    sql: ${TABLE}.id

  - dimension: attributes
    type: string
    sql: ${TABLE}.attributes

  - dimension: body
    type: string
    sql: ${TABLE}.body

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

  - dimension: source
    type: string
    sql: ${TABLE}.source

  - dimension: ts
    type: number
    sql: ${TABLE}.ts

  - dimension: version
    type: number
    sql: ${TABLE}.version

  - dimension: year
    type: number
    sql: ${TABLE}.year

  - measure: count
    type: count
    drill_fields: [id]
    
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


