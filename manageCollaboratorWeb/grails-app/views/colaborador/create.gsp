<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'colaborador.label', default: 'Colaborador')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#create-colaborador" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
            </ul>
        </div>
        <div id="create-colaborador" class="content scaffold-create" role="main">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${this.colaborador}">
            <ul class="errors" role="alert">
                <g:eachError bean="${this.colaborador}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                </g:eachError>
            </ul>
            </g:hasErrors>
            <g:form action="save">
                <fieldset class="form">
                    <f:with bean="colaborador">
                        <f:field property="nombre" label="Nombre"/>
                        <f:field property="apellidoPaterno" label="Apellido Paterno"/>
                        <f:field property="apellidoMaterno" label="Apellido Materno"/>
                        <f:field property="areaNegocio" label="Área de Negocio">
                            <!--El nombre del select debe ser igual al nombre de la propiedad para que se pueda guardar-->
                            <g:select  name='areaNegocio' value="${id}"
                            noSelection="${['null':'']}"
                            from='${com.fco271292.AreaNegocio.list()}'
                            optionKey="id" optionValue="area"></g:select>
                        </f:field>
                    </f:with>
                </fieldset>
                <fieldset class="buttons">
                    <g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
                </fieldset>
            </g:form>
        </div>
    </body>
</html>
