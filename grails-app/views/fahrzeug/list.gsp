<html>
    <head>
        <meta name="layout" content="html5boilerplate" />
        <title>Fahrzeug-Liste</title>

        <g:javascript>
            function setAllCheckBoxes()
            {
                for (var i = 0; i < document.forms.TerminForm.length; ++i)
                {
                    if (document.forms.TerminForm.elements[i].type == 'checkbox' && document.forms.TerminForm.elements[i].checked != 'checked')
                    {
                        document.forms.TerminForm.elements[i].checked = 'checked';
                    }
                    else
                    {
                        document.forms.TerminForm.elements[i].checked = '';
                    }
                }
            }
        </g:javascript>

        <style type="text/css">

		/* ... file-local CSS props ... */

		#contentDiv {
            width: 658px;
	        * width: 705px;
		}

        #uberwrapperDiv {
	        width: 1200px;
        }

        #headerDiv {
          border: none;
        }
        </style>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(controller: 'fahrzeug')}">Zur Fahrzeugliste</a></span>
            <span class="menuButton"><g:link class="create" action="create">Neues Fahrzeug erzeugen</g:link></span>
            <span class="menuButton"><g:link class="create" controller="fahrzeugMarke" action="create">Neue Fahrzeugmarke erzeugen</g:link></span>
        </div>
        <div class="body">
            <h1>Fahrzeug-Liste</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <g:if test="${!fahrzeugList.isEmpty()}">
                <table>
                    <thead>
                        <tr style="margin-bottom: 10px;">

                            <th class="sortable">
                                &nbsp;
                            </th>

                   	        %{--<g:sortableColumn property="id" title="Id" />--}%
                        
							<g:sortableColumn property="marke" title="Marke" />

						   	<g:sortableColumn property="modell" title="Modell" />
                        
                   	        <g:sortableColumn property="farbe" title="Farbe" />
                        
                   	        <g:sortableColumn property="baujahr" title="Baujahr" />
                        
                   	        <g:sortableColumn property="kw" title="Kw" />
                        
                   	        <g:sortableColumn property="kmStand" title="Km Stand" />
                        
                   	        <g:sortableColumn property="preis" title="Preis" />
                        
                   	        %{--<g:sortableColumn property="gebraucht" title="Gebraucht" />--}%
                        
                   	        %{--<g:sortableColumn property="neu" title="Neu" />--}%
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:form action="deleteSelected" method="post" name="FahrzeugForm">
                    <g:each in="${fahrzeugList}" status="i" var="fahrzeug">
						<tr>
							<td colspan="8">

								<br/>
								<table border="1">

									<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

										<td><g:checkBox name="${fahrzeug.id.toString()}"/></td>

										%{--<td><g:link action="anzeigen" id="${fahrzeug.id}">${fieldValue(bean:fahrzeug, field:'id')}</g:link></td>--}%

										%{--<td>${fieldValue(bean:fahrzeug, field:'id')}</td>--}%

										<td><g:link action="anzeigen" id="${fahrzeug.id}">${fieldValue(bean: fahrzeug, field: 'marke')}</g:link></td>

										%{--<td>${fieldValue(bean:fahrzeug, field:'marke')}</td>--}%

										<td><g:link action="anzeigen" id="${fahrzeug.id}">${fieldValue(bean: fahrzeug, field: 'modell')}</g:link></td>

										%{--<td>${fieldValue(bean:fahrzeug, field:'modell')}</td>--}%

										<td><g:link action="anzeigen" id="${fahrzeug.id}">${fieldValue(bean: fahrzeug, field: 'farbe')}</g:link></td>

										%{--<td>${fieldValue(bean:fahrzeug, field:'farbe')}</td>--}%

										<td><g:link action="anzeigen" id="${fahrzeug.id}">${fieldValue(bean: fahrzeug, field: 'baujahr')}</g:link></td>

										%{--<td>${fieldValue(bean:fahrzeug, field:'baujahr')}</td>--}%

										<td><g:link action="anzeigen" id="${fahrzeug.id}">${fieldValue(bean: fahrzeug, field: 'kw')}</g:link></td>

										%{--<td>${fieldValue(bean:fahrzeug, field:'kw')}</td>--}%

										<td><g:link action="anzeigen" id="${fahrzeug.id}">${fieldValue(bean: fahrzeug, field: 'kmStand')}</g:link></td>

										%{--<td>${fieldValue(bean:fahrzeug, field:'kmStand')}</td>--}%

										<td><g:link action="anzeigen" id="${fahrzeug.id}"><g:formatNumber number="${fahrzeug.preis}" format="###,##0',--'"/></g:link></td>
										%{--<td><g:link action="anzeigen" id="${fahrzeug.id}"><g:formatNumber number="${fahrzeug.preis}" format="####0.##''" />,--</g:link></td>--}%

										%{--<td>${fieldValue(bean:fahrzeug, field:'preis')}</td>--}%
									</tr>
									<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
										<td colspan="2"><g:link action="anzeigen" id="${fahrzeug.id}">Gebraucht: ${fieldValue(bean: fahrzeug, field: 'gebraucht') == 'true' ? 'ja' : 'nein'}</g:link></td>

										%{--<td>${fieldValue(bean:fahrzeug, field:'gebraucht')}</td>--}%

										<td><g:link action="anzeigen" id="${fahrzeug.id}">Neu: ${fieldValue(bean: fahrzeug, field: 'neu') == 'true' ? 'ja' : 'nein'}</g:link></td>

										%{--<td>${fieldValue(bean:fahrzeug, field:'neu')}</td>--}%

										<td colspan="2"><g:link action="anzeigen" id="${fahrzeug.id}">Kombiniert: ${fieldValue(bean: fahrzeug, field: 'kombiniert')}l/100</g:link></td>

										%{--<td>${fieldValue(bean:fahrzeugInstance, field:'kombiniert')}</td>--}%

										<td><g:link action="anzeigen" id="${fahrzeug.id}">Innerorts: ${fieldValue(bean: fahrzeug, field: 'innerorts')}l/100</g:link></td>

										%{--<td>${fieldValue(bean:fahrzeugInstance, field:'innerorts')}</td>--}%

										<td><g:link action="anzeigen" id="${fahrzeug.id}">Ausserorts: ${fieldValue(bean: fahrzeug, field: 'ausserorts')}l/100</g:link></td>

										%{--<td>${fieldValue(bean:fahrzeugInstance, field:'ausserorts')}</td>--}%

										<td><g:link action="anzeigen" id="${fahrzeug.id}">CO2: ${fieldValue(bean: fahrzeug, field: 'co2')}g/Km</g:link></td>

										%{--<td>${fieldValue(bean:fahrzeugInstance, field:'co2')}</td>--}%

									</tr>

								</table>

							</td>
						</tr>
                    </g:each>
					<g:if test="${!fahrzeugList.isEmpty()}">
						<tr>
                            <td colspan="2" nowrap="nowrap">
                                Markierte:&nbsp;&nbsp;&nbsp;<g:submitButton name="submit" value="Loeschen" />
                            </td>
                            <!--<td>
                                Alle
                            </td>-->
                            %{--<td>--}%
                                %{--<g:submitButton name="submit" value="Loeschen" />--}%
                            %{--</td>--}%
                        </tr>
					</g:if>
                    </g:form>
                    </tbody>
                </table>
                </g:if>
            </div>
            %{--<div class="paginateButtons">
                <g:paginate total="${Fahrzeug.count()}" />
            </div>--}%
        </div>
    </body>
</html>
