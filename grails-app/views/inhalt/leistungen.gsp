<html>
<head>
	<meta name="layout" content="html5boilerplate" />
	<style type="text/css">
		/* ... file-local CSS props ... */
		#leistung_table {
			border: none;
			width: 620px;
			background: url('${resource(dir: 'images', file: 'leistungen.gif')}') no-repeat 170px 120px;
		}
	</style>
</head>

<body>

<table id="leistung_table">
	<tr>
		<td style="vertical-align: top;">

			<h2>
				Unsere Leistungen im &Uuml;berblick:
			</h2>

		</td>
		<td style="vertical-align: top;">

			<h2>
				Unsere Partner:
			</h2>

		</td>
	</tr>
	<tr>
		<td>

			<ul style="list-style-type: square; margin-right: 260px;">
				<li>
					Inspektion aller Kfz
				</li>
				<li>
					Sicherheits-Check
				</li>
				<li>
					Hauptuntersuchung &amp; AU
				</li>
				<li>
					Fehlerdiagnose
				</li>
				<li>
				&Ouml;lwechsel
				</li>
				<li>
					Bremsen
				</li>
				<li>
					Abgasanlagen
				</li>
				<li>
					Kupplungen
				</li>
				<li>
					Sto&szlig;d&auml;mpfer
				</li>
				<li>
					Reifen &amp; Felgen
				</li>
				<li>
					Reifeneinlagerungen
				</li>
				<li>
					Achsvermessungen
				</li>
				<li>
					Klimaanlagen
				</li>
				<li>
					Standheizungen
				</li>
				<li>
					Autoglasservice
				</li>
				<li>
					Karosseriearbeiten
				</li>
				<li>
					Mobiles Telefonieren
				</li>
				<li>
					Mietwagenservice
				</li>
				<li>
					Abschleppservice
				</li>
				<li>
					Hol- und Bringservice
				</li>
				<li>
					Freie Tankstelle
				</li>
				<li>
					SB Waschanlage
				</li>
				<li>
					M&uuml;nzstaubsauger
				</li>
			</ul>

		</td>
		<td>

			<ul style="list-style-type: square;">
				<li>
					<a href="http://www.webasto.de/home/de/homepage.html" title="Webasto (Standheizungen)" target="_blank">
						Webasto (Standheizungen)
					</a>
				</li>
				<li>
					<a href="http://www.eberspaecher.de/de/heiz/heiz.htm" title="Ebersp&auml;cher (Standheizungen)" target="_blank">
						Ebersp&auml;cher (Standheizungen)
					</a>
				</li>
				<li>
					<a href="http://www.mobil.com/USA-English/gFM/home_Contact_Us/homepage.asp" title="Mobil (&Ouml;l)" target="_blank">
						Mobil (&Ouml;l)
					</a>
				</li>
				<li>
					<a href="http://www.motul.de/" title="Motul (&Ouml;l)" target="_blank">
						Motul (&Ouml;l)
					</a>
				</li>
				%{--<li>
					<a href="http://www.castrol.de/" title="Castrol (&Ouml;l)" target="_blank">
						Castrol (&Ouml;l)
					</a>
				</li>--}%
				<li>
					<a href="http://www.bosch.de/start/content/language1/start/magazin_start.htm" title="Bosch" target="_blank">
						Bosch
					</a>
				</li>
				<li>
					<a href="http://www.sachs-ag.de/" title="F&amp;S - Fichtel &amp; Sachs" target="_blank">
						F&amp;S - Fichtel &amp; Sachs
					</a>
				</li>
				<li>
					<a href="http://www.waeco.de/" title="Waeco (Sitzheizung, PDC)" target="_blank">
						Waeco (Sitzheizung, PDC)
					</a>
				</li>
				<li>
					<a href="http://www.diavia.de/default.htm" title="Diavia (Klimaanlagen)" target="_blank">
						Diavia (Klimaanlagen)
					</a>
				</li>
				<li>
					<a href="http://www.ernst-hagen.de" title="Ernst (Auspuffanlagen)" target="_blank">
						Ernst (Auspuffanlagen)
					</a>
				</li>
				<li>
					<a href="http://www.eberspaecher.com" title="Ebersp&auml;cher (Ru&szlig;filter)" target="_blank">
						Ebersp&auml;cher (Ru&szlig;filter)
					</a>
				</li>
				<li>
					<a href="http://www.twintec.de/" title="Twintec (Ru&szlig;filter)" target="_blank">
						Twintec (Ru&szlig;filter)
					</a>
				</li>
				<li>
					<a href="http://www.hjs.com" title="HJS (Ru&szlig;filter)" target="_blank">
						HJS (Ru&szlig;filter)
					</a>
				</li>
				<li>
					<a href="http://www.h-r.com" title="H&amp;R (Tieferlegung + Spurverbreiterung)" target="_blank">
						H&amp;R (Tieferlegung + Spurverbreiterung)
					</a>
				</li>
				<li>
					<a href="http://www.eibach.de/" title="Eibach (Tieferlegung + Spurverbreiterung)" target="_blank">
						Eibach (Tieferlegung + Spurverbreiterung)
					</a>
				</li>
				<li>
					<a href="http://www.steinbauer.cc/" title="Webasto (Standheizungen)" target="_blank">
						Steinbauer (Leistungssteigerung)
					</a>
				</li>
			</ul>

		</td>
	</tr>
</table>

</body>
<r:script>
    $(document).ready(function() {

        var naviheight = $("#naviDiv").outerHeight(true);
        var contentheight = $("#contentDiv").outerHeight(true);

        if(contentheight < naviheight)
        {
            $("#contentDiv").height(naviheight - 20)
        }
    });
</r:script>
</html>