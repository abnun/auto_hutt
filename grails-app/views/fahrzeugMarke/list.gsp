<html>
    <head>
        <meta name="layout" content="html5boilerplate" />
        <title>Fahrzeugmarken-Liste</title>
    </head>
    <body>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(controller: 'fahrzeug')}">Zur Fahrzeugliste</a></li>
                <li><g:link class="create" action="create">Neue Fahrzeugmarke erzeugen</g:link></li>
            </ul>
        </div>
        <div class="body">
            <h1>Fahrzeugmarken-Liste</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table style="width: 620px;">
                    <thead>
                        <tr>
                        
                   	        %{--<g:sortableColumn property="id" title="Id" />--}%
                        
                   	        <g:sortableColumn property="name" title="Name" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${fahrzeugMarkeList}" status="i" var="fahrzeugMarke">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            %{--<td><g:link action="show" id="${fahrzeugMarke.id}">${fieldValue(bean:fahrzeugMarke, field:'id')}</g:link></td>--}%
                        
                            %{--<td>${fieldValue(bean:fahrzeugMarke, field:'id')}</td>--}%
                        
                            <td><g:link action="show" id="${fahrzeugMarke.id}">${fieldValue(bean:fahrzeugMarke, field:'name')}</g:link></td>
                        
                            %{--<td>${fieldValue(bean:fahrzeugMarke, field:'name')}</td>--}%
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            %{--<div class="paginateButtons">--}%
                %{--<g:paginate total="${FahrzeugMarke.count()}" />--}%
            %{--</div>--}%
        </div>
    </body>
</html>
