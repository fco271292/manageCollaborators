<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'colaborador.label', default: 'Colaborador')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#list-colaborador" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
            </ul>
        </div>
        <div id="list-colaborador" class="content scaffold-list" role="main">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="input-group">
                            <span class="input-group-addon">Buscar</span>
                            <input type="text" name="searchText" id="searchText" placeholder="" class="form-control"/>
                        </div>        
                    </div>
                </div>

                <table id="table">
                    <thead>
                        <g:sortableColumn property="nombre" title="Nombre" />
                        <g:sortableColumn property="apellidoPaterno" title="Apellido Paterno" />
                        <g:sortableColumn property="apellidoMaterno" title="Apellido Materno" />
                        <g:sortableColumn property="areaNegocio" title="Area negocio" />
                    </thead>
                    <tbody>
                        <g:each in="${colaboradorList}" var="colaborador">
                            <tr>
                                <td><g:link action="show" id="${colaborador.id}">${colaborador.nombre}</g:link></td>
                                <td>${colaborador.apellidoPaterno}</td>
                                <td>${colaborador.apellidoMaterno}</td>
                                <td>${colaborador.areaNegocio.area}</td>
                            </tr>
                        </g:each>
                    </tbody>
                </table>

            </div>
            <!--<div class="pagination">
                <g:paginate total="${colaboradorCount ?: 0}" />
            </div>
            -->
        </div>

        <asset:javascript src="/bower/datatables.net/jquery.dataTables.js" />
        <asset:javascript src="/bower/datatables.net-bs/js/dataTables.bootstrap.min.js" />
        <asset:javascript src="dataTable.js"/>

        <asset:javascript src="/bower/datatables.net-buttons/dataTables.buttons.js"/>
        <asset:javascript src="/bower/datatables.net-buttons/buttons.html5.js"/>
        <asset:stylesheet href="/bower/datatables.net-buttons-bs/css/buttons.bootstrap.min.css"/>
        
        <!--<asset:javascript src="/bower/jszip/dist/jszip.js"/>
        <asset:javascript src="/bower/pdfmake/build/pdfmake.min.js"/>
        -->
    </body>
</html>