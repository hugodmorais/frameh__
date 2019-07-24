
income_categories =
  index: ->
    frameh_table = new FramehDatatable('income_categories_table')
    frameh_table.income_categories_index()
    
$(document).on 'turbolinks:load', ->
  controller = $('#page').data('controller')
  action = $('#page').data('action')
  if controller == 'income_categories' && action == 'index'
    income_categories.index()