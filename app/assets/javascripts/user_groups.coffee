user_groups =
  index: ->
    frameh_table = new FramehDatatable('user_groups_table')
    frameh_table.user_groups_index()
    
  form: ->
    AppForm.init()
    $('.datepicker').datepicker() 
    
$(document).on 'turbolinks:load', ->
  controller = $('#page').data('controller')
  action = $('#page').data('action')
  if controller == 'user_groups' && action == 'index'
    user_groups.index()
  else if controller == 'user_groups' && action in ['new', 'create', 'edit', 'update']
    user_groups.form()
  
  


