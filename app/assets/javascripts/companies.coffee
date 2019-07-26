
companies =
  index: ->
    frameh_table = new FramehDatatable('companies_table')
    frameh_table.companies_index()
    
$(document).on 'turbolinks:load', ->
  controller = $('#page').data('controller')
  action = $('#page').data('action')
  if controller == 'companies' && action == 'index'
    companies.index()