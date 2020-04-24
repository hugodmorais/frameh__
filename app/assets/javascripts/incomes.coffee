
incomes =
  index: ->
    frameh_table = new Datatable()
    frameh_table.incomes_index()
    
$(document).on 'turbolinks:load', ->
  controller = $('#page').data('controller')
  action = $('#page').data('action')
  if controller == 'incomes' && action == 'index'
    incomes.index()