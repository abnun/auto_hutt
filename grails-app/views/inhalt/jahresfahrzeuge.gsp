<html>
    <head>
		<title>Jahresfahrzeuge</title>
        <meta name="layout" content="html5boilerplate" />
    </head>

    <body>

		<h1>
			Jahresfahrzeuge
		</h1>

		<div>
			<ul>
				<li>
                    <a href="${createLink(controller: 'fahrzeug', action: 'jahreswagen')}" style="text-decoration: underline;">Jahresfahrzeuge</a>
				</li>
				<li>
					<a href="${createLink(controller: 'fahrzeug', action: 'neuUndJahreswagenBis24Monate')}" style="text-decoration: underline;">Jahresfahrzeuge bis 24 Monate</a>
				</li>
			</ul>
		</div>

	</body>
</html>