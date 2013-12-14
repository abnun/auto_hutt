<%@ page import="de.webmpuls.photo_album.Picture; de.webmpuls.photo_album.util.MediaUtils; de.autohutt.domain.Fahrzeug" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="html5boilerplate">
    <g:set var="entityName" value="${message(code: 'fahrzeug.label', default: 'Fahrzeug')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>

    <r:style>

        /* ... file-local CSS props ... */

        tr>td:first-child, tr>th:first-child {
            padding-left: 0.5em;
            padding-right: 0.5em;
        }

        tr>td:last-child, tr>th:last-child {
            padding-left: 0.5em;
            padding-right: 0.5em;
        }
    </r:style>
</head>

<body>
<a href="#list-fahrzeug" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                               default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(controller: 'fahrzeug')}">Zur Fahrzeugliste</a></li>
        <li><g:link class="create" action="create">Neues Fahrzeug erzeugen</g:link></li>
        <li><g:link class="create" action="create" controller="fahrzeugMarke">Neue Fahrzeugmarke erzeugen</g:link></li>
    </ul>
</div>

<div id="list-fahrzeug" class="content scaffold-list" role="main">
    <h1>Fahrzeug-Liste</h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <g:form action="deleteSelected" method="post" name="FahrzeugForm">
    <table style="width: 600px;">
        <tbody>
        <g:each in="${fahrzeugInstanceList}" status="i" var="fahrzeugInstance">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                <td><g:checkBox name="${fahrzeugInstance.id.toString()}"/></td>

                <%
                    def fahrzeugBilder = fahrzeugInstance.bilder.isEmpty() ? [] : (fahrzeugInstance.bilder.sort {Picture a, Picture b -> a.position <=> b.position})
                %>
                <td style="width: 100px;">
                    <g:if test="${fahrzeugBilder.isEmpty()}">
                        <g:link mapping="fahrzeugAnzeigen"
                                params="[id: fahrzeugInstance.id, marke: fahrzeugInstance.marke, modell: fahrzeugInstance.modell]"><g:img
                                dir="medias" file="icon.no_photo_available.png"
                                alt="${fahrzeugInstance?.marke}${fahrzeugInstance?.modell}"
                                style="width: 80px;"/></g:link>
                    </g:if>
                    <g:else>
                        <g:link mapping="fahrzeugAnzeigen"
                                params="[id: fahrzeugInstance.id, marke: fahrzeugInstance.marke, modell: fahrzeugInstance.modell]"><img
                                src="${wm_photo_album.pathToImage(picture: fahrzeugBilder?.first(), size: MediaUtils.THUMBNAIL, albumName: ((Picture) fahrzeugBilder.first())?.album?.getName())}"
                                alt="${fahrzeugInstance?.marke} ${fahrzeugInstance?.modell}"
                                style="width: 80px;"/></g:link>
                    </g:else>
                </td>
                <td style="width: 200px;">
                    <g:link mapping="fahrzeugAnzeigen" params="[id: fahrzeugInstance.id, marke: fahrzeugInstance.marke, modell: fahrzeugInstance.modell]">${fieldValue(bean: fahrzeugInstance, field: "marke")} ${fieldValue(bean: fahrzeugInstance, field: "modell")}</g:link>

                    <br />
                    ${message(code: 'fahrzeug.baujahr.label', default: 'Baujahr')}: ${fieldValue(bean: fahrzeugInstance, field: 'baujahr')}
                    <br />
                    ${message(code: 'fahrzeug.kw.label', default: 'KW')}: ${fieldValue(bean: fahrzeugInstance, field: "kw")}
                    <br />
                    ${message(code: 'fahrzeug.kmStand.label', default: 'Km-Stand')}: ${fieldValue(bean: fahrzeugInstance, field: "kmStand")}
                    <br />
                    ${message(code: 'fahrzeug.farbe.label', default: 'Farbe')}: ${fieldValue(bean: fahrzeugInstance, field: "farbe")}
                    <br />
                    ${message(code: 'fahrzeug.gebraucht.label', default: 'Gebraucht')}: ${fieldValue(bean: fahrzeugInstance, field: "gebraucht") == 'true' ? 'ja' : 'nein'}
                    <br />
                    ${message(code: 'fahrzeug.neu.label', default: 'Neu')}: ${fieldValue(bean: fahrzeugInstance, field: "neu") == 'true' ? 'ja' : 'nein'}
                </td>

                <td>
                    <br />
                    ${message(code: 'fahrzeug.kombiniert.label', default: 'Kombiniert')}: ${fieldValue(bean: fahrzeugInstance, field: 'kombiniert')}l/100
                    <br />
                    ${message(code: 'fahrzeug.innerorts.label', default: 'Innerorts')}: ${fieldValue(bean: fahrzeugInstance, field: 'innerorts')}l/100
                    <br />
                    ${message(code: 'fahrzeug.ausserorts.label', default: 'Ausserorts')}: ${fieldValue(bean: fahrzeugInstance, field: 'ausserorts')}l/100
                    <br />
                    ${message(code: 'fahrzeug.co2.label', default: 'CO2')}: ${fieldValue(bean: fahrzeugInstance, field: 'co2')}g/Km
                </td>

                <td style="vertical-align: middle;">
                    <span style="white-space: nowrap; font-style: italic;"><g:formatNumber number="${fahrzeugInstance.preis}" format="###,##0',--'"/></span>
                </td>

            </tr>
        </g:each>
        </tbody>
    </table>
    <table>
        <g:if test="${!fahrzeugInstanceList.isEmpty()}">
            <tr>
                <td colspan="2" nowrap="nowrap">
                    Markierte:&nbsp;&nbsp;&nbsp;<g:submitButton name="submit" value="Loeschen" />
                </td>
            </tr>
        </g:if>
    </table>
    </g:form>

    %{--<div class="pagination">
        <g:paginate total="${fahrzeugInstanceCount ?: 0}"/>
    </div>--}%
</div>
</body>
</html>
