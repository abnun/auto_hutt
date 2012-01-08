<html>
    <head>
        <meta name="layout" content="html5boilerplate" />
        <title>Neue Fahrzeugmarke erzeugen</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(controller: 'fahrzeug')}">Zur Fahrzeugliste</a></span>
            <span class="menuButton"><g:link class="list" action="list">Fahrzeugmarken-Liste</g:link></span>
        </div>
        <div class="body">
            <h1>Neue Fahrzeugmarke erzeugen</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${fahrzeugMarke}">
            <div class="errors">
                <g:renderErrors bean="${fahrzeugMarke}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
                <div class="dialog">
                    <table style="width: 620px;">
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="name">Name:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:fahrzeugMarke,field:'name','errors')}">
                                    <input type="text" id="name" name="name" value="${fieldValue(bean:fahrzeugMarke,field:'name')}"/>
                                </td>
                            </tr> 
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><input class="save" type="submit" action="create" value="Neu erzeugen" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
