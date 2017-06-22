<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'areaNegocio.label', default: 'AreaNegocio')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#list-areaNegocio" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
            </ul>
        </div>
        <div id="list-areaNegocio" class="content scaffold-list" role="main">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            
            <table>
                <thead>
                    <g:sortableColumn property="area" title="Area" />
                    <g:sortableColumn property="colaboradores" title="Colaboradores" />
                </thead>
                <tbody>
                    <g:each in="${areaNegocioList}" var="areaNegocio">
                        <tr>
                            <td><g:link action="show" id="${areaNegocio.id}">${areaNegocio.area}</g:link></td>
                            <td>
                                <g:each in="${areaNegocio.colaboradores}" var="colaboradores">
                                    <g:link controller="colaborador" action="show" id="${colaboradores.id}">
                                        ${colaboradores.nombre} ${colaboradores.apellidoPaterno} ${colaboradores.apellidoMaterno}
                                        <br/>
                                    </g:link>
                                </g:each>
                            </td>
                        </tr>
                    </g:each>    
                </tbody>
            </table>
            <div class="pagination">
                <g:paginate total="${areaNegocioCount ?: 0}" />
            </div>
        </div>
    </body>
</html>