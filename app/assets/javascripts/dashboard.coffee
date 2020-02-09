dashboard =
  index: ->
    # Draw Events chart
    results_total = new ResultChart('results_total')
    results_total.dashboard_index()
    results_total.get_chart_data()

    selected_month = new MonthSelector
    selected_month.on_change = ->
      monthly_expenses_url = $('#info_hidden').data('monthly-expenses-url')
      console.log($.getJSON monthly_expenses_url)
      $.getJSON monthly_expenses_url, (data) ->
        data.preventDefault()
        console.log("ew")
        console.log(data.income_value)
        return if data.month != selected_month.val
        for perpective in data.perspectives
          $(".strategic-score[data-perspective=#{expense.id}]").html perpective.strategic_score

$(document).on 'turbolinks:load', ->
  controller = $('#page').data('controller')
  action = $('#page').data('action')
  if controller == 'dashboard' && action == 'index'
    dashboard.index()
