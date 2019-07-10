user_groups =
  form: ->
    AppForm.init()
    $('.datepicker').datepicker()
    $('#datatable').dataTable
      sPaginationType: "full_numbers"
      bJQueryUI: true
    
$(document).on 'turbolinks:load', ->
  controller = $('#page').data('controller')
  action = $('#page').data('action')
  if controller == 'user_groups'
    user_groups.form()
  
  


