- view: dream_journal
  suggestions: false
  fields:

  - dimension: details
    type: string
    sql: ${TABLE}.details

  - dimension: dream_id
    type: number
    sql: ${TABLE}.dream_id

  - measure: count
    type: count
    drill_fields: []

