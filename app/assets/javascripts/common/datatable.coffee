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
        