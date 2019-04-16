measures =
  index: ->
    console.log("dsfdsfdsfdsfd")
    date_input = $('input[name="date"]')
    #our date input has the name "date"
    container = if $('.bootstrap-iso form').length > 0 then $('.bootstrap-iso form').parent() else 'body'
    options = 
        format: 'mm/dd/yyyy'
        container: container
        todayHighlight: true
        autoclose: true
    

$(document).on 'turbolinks:load', ->
    measures.index()
  


