<html>
<head>
	<title>
		Anmeldung
	</title>
	<meta name="layout" content="main"/>
</head>

<body>

<h1>
	Anmeldung erforderlich
</h1>
<p>
	Bitte Benutzer und Passwort eingeben.
</p>

<g:form action="setSessionUserByLogin" method="post" name="AuthenticationForm">

	<div>
		Benutzer: <g:textField name="user"/>
	</div>
	<div>
		Passwort: <g:passwordField name="password"/>
	</div>
	<div>
		<input type="reset" value="Zur&uuml;cksetzen"/>
		<g:submitButton name="submit" value="Abschicken"/>
	</div>

</g:form>

</body>
</html>