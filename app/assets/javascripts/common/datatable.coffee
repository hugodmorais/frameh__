class window.FramehDatatable
    constructor: (table_id) ->
        @id = table_id
        @table_id = '#' + table_id
        @datatable = null

    user_groups_index: ->
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
    
    users_index: ->
        $('#users-datatable').dataTable
            processing: true
            serverSide: true
            "bSort": true
            # "dom": '<"pull-right" f><t>'
            dom: 
                "<'row'<'col-sm-3'l><'col-sm-6 text-center'B><'col-sm-3'f>>" +
                "<'row'<'col-sm-12'tr>>" +
                "<'row'<'col-sm-5'i><'col-sm-7 btn-sm'p>>"
            ajax:
                url: $('#users-datatable').data('source')
            pagingType: 'full_numbers'
            columns: [
                {data: 'name'}
                {data: 'email'}
                {data: 'admin'}
                {data: 'actions'}
            ]
            columnDefs: [{
                targets: -1
                orderable: false
            }]


    
    annual_managements_index: ->
        $(@table_id).dataTable(
            language:
                search: "Procurar:"
                info: "Registos: _START_ de _END_ de _TOTAL_ registos"
                infoFiltered: " - filtrado de _MAX_ registos"
                paginate: 
                    previous: "Anterior",
                    next: "Próximo"
            dom: "<'row toolbar'<'col-lg-10'><'col-lg-2 text-right'f>>t<'col-lg-4'i><'col-lg-4 text-right'p>"   
            search: "Pesquisar"
            info: "Mostrando 0 até 0 de 0 registros"
            ajax: $(@table_id).data('url')
        )
        
    income_categories_index: ->
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

     expense_categories_index: ->
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

    contract_statuses_index: ->
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
        
    currency_kinds_index: ->
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

    accounts_index: ->
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

    financial_statements_index: ->
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
        