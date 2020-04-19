# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
users =
  index: ->
    frameh_table = new Datatable()
    frameh_table.users_index()
    
$(document).on 'turbolinks:load', ->
  controller = $('#page').data('controller')
  action = $('#page').data('action')
  if controller == 'users' && action == 'index'
    users.index()
  
  


