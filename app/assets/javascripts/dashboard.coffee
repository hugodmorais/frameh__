dashboard =
  index: ->
    # Draw Events chart
    results_total = new ResultChart('results_total')
    results_total.dashboard_index()
    results_total.get_chart_data()

    results_partial = new ResultChart('results_partial')
    results_partial.dashboard_index_partial()
    results_partial.get_chart_data()

$(document).on 'turbolinks:load', ->
  controller = $('#page').data('controller')
  action = $('#page').data('action')
  if controller == 'dashboard' && action == 'index'
    dashboard.index()
