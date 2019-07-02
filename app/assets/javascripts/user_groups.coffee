user_groups =
  form: ->
    AppForm.init()
    $('.datepicker').datepicker()
    
$(document).on 'turbolinks:load', ->
  controller = $('#page').data('controller')
  action = $('#page').data('action')
  if controller == 'user_groups'
    user_groups.form()
  
  


