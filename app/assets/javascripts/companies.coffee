
companies =
  index: ->
    frameh_table = new Datatable()
    frameh_table.companies_index()
    
$(document).on 'turbolinks:load', ->
  controller = $('#page').data('controller')
  action = $('#page').data('action')
  if controller == 'companies' && action == 'index'
    companies.index()