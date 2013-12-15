<%@ page import="de.webmpuls.photo_album.Picture; de.webmpuls.photo_album.util.MediaUtils" %>
<html>
    <head>
        <meta name="layout" content="html5boilerplate" />
        <title>Fahrzeug-Bild hochladen</title>
    </head>
    <body>
    <div class="nav" role="navigation">
        <ul>
            <li><a class="home" href="${createLink(controller: 'fahrzeug')}">Zur Fahrzeugliste</a></li>
        </ul>
    </div>
        <div class="body">
            <h1>Fahrzeug-Bild hochladen</h1>
			<g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
			<g:hasErrors bean="${fahrzeug}">
            <div class="errors">
                <g:renderErrors bean="${fahrzeug}" as="list" />
            </div>
            </g:hasErrors>
            <g:if test="${flash.error}">
                <div class="errors" role="status">${flash.error}</div>
            </g:if>
			<br />
            <g:uploadForm action="bindPicturesToCar" method="post">
              <table cellpadding="0" cellspacing="0" border="0" style="width: 620px;">
                <tr>
                  <td>
                    <p>
                        <label for="picture1" id="label_picture1">
                      Bild f&uuml;r Position 1 w&auml;hlen:
                        </label>
                    </p>
                  </td>
                  <td>
                    <input type="file" name="picture1" id="picture1"/>
                  </td>
                  <td>
                    <g:each var="bild" in="${fahrzeug.bilder}">

                      	<g:if test="${bild.position == 1}">

							<img src="${wm_photo_album.pathToImage(picture: bild, size: MediaUtils.THUMBNAIL, albumName: ((Picture)bild).album.getName())}" alt="${bild}" />
							<br />
						  	<g:link action="deletePictures" id="${bild.id}" params="[fahrzeugId: fahrzeug.id]" onclick="confirm('Wirklich loeschen?');" >Bild l&ouml;schen</g:link>
				  		</g:if>

                    </g:each>
                  </td>
                </tr>
                <tr>
                  <td>
                    <p>
                        <label for="picture2" id="label_picture2">
                            Bild f&uuml;r Position 2 w&auml;hlen:
                        </label>
                    </p>
                  </td>
                  <td>
                    <input type="file" name="picture2" id="picture2"/>
                  </td>
                  <td>
                    <g:each var="bild" in="${fahrzeug.bilder}">

                      <g:if test="${bild.position == 2}">

						<img src="${wm_photo_album.pathToImage(picture: bild, size: MediaUtils.THUMBNAIL, albumName: ((Picture)bild).album.getName())}" alt="${bild}" />
					  	<br/>
					  	<g:link action="deletePictures" id="${bild.id}" params="[fahrzeugId: fahrzeug.id]" onclick="confirm('Wirklich loeschen?');" >Bild l&ouml;schen</g:link>

                      </g:if>

                    </g:each>
                  </td>
                </tr>
                <tr>
                  <td>
                    <p>
                        <label for="picture3" id="label_picture3">
                      Bild f&uuml;r Position 3 w&auml;hlen:
                        </label>
                    </p>
                  </td>
                  <td>
                    <input type="file" name="picture3" id="picture3"/>
                  </td>
                  <td>
                    <g:each var="bild" in="${fahrzeug.bilder}">

                      <g:if test="${bild.position == 3}">

                        <img src="${wm_photo_album.pathToImage(picture: bild, size: MediaUtils.THUMBNAIL, albumName: ((Picture)bild).album.getName())}" alt="${bild}" />
						<br />
						<g:link action="deletePictures" id="${bild.id}" params="[fahrzeugId: fahrzeug.id]" onclick="confirm('Wirklich loeschen?');" >Bild l&ouml;schen</g:link>

                      </g:if>

                    </g:each>
                  </td>
                </tr>
              </table>

                <g:hiddenField name="fahrzeugId" value="${fahrzeug.id}" />

                <div class="buttons">
                    <span class="button"><g:submitButton class="save" name="savePictures" value="Bilder auf den Server laden"/></span>
				</div>
			</g:uploadForm>
			<br />
		<br />
		<hr />
		<g:link controller="fahrzeug" action="anzeigen" id="${fahrzeug.id}">&lt;&lt; Zum Fahrzeug "${fahrzeug}" zur&uuml;ck</g:link>
        </div>
    </body>
</html>
