# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
financial_statements =
  index: ->
    frameh_table = new FramehDatatable('financial_statements_table')
    frameh_table.financial_statements_index()
    
$(document).on 'turbolinks:load', ->
  controller = $('#page').data('controller')
  action = $('#page').data('action')
  if controller == 'financial_statements' && action == 'index'
    financial_statements.index()