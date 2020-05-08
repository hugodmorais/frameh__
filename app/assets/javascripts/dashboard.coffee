dashboard =
  index: ->
    $('.carousel').carousel()

    $('.navbar h1').removeClass('hidden')
    # Draw Events chart
    results_total = new ResultChart('results_total')
    results_total.dashboard_index()
    results_total.get_chart_data()

$(document).on 'turbolinks:load', ->
  controller = $('#page').data('controller')
  action = $('#page').data('action')
  if controller == 'dashboard' && action == 'index'
    dashboard.index()
