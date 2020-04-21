# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

expense_categories =
  index: ->
    frameh_table = new Datatable()
    frameh_table.expense_categories_index()
    
$(document).on 'turbolinks:load', ->
  controller = $('#page').data('controller')
  action = $('#page').data('action')
  if controller == 'expense_categories' && action == 'index'
    expense_categories.index()