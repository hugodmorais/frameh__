# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
currency_kinds =
    index: ->
        frameh_table = new Datatable()
        frameh_table.currency_kinds_index()
    
$(document).on 'turbolinks:load', ->
  controller = $('#page').data('controller')
  action = $('#page').data('action')
  if controller == 'currency_kinds' && action == 'index'
    currency_kinds.index()