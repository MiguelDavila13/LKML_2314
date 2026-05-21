view: sold_measures {
  label: "Product Analysis: Sold Measures"
  # this is a SQL derived table; logic is declared in the org refinement files

  measure: sum_items_sold {
    label: "Items Sold"
    type: sum
  }
}
