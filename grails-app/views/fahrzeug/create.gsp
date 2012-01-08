<%@ page import="de.autohutt.domain.FahrzeugMarke" %>
<html>
    <head>
        <meta name="layout" content="html5boilerplate" />
        <title>Neues Fahrzeug erzeugen</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(controller: 'fahrzeug')}">Zur Fahrzeugliste</a></span>
            <span class="menuButton"><g:link class="list" action="list">Fahrzeug-Liste</g:link></span>
        </div>
        <div class="body">
            <h1>Neues Fahrzeug erzeugen</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${fahrzeug}">
            <div class="errors">
                <g:renderErrors bean="${fahrzeug}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
                <div class="dialog">
                    <table style="width: 620px;">
                        <tbody>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="marke">Marke:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:fahrzeug,field:'marke','errors')}">
                                    <g:select optionKey="id" from="${FahrzeugMarke.listOrderByName()}" name="marke.id" value="${fahrzeug?.marke?.id}" ></g:select>
									<span><g:link controller="fahrzeugMarke" action="create">Neue Fahrzeugmarke erzeugen</g:link></span>
								</td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="modell">Modell:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:fahrzeug,field:'modell','errors')}">
                                    <input type="text" id="modell" name="modell" value="${fieldValue(bean:fahrzeug,field:'modell')}"/>
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="farbe">Farbe:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:fahrzeug,field:'farbe','errors')}">
                                    <input type="text" id="farbe" name="farbe" value="${fieldValue(bean:fahrzeug,field:'farbe')}"/>
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="baujahr">Baujahr:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:fahrzeug,field:'baujahr','errors')}">
                                    <input type="text" id="baujahr" name="baujahr" value="${fieldValue(bean:fahrzeug,field:'baujahr')}"/>
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="kw">Kw:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:fahrzeug,field:'kw','errors')}">
                                    <input type="text" id="kw" name="kw" value="${fieldValue(bean:fahrzeug,field:'kw')}" />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="kmStand">Km Stand:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:fahrzeug,field:'kmStand','errors')}">
                                    <input type="text" id="kmStand" name="kmStand" value="${fieldValue(bean:fahrzeug,field:'kmStand')}" />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="preis">Preis:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:fahrzeug,field:'preis','errors')}">
                                    <input type="text" id="preis" name="preis" value="${fahrzeug?.preis ? ((Double)fahrzeug?.preis).intValue() : ''}" />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="ausstattung">Ausstattung:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:fahrzeug,field:'ausstattung','errors')}">
                                  <g:textArea name="ausstattung" value="${fahrzeug?.ausstattung ? fahrzeug?.ausstattung : ''}" />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="kombiniert">Kombiniert:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:fahrzeug,field:'kombiniert','errors')}">
                                    <input type="text" id="kombiniert" name="kombiniert" value="${fieldValue(bean:fahrzeug,field:'kombiniert')}"/>
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="innerorts">Innerorts:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:fahrzeug,field:'innerorts','errors')}">
                                    <input type="text" id="innerorts" name="innerorts" value="${fieldValue(bean:fahrzeug,field:'innerorts')}"/>
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="ausserorts">Ausserorts:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:fahrzeug,field:'ausserorts','errors')}">
                                    <input type="text" id="ausserorts" name="ausserorts" value="${fieldValue(bean:fahrzeug,field:'ausserorts')}"/>
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="co2">CO2:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:fahrzeug,field:'co2','errors')}">
                                    <input type="text" id="co2" name="co2" value="${fieldValue(bean:fahrzeug,field:'co2')}"/>
                                </td>
                            </tr>

							<tr class="prop">
                                <td valign="top" class="name">
                                    <label for="fahrzeugmasse">Fahrzeugmasse:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:fahrzeug,field:'fahrzeugmasse','errors')}">
                                    <input type="text" id="fahrzeugmasse" name="fahrzeugmasse" value="${fieldValue(bean:fahrzeug,field:'fahrzeugmasse')}"/>
                                </td>
                            </tr>

							<tr class="prop">
                                <td valign="top" class="name">
                                    <label for="jahressteuer">Jahressteuer:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:fahrzeug,field:'jahressteuer','errors')}">
                                    <input type="text" id="jahressteuer" name="jahressteuer" value="${fieldValue(bean:fahrzeug,field:'jahressteuer')}"/>
                                </td>
                            </tr>

							<tr class="prop">
                                <td valign="top" class="name">
                                    <label for="energietraegerkosten">Energietr&auml;gerkosten:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:fahrzeug,field:'energietraegerkosten','errors')}">
									<input type="text" id="energietraegerkosten" name="energietraegerkosten" value="${fieldValue(bean:fahrzeug,field:'energietraegerkosten')}"/>
                                </td>
                            </tr>

							<tr class="prop">
                                <td valign="top" class="name">
                                    <label for="co2Effizienz">CO2-Effizienz:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:fahrzeug,field:'co2Effizienz','errors')}">
                                    <g:select from="${['A+', 'A', 'B', 'C', 'D', 'E', 'F', 'G']}" keys="${['aplus', 'a', 'b', 'c', 'd', 'e', 'f', 'g']}" name="co2Effizienz" value="${fahrzeug?.co2Effizienz}" ></g:select>
									%{--<input type="text" id="co2Effizienz" name="co2Effizienz" value="${fieldValue(bean:fahrzeug,field:'co2Effizienz')}"/>--}%
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="gebraucht">Gebraucht:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:fahrzeug,field:'gebraucht','errors')}">
                                    <g:checkBox name="gebraucht" value="${fahrzeug?.gebraucht}" ></g:checkBox>
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="neu">Neu:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:fahrzeug,field:'neu','errors')}">
                                    <g:checkBox name="neu" value="${fahrzeug?.neu}" ></g:checkBox>
                                </td>
                            </tr>

                        </tbody>
                    </table>
                </div>
                <g:hiddenField name="newCreate" value="true" />
                <div class="buttons">
                    <span class="button"><input class="save" type="submit" action="create" value="Neu erzeugen" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>