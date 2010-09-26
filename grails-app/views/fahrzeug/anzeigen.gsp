<%@ page import="de.webmpuls.photo_album.util.MediaUtils; de.webmpuls.photo_album.Picture;" %>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>${fahrzeug.gebraucht ? 'Gebrauchtfahrzeug: ' : 'Neufahrzeug: '}${fahrzeug?.marke} ${fahrzeug?.modell} anzeigen</title>

    <style type="text/css">

	/* ... file-local CSS props ... */

	#naviDiv {
		height: 940px;
		*height: 938px;
	}

	#contentDiv {
		height: 943px;
		* height : 938px;
	}
	</style>

	<script type="text/javascript" src="${resource(dir: 'js/jquery/', file: 'jquery-1.4.2-min.js', plugin: 'jquery')}"></script>
	<wm_photo_album:gallery_resources noGallery="true" />
</head>
<body>
<div class="body">
    <h1>${fahrzeug.gebraucht ? 'Gebrauchtfahrzeug: ' : 'Neufahrzeug: '}${fahrzeug?.marke} ${fahrzeug?.modell}</h1>
    <g:if test="${flash.message}">
        <div class="message">${flash.message}</div>
    </g:if>
    <div>
      <%
        def fahrzeugBilder = []
      %>
      <table cellpadding="0" cellspacing="0" style="border: none; width: 610px;">
        <tr>
			<g:if test="${!fahrzeug.bilder?.isEmpty()}">
				<%
					fahrzeugBilder = fahrzeug.bilder.sort {Picture a, Picture b -> a.position <=> b.position}
				%>
				<td>
				<g:each status="i" var="bild" in="${fahrzeugBilder}">
					<g:if test="${i == 0}">
						<a href="${wm_photo_album.pathToImage(picture: bild, size: MediaUtils.NORMAL, albumName: ((Picture)bild).album.getName())}" class="highslide"
								onclick="return hs.expand(this, {wrapperClassName: 'highslide-no-border', dimmingOpacity: 0.75, align: 'center'})">
							<img style="width: 400px;" src="${wm_photo_album.pathToImage(picture: bild, size: MediaUtils.BIG, albumName: ((Picture)bild).album.getName())}" alt="${fahrzeug?.marke} ${fahrzeug?.modell}"
									title="Klicken Sie hier, um eine vergr&ouml;&szlig;erte Ansicht des Bildes zu bekommen"/></a>
						<div id="closebutton" class="highslide-overlay closebutton" onclick="return hs.close(this)" title="Schließen"></div>
					</g:if>
				</g:each>
			%{--<img src="${request.getContextPath()}${grailsApplication.config.media.dir}${bild.dateiNameBig}" alt="${fahrzeug?.marke} ${fahrzeug?.modell}"/>--}%
				</td>
			</g:if>
			<g:else>
				<td>
					<img src="${request.getContextPath()}${grailsApplication.config.media.dir}${grailsApplication.config.no.pic.available}" alt="Kein Bild verf&uuml;gbar"
							title="Kein Bild verf&uuml;gbar"/>
				</td>
			</g:else>
          <td style="vertical-align: top; text-align: center;">
            <table cellpadding="0" cellspacing="0" style="border: none; border-collapse: collapse;">
              <tr style="border: 1px solid white; border-top: none;">
                <th colspan="2" style="border: 1px solid white; border-top: none;">
                  Fahrzeugdaten
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
	if(farbe)
	{
		if(fahrzeug.farbe.contains("-metallic"))
		{
			//nuescht machen hier, ist erlaubt
		}
		else if(fahrzeug.farbe.contains("metallic"))
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
	if(bauJahr)
	{
		if(bauJahr.contains('.'))
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
                  <b>
                    <g:formatNumber number="${fahrzeug.preis}" format="###,##0',--'"/>
                  </b>
                </td>
              </tr>
            </table>
            <table cellpadding="0" cellspacing="0" style="border: none; border-collapse: collapse;">
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
                  ${fahrzeug.kombiniert}l / 100
                </td>
              </tr>
              <tr>
                <td style="border: 1px solid white;">
                  <b>Innerorts</b>
                </td>
                <td style="border: 1px solid white;">
                  ${fahrzeug.innerorts}l / 100
                </td>
              </tr>
              <tr>
                <td style="border: 1px solid white;">
                  <b>Ausserorts</b>
                </td>
                <td style="border: 1px solid white;">
                  ${fahrzeug.ausserorts}l / 100
                </td>
              </tr>
              <tr>
                <td style="border: 1px solid white;">
                  <b>CO2</b>
                </td>
                <td style="border: 1px solid white;">
                  ${fahrzeug.co2}g / Km
                </td>
              </tr>
            </table>
            <g:if test="${fahrzeug.bilder?.size() > 1}">
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
                        <a href="${wm_photo_album.pathToImage(picture: bild, size: MediaUtils.BIG, albumName: ((Picture)bild).album.getName())}" class="highslide"
                                onclick="return hs.expand(this, {wrapperClassName: 'highslide-no-border', dimmingOpacity: 0.75, align: 'center'})">
                          <img src="${wm_photo_album.pathToImage(picture: bild, size: MediaUtils.THUMBNAIL, albumName: ((Picture)bild).album.getName())}" alt="${fahrzeug?.marke} ${fahrzeug?.modell}"
                                  title="Klicken Sie hier, um eine vergr&ouml;&szlig;erte Ansicht des Bildes zu bekommen"/></a>
                        <!--<div class="highslide-caption"></div>-->
                        <div id="closebutton" class="highslide-overlay closebutton" onclick="return hs.close(this)" title="Schließen"></div>
                        %{--<img src="${request.getContextPath()}${bild.dateiName}" alt="${fahrzeug?.marke} ${fahrzeug?.modell}"/>--}%
                        <br/>
                        <br/>
                      </td>
                    </g:if>

                  </g:each>
                </tr>
              </table>
            </g:if>
          </td>
        </tr>
      </table>

      <table cellpadding="0" cellspacing="0" style="border: 1px solid white; border-collapse: collapse; width: 600px;">
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
      </table>
    </div>

	<g:if test="${session.user}">
		<br />

		<div>
			<g:link controller="fahrzeug" action="edit" id="${fahrzeug.id}">Stammdaten bearbeiten</g:link>
		</div>

		<br />

		<div>
			<g:link controller="fahrzeug" action="uploadPictures" id="${fahrzeug.id}">Bilder bearbeiten</g:link>	
		</div>

        <br />

		<div>
			<g:link controller="fahrzeug" action="list">Komplette Fahrzeugliste anzeigen</g:link>	
		</div>
	</g:if>

</div>
</body>
</html>