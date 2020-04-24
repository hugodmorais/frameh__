# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
expenses =
  index: ->
    frameh_table = new Datatable()
    frameh_table.expenses_index()

  form: ->
    # New permission link
    LinkAddFields.associate('new_permission', 'permissions')

$(document).on 'turbolinks:load', ->
  controller = $('#page').data('controller')
  action = $('#page').data('action')
  if controller == 'expenses' && action == 'index'
    expenses.index()
  else if controller == 'expenses' && action in ['new', 'create', 'edit', 'update']
    expenses.form()