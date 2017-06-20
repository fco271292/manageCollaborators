<!doctype html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Administrador de colaboradores</title>

    <!--<asset:link rel="icon" href="favicon.ico" type="image/x-ico" />-->
</head>
<body>
    <content tag="nav">
        
        <li class="dropdown">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Opciones <span class="caret"></span></a>
            <ul class="dropdown-menu">
                <li><a href="#">Disponibles: ${grailsApplication.controllerClasses.size()}</a></li>
            </ul>
        </li>
    </content>
    <!--
    <div class="svg" role="presentation">
        <div class="grails-logo-container">
            <asset:image src="grails-cupsonly-logo-white.svg" class="grails-logo"/>
        </div>
    </div>
    -->

    <div id="content" role="main">
        <section class="row colset-2-its">
            <h1></h1>

            <div id="controllers" role="navigation">
                <h2>Menu</h2>
                <ul>
                    <g:each var="c" in="${grailsApplication.controllerClasses.sort { it.fullName } }">
                        <li class="controller">
                            <g:link controller="${c.logicalPropertyName}">${c.name}</g:link>
                        </li>
                    </g:each>
                </ul>
            </div>
        </section>
    </div>

</body>
</html>
