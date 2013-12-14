<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="html5boilerplate">
		<g:set var="entityName" value="${message(code: 'fahrzeug.label', default: 'Fahrzeug')}" />
		<title>Neues Fahrzeug erzeugen</title>
	</head>
	<body>
		<a href="#create-fahrzeug" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="create-fahrzeug" class="content scaffold-create" role="main">
			<h1>Neues Fahrzeug erzeugen</h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${fahrzeugInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${fahrzeugInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form url="[resource:fahrzeugInstance, action:'save']" >
				<fieldset class="form">

                    <div class="fieldcontain ${hasErrors(bean: fahrzeugInstance, field: 'marke', 'error')} required">
                        <label for="marke">
                            <g:message code="fahrzeug.marke.label" default="Marke"/>
                            <span class="required-indicator">*</span>
                        </label>
                        <g:select id="marke" name="marke.id" from="${de.autohutt.domain.FahrzeugMarke.listOrderByName()}" optionKey="id" required=""
                                  value="${fahrzeugInstance?.marke?.id}" class="many-to-one"/>
                        <span><g:link controller="fahrzeugMarke" action="create">Neue Fahrzeugmarke erzeugen</g:link></span>
                    </div>

                    <div class="fieldcontain ${hasErrors(bean: fahrzeugInstance, field: 'modell', 'error')} ">
                        <label for="modell">
                            <g:message code="fahrzeug.modell.label" default="Modell"/>

                        </label>
                        <g:textField name="modell" value="${fahrzeugInstance?.modell}"/>
                    </div>

                    <div class="fieldcontain ${hasErrors(bean: fahrzeugInstance, field: 'farbe', 'error')} ">
                        <label for="farbe">
                            <g:message code="fahrzeug.farbe.label" default="Farbe"/>

                        </label>
                        <g:textField name="farbe" value="${fahrzeugInstance?.farbe}"/>
                    </div>

                    <div class="fieldcontain ${hasErrors(bean: fahrzeugInstance, field: 'baujahr', 'error')} ">
                        <label for="baujahr">
                            <g:message code="fahrzeug.baujahr.label" default="Baujahr"/>

                        </label>
                        <g:textField name="baujahr" value="${fahrzeugInstance?.baujahr}"/>
                    </div>

                    <div class="fieldcontain ${hasErrors(bean: fahrzeugInstance, field: 'kw', 'error')} required">
                        <label for="kw">
                            <g:message code="fahrzeug.kw.label" default="Kw"/>
                            <span class="required-indicator">*</span>
                        </label>
                        <g:field name="kw" type="number" value="${fahrzeugInstance.kw}" required=""/>
                    </div>

                    <div class="fieldcontain ${hasErrors(bean: fahrzeugInstance, field: 'kmStand', 'error')} ">
                        <label for="kmStand">
                            <g:message code="fahrzeug.kmStand.label" default="Km Stand"/>

                        </label>
                        <g:field name="kmStand" type="number" value="${fahrzeugInstance.kmStand}"/>
                    </div>

                    <div class="fieldcontain ${hasErrors(bean: fahrzeugInstance, field: 'preis', 'error')} required">
                        <label for="preis">
                            <g:message code="fahrzeug.preis.label" default="Preis"/>
                            <span class="required-indicator">*</span>
                        </label>
                        <g:field name="preis" value="${fieldValue(bean: fahrzeugInstance, field: 'preis')}" required=""/>
                    </div>

                    <div class="fieldcontain ${hasErrors(bean: fahrzeugInstance, field: 'ausstattung', 'error')} ">
                        <label for="ausstattung">
                            <g:message code="fahrzeug.ausstattung.label" default="Ausstattung"/>

                        </label>
                        <g:textArea name="ausstattung" cols="40" rows="5" maxlength="1073741824" value="${fahrzeugInstance?.ausstattung}"/>
                    </div>

                    <div class="fieldcontain ${hasErrors(bean: fahrzeugInstance, field: 'kombiniert', 'error')} required">
                        <label for="kombiniert">
                            <g:message code="fahrzeug.kombiniert.label" default="Kombiniert"/>
                            <span class="required-indicator">*</span>
                        </label>
                        <g:textField name="kombiniert" required="" value="${fahrzeugInstance?.kombiniert}"/>
                    </div>

                    <div class="fieldcontain ${hasErrors(bean: fahrzeugInstance, field: 'innerorts', 'error')} required">
                        <label for="innerorts">
                            <g:message code="fahrzeug.innerorts.label" default="Innerorts"/>
                            <span class="required-indicator">*</span>
                        </label>
                        <g:textField name="innerorts" required="" value="${fahrzeugInstance?.innerorts}"/>
                    </div>

                    <div class="fieldcontain ${hasErrors(bean: fahrzeugInstance, field: 'ausserorts', 'error')} required">
                        <label for="ausserorts">
                            <g:message code="fahrzeug.ausserorts.label" default="Ausserorts"/>
                            <span class="required-indicator">*</span>
                        </label>
                        <g:textField name="ausserorts" required="" value="${fahrzeugInstance?.ausserorts}"/>
                    </div>

                    <div class="fieldcontain ${hasErrors(bean: fahrzeugInstance, field: 'co2', 'error')} required">
                        <label for="co2">
                            <g:message code="fahrzeug.co2.label" default="CO2"/>
                            <span class="required-indicator">*</span>
                        </label>
                        <g:textField name="co2" required="" value="${fahrzeugInstance?.co2}"/>
                    </div>

                    <div class="fieldcontain ${hasErrors(bean: fahrzeugInstance, field: 'fahrzeugmasse', 'error')} ">
                        <label for="fahrzeugmasse">
                            <g:message code="fahrzeug.fahrzeugmasse.label" default="Fahrzeugmasse"/>

                        </label>
                        <g:textField name="fahrzeugmasse" value="${fahrzeugInstance?.fahrzeugmasse}"/>
                    </div>

                    <div class="fieldcontain ${hasErrors(bean: fahrzeugInstance, field: 'jahressteuer', 'error')} ">
                        <label for="jahressteuer">
                            <g:message code="fahrzeug.jahressteuer.label" default="Jahressteuer"/>

                        </label>
                        <g:textField name="jahressteuer" value="${fahrzeugInstance?.jahressteuer}"/>
                    </div>

                    <div class="fieldcontain ${hasErrors(bean: fahrzeugInstance, field: 'energietraegerkosten', 'error')} ">
                        <label for="energietraegerkosten">
                            <g:message code="fahrzeug.energietraegerkosten.label" default="Energietraegerkosten"/>

                        </label>
                        <g:textField name="energietraegerkosten" value="${fahrzeugInstance?.energietraegerkosten}"/>
                    </div>

                    <div class="fieldcontain ${hasErrors(bean: fahrzeugInstance, field: 'co2Effizienz', 'error')} ">
                        <label for="co2Effizienz">
                            <g:message code="fahrzeug.co2Effizienz.label" default="CO2-Effizienz"/>

                        </label>
                        %{--<g:textField name="co2Effizienz" value="${fahrzeugInstance?.co2Effizienz}"/>--}%
                        <g:select from="${['A+', 'A', 'B', 'C', 'D', 'E', 'F', 'G']}" keys="${['aplus', 'a', 'b', 'c', 'd', 'e', 'f', 'g']}" name="co2Effizienz" value="${fahrzeug?.co2Effizienz}" ></g:select>
                    </div>

                    %{--<div class="fieldcontain ${hasErrors(bean: fahrzeugInstance, field: 'bilder', 'error')} ">
                        <label for="bilder">
                            <g:message code="fahrzeug.bilder.label" default="Bilder"/>

                        </label>
                        <g:select name="bilder" from="${de.webmpuls.photo_album.Picture.list()}" multiple="multiple" optionKey="id" size="5"
                                  value="${fahrzeugInstance?.bilder*.id}" class="many-to-many"/>
                    </div>--}%

                    <div class="fieldcontain ${hasErrors(bean: fahrzeugInstance, field: 'gebraucht', 'error')} ">
                        <label for="gebraucht">
                            <g:message code="fahrzeug.gebraucht.label" default="Gebraucht"/>

                        </label>
                        <g:checkBox name="gebraucht" value="${fahrzeugInstance?.gebraucht}"/>
                    </div>

                    <div class="fieldcontain ${hasErrors(bean: fahrzeugInstance, field: 'neu', 'error')} ">
                        <label for="neu">
                            <g:message code="fahrzeug.neu.label" default="Neu"/>

                        </label>
                        <g:checkBox name="neu" value="${fahrzeugInstance?.neu}"/>
                    </div>

                </fieldset>
				<fieldset class="buttons">
					<g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
