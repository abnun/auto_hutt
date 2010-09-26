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
		Benutzer:&nbsp;<span style="margin-left: 10px;"><g:textField name="user"/></span>
	</div>
	<div>
		Passwort:&nbsp;<span style="margin-left: 10px;"><g:passwordField name="password"/></span>
	</div>
	<div>
		<input type="reset" value="Zur&uuml;cksetzen"/>
		<g:submitButton name="submit" value="Abschicken"/>
	</div>

</g:form>

</body>
</html>