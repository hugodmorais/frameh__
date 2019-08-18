# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

contract_statuses =
    index: ->
        frameh_table = new FramehDatatable('contract_statuses_table')
        frameh_table.contract_statuses_index()
    
$(document).on 'turbolinks:load', ->
  controller = $('#page').data('controller')
  action = $('#page').data('action')
  if controller == 'contract_statuses' && action == 'index'
    contract_statuses.index()