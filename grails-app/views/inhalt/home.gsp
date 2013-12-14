<html>
    <head>
        <meta name="layout" content="html5boilerplate" />
    </head>

    <body>
        <div class="grid_5 omega">
            <div class="textcenter">
                <h1>
                    Willkommen auf www.autohutt.de
                </h1>

                <div class="clear">&nbsp;</div>
                <br/>
                <b>
                    ihrem 1a Autoservicepartner in Leingarten
                </b>

                <div class="clear">&nbsp;</div>
                <br/>

                <img src="${resource(dir: 'images', file: 'startseite.jpg')}" class="darkshadow" alt="Willkommen"/>
            </div>

            <div class="clear">&nbsp;</div>
            <br />
            <br />

            %{--<div style="clear: both;"></div>--}%
            <div>
                der Systemwerkstatt der Zukunft f&uuml;r alle Marken und Typen.
                <br />
                <br />
                Wenn Sie 1a Leistungen bei Wartung, Reparatur oder Einbau erwarten, sind Sie bei uns richtig.
                <br />
                Auch bei Ihrer individuellen Fahrzeugsuche nach einem Neuen oder Gebrauchten sind wir Ihnen gerne behilflich und beraten Sie in allen Bereichen.
                <br />
                Unsere St&auml;rken sind guter Service und qualifizierte Beratung.
                <br />
                <br />
            </div>
            <div class="textcenter">
                Kompetent in Sachen Mechanik - Elektronik - Karosserie
                <br />
                preiswert - schnell - termingerecht
            </div>
        </div>
        <div class="grid_3 omega">
            <div class="grid_3 omega" style="margin-left: 45px;">
                <div id="addressDiv">
                    <g:render template="/layouts/address"/>
                </div>
            </div>
            <div class="clear">&nbsp;</div>
            <div class="grid_3 alpha omega" style="margin-top: 3px; margin-left: 45px;">
                <img src="${resource(dir: 'images', file: 'mehrmarken-center.jpg')}" alt="Mehrmarken Center" style="border: 1px solid black; width: 174px;"/>
            </div>
            <div class="clear" style="">&nbsp;</div>
            <div class="grid_3 alpha omega" style="margin-top: 0px; margin-left: 45px;">
                <img src="${resource(dir: 'images', file: 'eu_fahrzeuge.jpg')}" alt="Eu-Fahrzeuge" style="border: 1px solid black; width: 174px;"/>
            </div>
            <div class="clear">&nbsp;</div>
            <div class="grid_3 alpha omega" style="margin-top: 0px; margin-left: 45px;">
                <a href="http://www.bfi-ev.de" target="_blank"><img src="${resource(dir: 'images', file: 'bfi.jpg')}" alt="Bundesverband freier Kfz-Importeure" style="border: 1px solid black; width: 174px;"/></a>
            </div>
        </div>
	</body>
</html>