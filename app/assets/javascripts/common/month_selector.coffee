class window.MonthSelector
  constructor: ->
    @val = $('#month_selector').data('month')
    console.log($('#month_selector').data('month'))
    @on_change = ->
    @clicking_events()

  update: (updated_month) ->
    @val = updated_month
    updated_month_name = $(".month-item-picker[data-month-item=#{updated_month}]").text()
    $('#month_selector .month-name').text(updated_month_name)
    $('#month_selector').data('month', updated_month)
    first_month = $(".month-item-picker:first").data('month-item')
    last_month = $(".month-item-picker:last").data('month-item')
    $('#month_selector .previous-button').prop('disabled', @val == first_month)
    $('#month_selector .next-button').prop('disabled', @val == last_month)
    @on_change()

  clicking_events: ->
    class_this = @

    $('#month_selector .previous-button').on 'click', (event) ->
      event.preventDefault()
      class_this.update(class_this.val - 1)

    $('#month_selector .next-button').on 'click', (event) ->
      event.preventDefault()
      class_this.update(class_this.val + 1)

    $('.month-item-picker').on 'click', (event) ->
      event.preventDefault()
      selected_month = $(@).data('month-item')
      class_this.update selected_month unless selected_month == class_this.val

  param_for_ajax: =>
    month: @val
