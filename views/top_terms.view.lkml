# The name of this view in Looker is "Top Terms"
view: top_terms {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `testmodel1.top_terms` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Dma ID" in Explore.

  dimension: dma_id {
    type: number
    sql: ${TABLE}.dma_id ;;
  }

  dimension: dma_name {
    type: string
    sql: ${TABLE}.dma_name ;;
  }

  dimension: rank {
    type: number
    sql: ${TABLE}.rank ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: refresh {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.refresh_date ;;
  }

  dimension: score {
    type: number
    sql: ${TABLE}.score ;;
  }

  dimension: term {
    type: string
    sql: ${TABLE}.term ;;
  }

  dimension_group: week {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.week ;;
  }
  measure: count {
    type: count
    drill_fields: [dma_name]
  }
}
