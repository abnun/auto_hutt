<%@ page import="de.webmpuls.photo_album.util.MediaUtils; de.webmpuls.photo_album.Picture;" %>
<html>
<head>
	<meta name="layout" content="html5boilerplate" />
	<title>${fahrzeug.gebraucht ? 'Gebrauchtfahrzeug: ' : 'Neufahrzeug: '}${fahrzeug?.marke} ${fahrzeug?.modell}</title>

	<r:style>

		/* ... file-local CSS props ... */

        th:hover, tr:hover {
            background: none;
        }

        th:hover {
            background-color: #efefef;
	        background-image: -moz-linear-gradient(top, #ffffff, #eaeaea);
	        background-image: -webkit-gradient(linear, left top, left bottom, color-stop(0, #ffffff), color-stop(1, #eaeaea));
	        filter: progid:DXImageTransform.Microsoft.gradient(startColorStr = '#ffffff', EndColorStr = '#eaeaea');
	        -ms-filter: "progid:DXImageTransform.Microsoft.gradient(startColorStr='#ffffff', EndColorStr='#eaeaea')";
        }

        tr>td:first-child, tr>th:first-child {
            padding-left: 0em;
            padding-right: 0.5em;
        }

        tr>td:last-child, tr>th:last-child {
            padding-left: 0.5em;
            padding-right: 0em;
        }
	</r:style>

	<r:require module="photo-album-gallery" />
	<r:script>
		hs.showCredits = false;
        hs.graphicsDir = '${resource(dir: '/highslide/graphics/', plugin: 'photo-album')}'
	</r:script>
</head>

<body>
<div class="body" style="margin: inherit;">
<h1>${fahrzeug.gebraucht ? 'Gebrauchtfahrzeug: ' : 'Neufahrzeug: '}${fahrzeug?.marke} ${fahrzeug?.modell}</h1>
<g:if test="${flash.message}">
	<div class="message">${flash.message}</div>
</g:if>
<g:if test="${flash.error}">
    <div class="errors" role="status">${flash.error}</div>
</g:if>
<div>
<%
	def fahrzeugBilder = []
%>
<table cellpadding="0" cellspacing="0" style="border: none; width: 600px;">
    <colgroup>
        <col width="400">
        <col width="200">
    </colgroup>
	<tr>
		<g:if test="${!fahrzeug.bilder?.isEmpty()}">
			<%
				fahrzeugBilder = fahrzeug.bilder.sort {Picture a, Picture b -> a.position <=> b.position}
			%>
			<td>
				<g:each status="i" var="bild" in="${fahrzeugBilder}">
					<g:if test="${i == 0}">
						<a href="${wm_photo_album.pathToImage(picture: bild, size: MediaUtils.NORMAL, albumName: ((Picture) bild).album.getName())}" class="highslide"
						   onclick="return hs.expand(this, {wrapperClassName: 'highslide-no-border', dimmingOpacity: 0.75, align: 'center'})">
							<img style="width: 380px;" src="${wm_photo_album.pathToImage(picture: bild, size: MediaUtils.BIG, albumName: ((Picture) bild).album.getName())}" alt="${fahrzeug?.marke} ${fahrzeug?.modell}"
								 title="Klicken Sie hier, um eine vergr&ouml;&szlig;erte Ansicht des Bildes zu bekommen" />
						</a>

						<div id="closebutton" class="highslide-overlay closebutton" onclick="return hs.close(this)" title="Schließen"></div>
					</g:if>
				</g:each>
				<br/>
			</td>
		</g:if>
		<g:else>
			<td>
				<img style="width: 380px;" src="${request.getContextPath()}${grailsApplication.config.media.dir}${grailsApplication.config.no.pic.available}" alt="Kein Bild verf&uuml;gbar"
					 title="Kein Bild verf&uuml;gbar" />
			</td>
		</g:else>
		<td style="width: 200px;">
			<table cellpadding="0" cellspacing="0" style="border: none; border-collapse: collapse;">
                <colgroup>
                    <col width="100">
                    <col width="100">
                </colgroup>
				<tr style="border: 1px solid white; border-top: none;">
					<th colspan="2" style="border: 1px solid white; border-top: none;">
						Fahrzeugdaten:
					</th>
				</tr>
				<tr style="border: 1px solid white;">
					<td style="border: 1px solid white;">
						<b>Marke</b>
					</td>
					<td style="border: 1px solid white;">
						${fahrzeug.marke}
					</td>
				</tr>

				<tr style="border: 1px solid white;">
					<td style="border: 1px solid white;">
						<b>Modell</b>
					</td>
					<td style="border: 1px solid white;">
						${fahrzeug.modell}
					</td>
				</tr>

				<tr style="border: 1px solid white;">
					<td style="border: 1px solid white;">
						<b>Farbe</b>
					</td>
					<td style="border: 1px solid white;">
						<%
							String farbe = fahrzeug.farbe
							if (farbe)
							{
								if (fahrzeug.farbe.contains("-metallic"))
								{
									//nuescht machen hier, ist erlaubt
								}
								else if (fahrzeug.farbe.contains("metallic"))
								{
									farbe = farbe.replaceFirst("metallic", "-metallic")
								}
							}
						%>
						${farbe}
					</td>
				</tr>

				<tr style="border: 1px solid white;">
					<td style="border: 1px solid white;">
						<b>Baujahr</b>
					</td>
					<td style="border: 1px solid white;">
						<%
							String bauJahr = fahrzeug.baujahr
							if (bauJahr)
							{
								if (bauJahr.contains('.'))
								{
									bauJahr = bauJahr.replace('.', '/')
								}
							}
						%>
						${bauJahr}
					</td>
				</tr>

				<tr style="border: 1px solid white;">
					<td style="border: 1px solid white;">
						<b>KW</b>
					</td>
					<td style="border: 1px solid white;">
						${fahrzeug.kw}
					</td>
				</tr>

				<tr style="border: 1px solid white;">
					<td style="border: 1px solid white;" nowrap="nowrap">
						<b>Km-Stand</b>
					</td>
					<td style="border: 1px solid white;">
						${fahrzeug.kmStand}
					</td>
				</tr>

				<tr style="border: 1px solid white;">
					<td style="border: 1px solid white;" nowrap="nowrap">
						<b>Preis&nbsp;(&euro;)</b>
					</td>
					<td style="border: 1px solid white;">
						<b style="font-size: larger; font-weight: bold;">
							<g:formatNumber number="${fahrzeug.preis}" format="#,###,##0',--'" locale="${Locale.GERMAN}" />
						</b>
					</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td>
			<table cellpadding="0" cellspacing="0" style="border: 1px solid white; border-collapse: collapse; width: 380px;">
				<g:if test="${fahrzeug.ausstattung != null}">
					<%
						def fahrzeugAusstattungen = ((String) fahrzeug.ausstattung).tokenize(';')
						int size = fahrzeugAusstattungen.size()
						int halfSize = size / 2
					%>
					<tr style="border: 1px solid white;">
						<th>
							%{--<th colspan="14">--}%
							Fahrzeugausstattung:
						</th>
					</tr>
					<tr style="border: 1px solid white;">
						<td>
							%{--<td colspan="7">--}%
							<ul style="list-style-type:square;">
								<g:each status="i" var="ausstattung" in="${fahrzeugAusstattungen}">
									<li>
										${ausstattung.trim()}
									</li>
								%{--<g:if test="${i / halfSize == 1}">
																	 </ul>
																	</td>
																	<td colspan="7">
																	 <ul style="list-style-type:square;">
																 </g:if>--}%
								</g:each>
							</ul>
						</td>
					</tr>
				</g:if>
			</table>
		</td>
		<td style="width: 200px;">
            <g:if test="${fahrzeug.bilder?.size() > 1}">
                <table cellpadding="0" cellspacing="0" style="border: 1px solid white; border-collapse: collapse;">
                    <tr>
                        <th colspan="2" style="border: 1px solid white; border-top: none;" nowrap="nowrap">
                            Weitere Bilder:
                        </th>
                    </tr>
                    <tr>
                        <g:each status="i" var="bild" in="${fahrzeugBilder}">
                            <g:if test="${i > 0 && i <= 3}">
                                <td style="padding-top: 10px; padding-left: 0.6em;">
                                    <a href="${wm_photo_album.pathToImage(picture: bild, size: MediaUtils.BIG, albumName: ((Picture) bild).album.getName())}"
                                       class="highslide"
                                       onclick="return hs.expand(this, {wrapperClassName: 'highslide-no-border', dimmingOpacity: 0.75, align: 'center'})">
                                        <img src="${wm_photo_album.pathToImage(picture: bild, size: MediaUtils.THUMBNAIL, albumName: ((Picture) bild).album.getName())}"
                                             alt="${fahrzeug?.marke} ${fahrzeug?.modell}"
                                             title="Klicken Sie hier, um eine vergr&ouml;&szlig;erte Ansicht des Bildes zu bekommen"
                                             style="width: 80px;"/>
                                    </a>

                                    <div id="closebutton" class="highslide-overlay closebutton"
                                         onclick="return hs.close(this)" title="Schließen"></div>
                                </td>
                            </g:if>
                        </g:each>
                    </tr>
                </table>
                <br/>
            </g:if>
			<table cellpadding="0" cellspacing="0" style="border: none; border-collapse: collapse;">
				<colgroup>
                    <col width="100">
                    <col width="100">
				</colgroup>
                <tr style="border: 1px solid white;">
					<th colspan="2" style="border: 1px solid white; border-top: none;" nowrap="nowrap">
						Emissions-Werte:
					</th>
				</tr>
				<tr>
					<td style="border: 1px solid white;">
						<b>Kombiniert</b>
					</td>
					<td style="border: 1px solid white;">
						${fahrzeug.kombiniert}l/100km
					</td>
				</tr>
				<tr>
					<td style="border: 1px solid white;">
						<b>Innerorts</b>
					</td>
					<td style="border: 1px solid white;">
						${fahrzeug.innerorts}l/100km
					</td>
				</tr>
				<tr>
					<td style="border: 1px solid white;">
						<b>Ausserorts</b>
					</td>
					<td style="border: 1px solid white;">
						${fahrzeug.ausserorts}l/100km
					</td>
				</tr>
				<tr>
					<td style="border: 1px solid white;">
						<b>CO2</b>
					</td>
					<td style="border: 1px solid white;">
						${fahrzeug.co2}g/km
					</td>
				</tr>
                <g:if test="${fahrzeug.fahrzeugmasse && fahrzeug.fahrzeugmasse != '0'}">
                    <tr>
                        <td style="border: 1px solid white;">
                            <b>Fahrzeugmasse</b>
                        </td>
                        <td style="border: 1px solid white;">
                            ${fahrzeug.fahrzeugmasse}kg
                        </td>
                    </tr>
                </g:if>
                <g:if test="${fahrzeug.jahressteuer && fahrzeug.jahressteuer != '0'}">
                    <tr>
                        <td style="border: 1px solid white;">
                            <b>Jahressteuer&nbsp;(&euro;)</b>
                        </td>
                        <td style="border: 1px solid white;">
                            <g:formatNumber number="${fahrzeug.jahressteuer}" format="0.00" locale="${Locale.GERMAN}"/>
                        </td>
                    </tr>
                </g:if>
                <g:if test="${fahrzeug.energietraegerkosten && fahrzeug.energietraegerkosten != '0'}">
                    <tr>
                        <td style="border: 1px solid white;">
                            <b>Energietr&auml;ger-kosten <span
                                    style="font-size: x-small;">bei einer Laufleistung von 20.000 km</span>&nbsp;(&euro;)
                            </b>
                        </td>
                        <td style="border: 1px solid white;">
                            <g:formatNumber number="${fahrzeug.energietraegerkosten}" format="0.00"
                                            locale="${Locale.GERMAN}"/>
                        </td>
                    </tr>
                </g:if>
			</table>
			<br />
			<g:if test="${['aplus', 'a', 'b', 'c', 'd', 'e', 'f', 'g'].contains(fahrzeug?.co2Effizienz)}">
				<table cellpadding="0" cellspacing="0" style="border: none; border-collapse: collapse;">
					<tr style="border: 1px solid white;">
						<th colspan="2" style="border: 1px solid white; border-top: none;" nowrap="nowrap">
							CO2-Effizienz:
						</th>
					</tr>
					<tr>
						<td style="border: 1px solid white;" colspan="2">
							<img src="${resource(dir: '/medias/fahrzeug', file: 'co2effizienz_' + fahrzeug.co2Effizienz + '.png')}" />
						</td>
					</tr>
				</table>
				<br />
			</g:if>
			<g:if test="${session.user}">
				<br />

				<div style="text-align: left;">
					<g:link controller="fahrzeug" action="edit" id="${fahrzeug.id}">Stammdaten bearbeiten</g:link>
					<br />
					<br />

					<g:link controller="fahrzeug" action="uploadPictures" id="${fahrzeug.id}">Bilder bearbeiten</g:link>
					<br />
					<br />

					<g:link controller="fahrzeug" action="list">Komplette Fahrzeugliste anzeigen</g:link>
				</div>
			</g:if>
		%{--<g:if test="${fahrzeug.bilder?.size() > 1}">
			   <table cellpadding="0" cellspacing="0" style="border: 0px; margin-top: 5px;">
				   <tr>
					   <th colspan="2" style="border: 1px solid white; border-top: none;" nowrap="nowrap">
						   Weitere Bilder:
					   </th>
				   </tr>
				   <tr>
					   <g:each status="i" var="bild" in="${fahrzeugBilder}">
						   <g:if test="${i > 0 && i <= 3}">
							   <td style="padding: 3px 0px;;">
								   <a href="${wm_photo_album.pathToImage(picture: bild, size: MediaUtils.BIG, albumName: ((Picture) bild).album.getName())}" class="highslide"
									  onclick="return hs.expand(this, {wrapperClassName: 'highslide-no-border', dimmingOpacity: 0.75, align: 'center'})">
									   <img src="${wm_photo_album.pathToImage(picture: bild, size: MediaUtils.THUMBNAIL, albumName: ((Picture) bild).album.getName())}" alt="${fahrzeug?.marke} ${fahrzeug?.modell}"
											title="Klicken Sie hier, um eine vergr&ouml;&szlig;erte Ansicht des Bildes zu bekommen" />
								   </a>
								   <!--<div class="highslide-caption"></div>-->
								   <div id="closebutton" class="highslide-overlay closebutton" onclick="return hs.close(this)" title="Schließen"></div>
								   --}%%{--<img src="${request.getContextPath()}${bild.dateiName}" alt="${fahrzeug?.marke} ${fahrzeug?.modell}"/>--}%%{--
								   <br />
								   <br />
							   </td>
						   </g:if>

					   </g:each>
				   </tr>
			   </table>
		   </g:if>--}%
		</td>
	</tr>
</table>

%{--<table cellpadding="0" cellspacing="0" style="border: 1px solid white; border-collapse: collapse; width: 600px;">
	<g:if test="${fahrzeug.ausstattung != null}">
		<%
			def fahrzeugAusstattungen = ((String) fahrzeug.ausstattung).tokenize(';')
			int size = fahrzeugAusstattungen.size()
			int halfSize = size / 2
		%>
		<tr style="border: 1px solid white;">
			<th colspan="14">
				Fahrzeugausstattung
			</th>
		</tr>
		<tr style="border: 1px solid white;">
		<td colspan="7">
		<ul style="list-style-type:square;">
			<g:each status="i" var="ausstattung" in="${fahrzeugAusstattungen}">
				<li>
					${ausstattung.trim()}
				</li>
				<g:if test="${i / halfSize == 1}">
					</ul>
								   </td>
								   <td colspan="7">
								   <ul style="list-style-type:square;">
				</g:if>
			</g:each>
		</ul>
		</td>
		</tr>
	</g:if>
</table>--}%
</div>

</div>
</body>
</html>