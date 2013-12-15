<html>
    <head>
        <meta name="layout" content="html5boilerplate" />
        <title>Fahrzeugmarke ${fahrzeugMarke?.name} anzeigen</title>
    </head>
    <body>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(controller: 'fahrzeug')}">Zur Fahrzeugliste</a></li>
                <li><g:link class="list" action="list">Fahrzeugmarken-Liste</g:link></li>
                <li><g:link class="create" controller="fahrzeug" action="create">Neues Fahrzeug erzeugen</g:link></li>
            </ul>
            <br />
            <ul>
                <li><g:link class="create" action="create">Neue Fahrzeugmarke erzeugen</g:link></li>
            </ul>
        </div>
        <div class="body">
            <h1>Fahrzeugmarke ${fahrzeugMarke?.name} anzeigen</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table style="width: 620px;">
                    <tbody>

                    
                        %{--<tr class="prop">--}%
                            %{--<td valign="top" class="name">Id:</td>--}%
                            %{----}%
                            %{--<td valign="top" class="value">${fieldValue(bean:fahrzeugMarke, field:'id')}</td>--}%
                            %{----}%
                        %{--</tr>--}%
                    
                        <tr class="prop">
                            <td valign="top" class="name">Name:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:fahrzeugMarke, field:'name')}</td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <br />
            <div class="buttons">
                <g:form>
                    <input type="hidden" name="id" value="${fahrzeugMarke?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="Editieren" /></span>
                    <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Sicher?');" action="delete" value="L&ouml;schen" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
