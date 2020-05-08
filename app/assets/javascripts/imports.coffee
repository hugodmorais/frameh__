
imports =
  index: ->
    frameh_table = new Datatable()
    frameh_table.imports_index()
    
$(document).on 'turbolinks:load', ->
  controller = $('#page').data('controller')
  action = $('#page').data('action')
  if controller == 'imports' && action == 'index'
    imports.index()