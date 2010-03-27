<html>
    <head>
        <meta name="layout" content="main"/>
    </head>

    <body>

		<h1>
			Gebrauchtfahrzeuge
		</h1>

		<div>
			<ul>
				<li>
					<g:link controller="liste" action="gebrauchtfahrzeuge" style="text-decoration: underline;">Gebrauchtfahrzeuge am Standort Leingarten</g:link>
				</li>
				<li>
                    <a href="${createLink(controller: 'fahrzeug', action: 'gebrauchtfahrzeuge3Bis5Jahre')}" style="text-decoration: underline;">Gebrauchtfahrzeuge 3 - 5 Jahre kurzfristig lieferbar (ELN-Autob&ouml;rse)</a>
				</li>
				%{--<li>
                    <a href="http://euro-auto-boerse.net/db2/start.php3?username=953a&quickauth=user%22%3Ezugang%3C" target="_blank" style="text-decoration: underline;">... ab 5 Jahre</a>
				</li>--}%
			</ul>
		</div>

	</body>
</html>