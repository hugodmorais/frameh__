class window.AppForm
  @init: ->
    $('input.datepicker').datepicker
      language: $('#page').data('locale')
      format: 'dd/mm/yyyy'
      clearBtn: true
      autoclose: true
      zIndexOffset: 999
