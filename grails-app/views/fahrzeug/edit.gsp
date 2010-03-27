<%@ page import="de.autohutt.domain.FahrzeugMarke" %>
<html>
    <head>
        <meta name="layout" content="main" />
        <title>Fahrzeug ${fahrzeug?.marke} ${fahrzeug?.modell} editieren</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(controller: 'fahrzeug')}">Zur Fahrzeugliste</a></span>
            <span class="menuButton"><g:link class="list" action="list">Fahrzeug-Liste</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">Neues Fahrzeug erzeugen</g:link></span>
        </div>
        <div class="body">
            <h1>Fahrzeug ${fahrzeug?.marke} ${fahrzeug?.modell} editieren</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${fahrzeug}">
            <div class="errors">
                <g:renderErrors bean="${fahrzeug}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <input type="hidden" name="id" value="${fahrzeug?.id}" />
                <div class="dialog">
                    <table style="width: 620px;">
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="marke">Marke:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:fahrzeug,field:'marke','errors')}">
                                    <g:select optionKey="id" from="${FahrzeugMarke.listOrderByName()}" name="marke.id" value="${fahrzeug?.marke?.id}" ></g:select>
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
                                    <input type="text" id="kw" name="kw" value="${formatNumber(number: fahrzeug.kw)}" />
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="kmStand">Km Stand:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:fahrzeug,field:'kmStand','errors')}">
                                    <input type="text" id="kmStand" name="kmStand" value="${formatNumber(number: fahrzeug.kmStand)}" />
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
                                  <g:textArea name="ausstattung" value="${fahrzeug?.ausstattung}" />
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
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="update" value="&Auml;ndern" /></span>
                    <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Sicher?');" action="delete" value="L&ouml;schen" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
