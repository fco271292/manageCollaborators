$.noConflict()
jQuery(document).ready(function($) {
    var table = $('#table').DataTable({
        
        "paging": true,
        "lengthMenu": [[5, 10, 50, -1], [5, 10, 50, "Todos"]],
        "language":{
            "lengthMenu": "Mostrar _MENU_ ",
            "info": "Pagina _PAGE_ - _PAGES_",
            "search": "Buscar",
            "paginate": {
                "first":      "Primero",
                "last":       "Ultimo",
                "next":       ">>",
                "previous":   "<<"
            },
            "infoFiltered":   "(Total de registros _MAX_ )",
            "zeroRecords":    "No hay registros",
            "infoEmpty":      "No hay registros"
        },
        "pagingType": "full_numbers",
        "info": false,
        "searching": true,
        "lengthChange": false,
        "dom":  "<'row'<'col-lg-12'Btr>>" +
                "<'row'<'col-lg-4'i><'col-lg-8'p>>"
                /*  Iniciales para mostrar elementos del plugin
                    t: Table
                    r: Processing display element
                    i: Table information summary
                    p: Pagination control
                */
        ,buttons: [
            //'csv', 'excel', 'pdf'
            {
                extend: 'pdfHtml5',
                text: 'PDF',
                exportOptions: {
                    modifier: {
                        page: 'current'
                    }
                },
                header: true,
                title: `Colaboradores_${new Date().toJSON()}`
            },
            {
                extend: 'csv',
                text: 'Excel',
                exportOptions: {
                    modifier: {
                        page: 'current'
                    }
                },
                header: true,
                title: `Colaboradores_${new Date().toJSON()}`
            }
            ,'excelHtml5'
        ]
        
    });

    //Permite buscar desde una entrada alterna
    $('#searchText').on( 'keyup', function () {
        table.search(this.value).draw();
    } );
    
} );