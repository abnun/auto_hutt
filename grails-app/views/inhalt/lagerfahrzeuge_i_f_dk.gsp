<html>
    <head>
        <meta name="layout" content="html5boilerplate" />
    </head>

    <body>

		<h1>
			Lagerfahrzeuge aus Italien, Frankreich und D&auml;nemark
		</h1>

		<div>
			<ul>
				<li>
					<a href="${createLink(controller: 'fahrzeug', action: 'fahrzeugeImVorlauf')}" style="text-decoration: underline;">Neufahrzeuge im Vorlauf</a>
				</li>
				<li>
                    <a href="${createLink(controller: 'fahrzeug', action: 'neuwagenOhneZulassung')}" style="text-decoration: underline;">Neufahrzeuge kurzfristig lieferbar</a>
				</li>
			</ul>
		</div>

	</body>
</html>