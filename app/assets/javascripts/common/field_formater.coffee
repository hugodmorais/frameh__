class window.FieldFormater
  constructor: ->
    @formated_fields = $()
    @date_unused_fields = $()

  # update: (format) ->
  #   if format == 'date_field'
  #     @formated_fields.addClass('datepicker')
  #     @date_unused_fields.val('')
  #     @date_unused_fields.addClass('hidden')
  #   else
  #     @formated_fields.removeClass('datepicker')
  #     @formated_fields.datepicker('destroy')
  #     @date_unused_fields.removeClass('hidden')
