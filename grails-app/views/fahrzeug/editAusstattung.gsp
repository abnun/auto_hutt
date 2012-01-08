<html>
    <head>
        <meta name="layout" content="html5boilerplate" />
        <title>Fahrzeugausstattung w&auml;hlen</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(controller: 'fahrzeug')}">Zur Fahrzeugliste</a></span>
            <span class="menuButton"><g:link class="list" action="list">Fahrzeug-Liste</g:link></span>
        </div>
        <div class="body">
            <h1>Fahrzeugausstattung w&auml;hlen</h1>
			<g:if test="${session.message}">
            <div class="message">${session.message}</div>
            </g:if>
			<% session.message = null %>
			<g:hasErrors bean="${fahrzeug}">
            <div class="errors">
                <g:renderErrors bean="${fahrzeug}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="bindFahrzeugAusstattungenToCar2" method="post" >
				<table>
					<tbody>
						<%
							def ausstattungen = Fahrzeugausstattung.listOrderByName()
						%>
						<g:if test="${ausstattungen}">
							<g:each var="ausstattung" in="${ausstattungen}">
								<tr>

									<td>
										<g:checkBox name="${ausstattung.id}_ausstattung" />
										<g:if test="${fahrzeug.ausstattungen*.id?.contains(ausstattung.id)}">
											<span>(Bereits zugeordnet)</span>
										</g:if>
									</td>
									<td>
										${ausstattung?.name?.encodeAsHTML()}
									</td>

								</tr>
							</g:each>
						</g:if>
						<g:else>
							Es sind noch keine Fahrzeugausstattungen vorhanden.
						</g:else>

					</tbody>
				</table>
                <br />
				<h1>... oder Fahrzeugausstattung neu erzeugen</h1>
				<p>
					(Mehrere Ausstattungen durch Komma trennen, z.B. "Klima, Servolenkung, usw.")
				</p>
				<br/>
				<table>
					<tbody>
						<tr>
							<td>
								<g:textField name="newAusstattung" size="70"/>
								<g:hiddenField name="isNewAusstattung" value="true"/>
							</td>
						</tr>
					</tbody>
				</table>
				<g:hiddenField name="fahrzeugId" value="${fahrzeug.id}"/>
				<div class="buttons">
					<span class="button"><g:submitButton class="save" name="saveAusstattung" value="Neu erstellen"/></span>
				</div>
			</g:form>
        </div>
    </body>
</html>
