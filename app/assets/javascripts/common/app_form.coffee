start_it = ->
  $('[data-toggle="tooltip"]').tooltip()
  $('.datepicker').pickadate(
    language: 'pt'
    )

  $.extend true, $.fn.dataTable.defaults,
    bPaginate: true
    bStateSave: true
    fixedHeader:
      header: true
    language:
      sProcessing:   "A processar...",
      sLengthMenu:   "_MENU_",
      sZeroRecords:  "Não foram encontrados resultados",
      sInfo:         "Visualizar de _START_ até _END_ de _TOTAL_ registos",
      sInfoEmpty:    "Visualizar de 0 até 0 de 0 registos",
      sInfoFiltered: "(filtro de _MAX_ registos no total)",
      sInfoPostFix:  "",
      sSearch:       '<i class="fas fa-search"></i>',
      sUrl:          "",
      oPaginate:
          sFirst:    "<<",
          sPrevious: "anterior",
          sNext:     "seguinte",
          sLast:     ">>"

$(document).on 'turbolinks:load', start_it

$(document).on 'turbolinks:before-cache', ->
  if $('.datatables').length >= 1
    $('.datatables').DataTable().destroy()

