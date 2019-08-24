# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
payment_installments =
  index: ->
    frameh_table = new FramehDatatable('payment_installments_table')
    frameh_table.payment_installments_index()
    
  form: ->
    AppForm.init()
    $('.datepicker').datepicker() 
    
$(document).on 'turbolinks:load', ->
  controller = $('#page').data('controller')
  action = $('#page').data('action')
  if controller == 'payment_installments' && action == 'index'
    payment_installments.index()
  else if controller == 'payment_installments' && action in ['new', 'create', 'edit', 'update']
    payment_installments.form()
  
  


