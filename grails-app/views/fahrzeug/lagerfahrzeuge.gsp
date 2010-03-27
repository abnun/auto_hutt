<html>
    <head>
        <meta name="layout" content="main" />
        <title>Neu-Fahrzeuge</title>
    </head>
    <body>

		<div class="body">
            <h1>Neu-Fahrzeuge</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
				<g:if test="${!fahrzeugList.isEmpty()}">
				<table style="width: 620px;">
					<thead>
						<tr>

							<g:sortableColumn property="marke" title="Marke"/>

							<g:sortableColumn property="modell" title="Modell"/>

							<g:sortableColumn property="farbe" title="Farbe"/>

							<g:sortableColumn property="baujahr" title="Baujahr"/>

							<g:sortableColumn property="kw" title="Kw"/>

							<g:sortableColumn property="kmStand" title="Km-Stand" nowrap="nowrap" />

							<g:sortableColumn property="preis" title="Preis"/>

						</tr>
					</thead>
					<tbody>
					<g:each in="${fahrzeugList}" status="i" var="fahrzeug">
						<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

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

							<td nowrap="nowrap"><g:link action="anzeigen" id="${fahrzeug.id}"><g:formatNumber number="${fahrzeug.preis}" format="###,##0',--'"/></g:link></td>

						</tr>
					</g:each>
					</tbody>
				</table>
				</g:if>
				<g:else>
					<p>
						Derzeit f&uuml;hren wir keine Neufahrzeuge f&uuml;r den Standort Leingarten auf unserer Internetseite. Kontaktieren Sie uns dennoch unter Tel: 07131 / 90212-0, um tagesaktuelle Angebote zu erfahren, die noch nicht auf der Seite erscheinen.
					</p>
				</g:else>
            </div>
            %{--<div class="paginateButtons">
                <g:paginate total="${Fahrzeug.count()}" />
            </div>--}%
        </div>
    </body>
</html>