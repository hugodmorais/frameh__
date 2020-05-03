# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
payment_installments =
  index: ->
    frameh_table = new Datatable()
    frameh_table.payment_installments_index()
    
$(document).on 'turbolinks:load', ->
  controller = $('#page').data('controller')
  action = $('#page').data('action')
  if controller == 'payment_installments' && action == 'index'
    payment_installments.index()
  
  


