class window.Datatable
  constructor: (table_id) ->
    @id = table_id
    @table_id = '#' + table_id
    @datatable = null

  users_index: -> 
    @datatable = $('#users-datatable').dataTable
      processing: true
      bStateSave: true
      serverSide: true
      ajax:
        url: $('#users-datatable').data('source')
      dom: 
        "<'row'<'col-sm-2'l><'col-sm-7 text-center'B><'col-sm-3'f>>" +
        "<'row'<'col-sm-12'tr>>" +
        "<'row'<'col-sm-5'i><'col-sm-7 btn-sm'p>>"
      pagingType: 'full_numbers'
      columns: [
        { data: 'name' }
        { data: 'email' }
        { data: 'admin' }
        { data: 'actions' }
      ]
      columnDefs: [{
        targets: -1
        orderable: false
      }]

  annual_managements_index: ->
    @datatable = $('#annual_managements-datatable').dataTable
      processing: true
      bStateSave: true
      serverSide: true
      ajax:
        url: $('#annual_managements-datatable').data('source')
      dom: 
        "<'row'<'col-sm-3'l><'col-sm-7 text-center'B><'col-sm-2'f>>" +
        "<'row'<'col-sm-12'tr>>" +
        "<'row'<'col-sm-5'i><'col-sm-6 btn-sm'p>>"
      pagingType: 'full_numbers'
      columns: [
        { data: 'year' }
        { data: 'description' }
        { data: 'actions' }
      ]
      columnDefs: [{
        targets: -1
        orderable: false
      }]

  income_categories_index: ->
    @datatable = $('#income_categories-datatable').dataTable
      processing: true
      bStateSave: true
      serverSide: true
      ajax:
        url: $('#income_categories-datatable').data('source')
      dom: 
        "<'row'<'col-sm-3'l><'col-sm-7 text-center'B><'col-sm-2'f>>" +
        "<'row'<'col-sm-12'tr>>" +
        "<'row'<'col-sm-5'i><'col-sm-6 btn-sm'p>>"
      pagingType: 'full_numbers'
      columns: [
        { data: 'name' }
        { data: 'actions' }
      ]
      columnDefs: [{
        targets: -1
        orderable: false
      }]

  expense_categories_index: ->
    @datatable = $('#expense_categories-datatable').dataTable
      processing: true
      bStateSave: true
      serverSide: true
      ajax:
        url: $('#expense_categories-datatable').data('source')
      dom: 
        "<'row'<'col-sm-3'l><'col-sm-7 text-center'B><'col-sm-2'f>>" +
        "<'row'<'col-sm-12'tr>>" +
        "<'row'<'col-sm-5'i><'col-sm-6 btn-sm'p>>"
      pagingType: 'full_numbers'
      columns: [
        { data: 'name' }
        { data: 'primary_payment' }
        { data: 'icon' }
        { data: 'actions' }
      ]
      columnDefs: [{
        targets: -1
        orderable: false
      }]

  contract_statuses_index: ->
    @datatable = $('#contract_statuses-datatable').dataTable
      processing: true
      bStateSave: true
      serverSide: true
      ajax:
        url: $('#contract_statuses-datatable').data('source')
      dom: 
        "<'row'<'col-sm-3'l><'col-sm-7 text-center'B><'col-sm-2'f>>" +
        "<'row'<'col-sm-12'tr>>" +
        "<'row'<'col-sm-5'i><'col-sm-6 btn-sm'p>>"
      pagingType: 'full_numbers'
      columns: [
        { data: 'name' }
        { data: 'actions' }
      ]
      columnDefs: [{
        targets: -1
        orderable: false
      }]

  currency_kinds_index: ->
    @datatable = $('#currency_kinds-datatable').dataTable
      processing: true
      bStateSave: true
      serverSide: true
      ajax:
        url: $('#currency_kinds-datatable').data('source')
      dom: 
        "<'row'<'col-sm-3'l><'col-sm-7 text-center'B><'col-sm-2'f>>" +
        "<'row'<'col-sm-12'tr>>" +
        "<'row'<'col-sm-5'i><'col-sm-6 btn-sm'p>>"
      pagingType: 'full_numbers'
      columns: [
        { data: 'name' }
        { data: 'actions' }
      ]
      columnDefs: [{
        targets: -1
        orderable: false
      }]

  accounts_index: ->
    @datatable = $('#accounts-datatable').dataTable
      processing: true
      bStateSave: true
      serverSide: true
      ajax:
        url: $('#accounts-datatable').data('source')
      dom: 
        "<'row'<'col-sm-3'l><'col-sm-7 text-center'B><'col-sm-2'f>>" +
        "<'row'<'col-sm-12'tr>>" +
        "<'row'<'col-sm-5'i><'col-sm-6 btn-sm'p>>"
      pagingType: 'full_numbers'
      columns: [
        { data: 'name' }
        { data: 'country' }
        { data: 'main_account' }
        { data: 'credit_account' }
        { data: 'savings_account' }
        { data: 'currency_kind' }
        { data: 'description' }
        { data: 'actions' }
      ]
      columnDefs: [{
        targets: -1
        orderable: false
      }]

  financial_statements_index: ->
    @datatable = $('#financial_statements-datatable').dataTable
      processing: true
      bStateSave: true
      serverSide: true
      ajax:
        url: $('#financial_statements-datatable').data('source')
      dom: 
        "<'row'<'col-sm-3'l><'col-sm-7 text-center'B><'col-sm-2'f>>" +
        "<'row'<'col-sm-12'tr>>" +
        "<'row'<'col-sm-5'i><'col-sm-6 btn-sm'p>>"
      pagingType: 'full_numbers'
      columns: [
        { data: 'month' }
        { data: 'account' }
        { data: 'actions' }
      ]
      columnDefs: [{
        targets: -1
        orderable: false
      }]


  user_groups_index: ->
    @datatable = $('#user_groups-datatable').dataTable
      processing: true
      bStateSave: true
      serverSide: true
      ajax:
        url: $('#user_groups-datatable').data('source')
      dom: 
        "<'row'<'col-sm-3'l><'col-sm-7 text-center'B><'col-sm-2'f>>" +
        "<'row'<'col-sm-12'tr>>" +
        "<'row'<'col-sm-5'i><'col-sm-6 btn-sm'p>>"
      pagingType: 'full_numbers'
      columns: [
        { data: 'name' }
        { data: 'birth_date' }
        { data: 'genre' }
        { data: 'actions' }
      ]
      columnDefs: [{
        targets: -1
        orderable: false
      }]
  
    incomes_index: ->
        $(@table_id).dataTable(
            language:
                search: "Procurar:"
                info: "Registos: _START_ de _END_ de _TOTAL_ registos"
                infoFiltered: " - filtrado de _MAX_ registos"
                paginate: 
                    previous: "Anterior",
                    next: "Próximo"
            dom: "<'row toolbar'<'col-lg-9'><'col-lg-3 text-right'f>>t<'col-lg-4'i><'col-lg-4 text-right'p>"   
            search: "Pesquisar"
            info: "Mostrando 0 até 0 de 0 registros"
            ajax: $(@table_id).data('url')
        )

    expenses_index: ->
        $(@table_id).dataTable(
            language:
                search: "Procurar:"
                info: "Registos: _START_ de _END_ de _TOTAL_ registos"
                infoFiltered: " - filtrado de _MAX_ registos"
                paginate: 
                    previous: "Anterior",
                    next: "Próximo"
            dom: "<'row toolbar'<'col-lg-9'><'col-lg-3 text-right'f>>t<'col-lg-4'i><'col-lg-4 text-right'p>"   
            search: "Pesquisar"
            info: "Mostrando 0 até 0 de 0 registros"
            ajax: $(@table_id).data('url')
        )

    companies_index: ->
        $(@table_id).dataTable(
            language:
                search: "Procurar:"
                info: "Registos: _START_ de _END_ de _TOTAL_ registos"
                infoFiltered: " - filtrado de _MAX_ registos"
                paginate: 
                    previous: "Anterior",
                    next: "Próximo"
            dom: "<'row toolbar'<'col-lg-9'><'col-lg-3 text-right'f>>t<'col-lg-4'i><'col-lg-4 text-right'p>"   
            search: "Pesquisar"
            info: "Mostrando 0 até 0 de 0 registros"
            ajax: $(@table_id).data('url')
        )

    contracts_index: ->
        $(@table_id).dataTable(
            language:
                search: "Procurar:"
                info: "Registos: _START_ de _END_ de _TOTAL_ registos"
                infoFiltered: " - filtrado de _MAX_ registos"
                paginate: 
                    previous: "Anterior",
                    next: "Próximo"
            dom: "<'row toolbar'<'col-lg-9'><'col-lg-3 text-right'f>>t<'col-lg-4'i><'col-lg-4 text-right'p>"   
            search: "Pesquisar"
            info: "Mostrando 0 até 0 de 0 registros"
            ajax: $(@table_id).data('url')
        )

    payment_installments_index: ->
        $(@table_id).dataTable(
            language:
                search: "Procurar:"
                info: "Registos: _START_ de _END_ de _TOTAL_ registos"
                infoFiltered: " - filtrado de _MAX_ registos"
                paginate: 
                    previous: "Anterior",
                    next: "Próximo"
            dom: "<'row toolbar'<'col-lg-9'><'col-lg-3 text-right'f>>t<'col-lg-4'i><'col-lg-4 text-right'p>"   
            search: "Pesquisar"
            info: "Mostrando 0 até 0 de 0 registros"
            ajax: $(@table_id).data('url')
        )

  reload_data: ->
    @datatable.ajax.reload()
        