annual_managements =
  index: ->
    frameh_table = new FramehDatatable('annual_managements_table')
    frameh_table.annual_managements_index()
    
$(document).on 'turbolinks:load', ->
  controller = $('#page').data('controller')
  action = $('#page').data('action')
  if controller == 'annual_managements' && action == 'index'
    annual_managements.index()