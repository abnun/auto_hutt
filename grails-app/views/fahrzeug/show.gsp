<html>
    <head>
        <meta name="layout" content="html5boilerplate" />
        <title>Fahrzeug ${fahrzeug?.marke} ${fahrzeug?.modell} anzeigen</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(controller: 'fahrzeug')}">Zur Fahrzeugliste</a></span>
            <span class="menuButton"><g:link class="list" action="list">Fahrzeug-Liste</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">Neues Fahrzeug erzeugen</g:link></span>
        </div>
        <div class="body">
            <h1>Fahrzeug ${fahrzeug?.marke} ${fahrzeug?.modell} anzeigen</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>

                    
                        <tr class="prop">
                            <td valign="top" class="name">Id:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:fahrzeug, field:'id')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Marke:</td>
                            
                            <td valign="top" class="value"><g:link controller="fahrzeugMarke" action="show" id="${fahrzeug?.marke?.id}">${fahrzeug?.marke?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Modell:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:fahrzeug, field:'modell')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Farbe:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:fahrzeug, field:'farbe')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Baujahr:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:fahrzeug, field:'baujahr')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Kw:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:fahrzeug, field:'kw')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Km Stand:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:fahrzeug, field:'kmStand')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Preis:</td>
                            
                            <td valign="top" class="value"><g:formatNumber number="${fahrzeug.preis}" format="###,##0',--'" /></td>

						</tr>

                        <tr class="prop">
                            <td valign="top" class="name">Kombiniert:</td>

                            <td valign="top" class="value">${fieldValue(bean:fahrzeugInstance, field:'kombiniert')}</td>

                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name">Innerorts:</td>

                            <td valign="top" class="value">${fieldValue(bean:fahrzeugInstance, field:'innerorts')}</td>

                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name">Ausserorts:</td>

                            <td valign="top" class="value">${fieldValue(bean:fahrzeugInstance, field:'ausserorts')}</td>

                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name">Co2:</td>

                            <td valign="top" class="value">${fieldValue(bean:fahrzeugInstance, field:'co2')}</td>

                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name">Gebraucht:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:fahrzeug, field:'gebraucht')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Neu:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:fahrzeug, field:'neu')}</td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <input type="hidden" name="id" value="${fahrzeug?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="Editieren" /></span>
                    <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Sicher?');" action="delete" value="L&ouml;schen" /></span>
                </g:form>
            </div>

			<br/>
            <g:if test="${!fahrzeug.ausstattungen.isEmpty()}">
            <h2>
                Ausstattung
            </h2>
                <ul class="square">
                    <g:each var="ausstattung" in="${fahrzeug.ausstattungen}">
                        <li>
                            ${ausstattung}
                        </li>
                    </g:each>
                </ul>
            </g:if>

            <br/>
            <g:if test="${!fahrzeug.bilder.isEmpty()}">
            <h2>
                Bild
            </h2>
                <g:each var="bild" in="${fahrzeug.bilder}">
                    <img src="${wm_photo_album.pathToImage(picture: bild)}" alt="${fahrzeug?.marke} ${fahrzeug?.modell}"/>
                </g:each>
            </g:if>
		</div>
    </body>
</html>
