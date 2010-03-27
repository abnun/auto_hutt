<html>
    <head>
        <meta name="layout" content="main"/>
    </head>

    <body>

		<h1>
			EU-Neufahrzeuge
		</h1>

		<div>
			<ul>
				<li>
					<g:link controller="liste" action="lagerfahrzeuge" style="text-decoration: underline;">Lagerfahrzeuge</g:link>
					<span class="textsmaller">(Standort Leingarten, sofort erh&auml;ltlich)</span>
				</li>
				<li>
                    <a href="http://euro-auto-boerse.net/db2/start.php3?username=953a&quickauth=user%22%3Ezugang%3C" target="_blank" style="text-decoration: underline;">Bestellte Lagerfahrzeuge</a>
					<span class="textsmaller">(Link zur EU-Autob&ouml;rse, innerhalb 14 Tagen lieferbar)</span>
				</li>
				<li>
                    <a href="http://euro-auto-boerse.net/db2/start.php3?username=953a&quickauth=user%22%3Ezugang%3C" target="_blank" style="text-decoration: underline;">Bestellfahrzeuge</a>
					<span class="textsmaller">(Link zur EU-Autob&ouml;rse, Bestellung mit Ausstattung nach individuellen W&uuml;nschen)</span>
				</li>
				<li>
                    <a href="${createLink(controller: 'fahrzeug', action: 'bestellfahrzeugeFreiKonfigurierbar')}" style="text-decoration: underline;">Bestellfahrzeuge</a>
					<span class="textsmaller">(Link zur ELN-Autob&ouml;rse, Bestellangebote frei konfigurierbar)</span>
				</li>
			</ul>
		</div>

	</body>
</html>