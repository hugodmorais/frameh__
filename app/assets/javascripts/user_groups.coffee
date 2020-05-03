user_groups =
  index: ->
    frameh_table = new Datatable()
    frameh_table.user_groups_index()
    
$(document).on 'turbolinks:load', ->
  controller = $('#page').data('controller')
  action = $('#page').data('action')
  if controller == 'user_groups' && action == 'index'
    user_groups.index()
  


