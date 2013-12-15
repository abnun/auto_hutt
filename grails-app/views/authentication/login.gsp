<html>
<head>
	<title>
		Anmeldung
	</title>
	<meta name="layout" content="html5boilerplate" />
</head>

<body>

<div class="grid_5">
    <h1>
        Anmeldung erforderlich
    </h1>

    <p>
        Bitte Benutzer und Passwort eingeben.
    </p>
    <br/>
</div>
<div class="clear">&nbsp;</div>

<div class="grid_5">
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <g:if test="${flash.error}">
        <div class="errors" role="status">${flash.error}</div>
    </g:if>
<g:form action="setSessionUserByLogin" method="post" name="AuthenticationForm">

	<div class="grid_2">
		Benutzer:
	</div>
    <div class="grid_3">
        <g:field name="user" type="text" size="50" required="" />
    </div>
    <div class="clear">&nbsp;</div>
    <br />
    <div class="grid_2">
		Passwort:
	</div>
    <div class="grid_3">
        <g:field name="password" type="password" size="50" required="" />
    </div>
    <div class="clear">&nbsp;</div>
    <br />
	<div>
		<input type="reset" value="Zur&uuml;cksetzen"/>
		<g:submitButton name="submit" value="Abschicken"/>
	</div>

</g:form>

</body>
</html>