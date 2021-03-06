<%@ page import="de.webmpuls.photo_album.util.MediaUtils; de.webmpuls.photo_album.Picture" %>
<html>
    <head>
        <meta name="layout" content="html5boilerplate" />
        <title>Neu-Fahrzeuge ab Lager Leingarten</title>

        <r:style>
            td, th {
                font: 11px verdana, arial, helvetica, sans-serif;
                line-height: 12px;
                padding: 5px 6px;
                text-align: left;
                vertical-align: top;
            }
        </r:style>
    </head>
    <body>

		<div class="body" style="margin: inherit">
            <h1>Neu-Fahrzeuge ab Lager Leingarten</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
				<g:if test="${!fahrzeugList.isEmpty()}">
				<table style="width: 600px;">
					<thead>
						<tr>

							%{--<g:sortableColumn property="marke" title="Marke"/>--}%
                            <th></th>

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

                            <%
                                def fahrzeugBilder = fahrzeug.bilder.isEmpty() ? [] : (fahrzeug.bilder.sort {Picture a, Picture b -> a.position <=> b.position})
                            %>
                            <td style="width: 100px;">
                                <g:if test="${fahrzeugBilder.isEmpty()}">
                                    <g:link mapping="fahrzeugAnzeigen"
                                            params="[id: fahrzeug.id, marke: fahrzeug.marke, modell: fahrzeug.modell]"><g:img
                                            dir="medias" file="icon.no_photo_available.png"
                                            alt="${fahrzeug?.marke}${fahrzeug?.modell}"
                                            style="width: 80px;"/></g:link>
                                </g:if>
                                <g:else>
                                    <g:link mapping="fahrzeugAnzeigen"
                                            params="[id: fahrzeug.id, marke: fahrzeug.marke, modell: fahrzeug.modell]"><img
                                            src="${wm_photo_album.pathToImage(picture: fahrzeugBilder?.first(), size: MediaUtils.THUMBNAIL, albumName: ((Picture) fahrzeugBilder.first())?.album?.getName())}"
                                            alt="${fahrzeug?.marke} ${fahrzeug?.modell}"
                                            style="width: 80px;"/></g:link>
                                </g:else>
                            </td>

							%{--<td>${fieldValue(bean:fahrzeug, field:'marke')}</td>--}%

							<td><g:link mapping="fahrzeugAnzeigen" params="[id: fahrzeug.id, marke: fahrzeug.marke, modell: fahrzeug.modell]">${fieldValue(bean: fahrzeug, field: 'marke')} ${fieldValue(bean: fahrzeug, field: 'modell')}</g:link></td>

							%{--<td>${fieldValue(bean:fahrzeug, field:'modell')}</td>--}%

							<td><g:link mapping="fahrzeugAnzeigen" params="[id: fahrzeug.id, marke: fahrzeug.marke, modell: fahrzeug.modell]">${fieldValue(bean: fahrzeug, field: 'farbe')}</g:link></td>

							%{--<td>${fieldValue(bean:fahrzeug, field:'farbe')}</td>--}%

							<td><g:link mapping="fahrzeugAnzeigen" params="[id: fahrzeug.id, marke: fahrzeug.marke, modell: fahrzeug.modell]">${fieldValue(bean: fahrzeug, field: 'baujahr')}</g:link></td>

							%{--<td>${fieldValue(bean:fahrzeug, field:'baujahr')}</td>--}%

							<td><g:link mapping="fahrzeugAnzeigen" params="[id: fahrzeug.id, marke: fahrzeug.marke, modell: fahrzeug.modell]">${fieldValue(bean: fahrzeug, field: 'kw')}</g:link></td>

							%{--<td>${fieldValue(bean:fahrzeug, field:'kw')}</td>--}%

							<td><g:link mapping="fahrzeugAnzeigen" params="[id: fahrzeug.id, marke: fahrzeug.marke, modell: fahrzeug.modell]">${fieldValue(bean: fahrzeug, field: 'kmStand')}</g:link></td>

							%{--<td>${fieldValue(bean:fahrzeug, field:'kmStand')}</td>--}%

							<td nowrap="nowrap"><g:link mapping="fahrzeugAnzeigen" params="[id: fahrzeug.id, marke: fahrzeug.marke, modell: fahrzeug.modell]"><g:formatNumber number="${fahrzeug.preis}" format="###,##0',--'"/></g:link></td>

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