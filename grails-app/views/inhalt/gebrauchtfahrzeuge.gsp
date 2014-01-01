<html>
    <head>
		<title>Gebrauchtfahrzeuge</title>
        <meta name="layout" content="html5boilerplate" />
    </head>

    <body>

		<h1>
			Gebrauchtfahrzeuge
		</h1>

		<div>
            <nav:secondary scope="fahrzeugAngebot" class="naviUl" custom="true">
                <li>
                    <g:if test="${item.data.blank}">
                        <a href="${p.callTag(tag: 'g:createLink', attrs: linkArgs + [class: active ? 'active' : ''])}" target="_blank">
                            <nav:title item="${item}"/>
                        </a>
                    </g:if>
                    <g:else>
                        <p:callTag tag="g:link" attrs="${linkArgs + [class: active ? 'active' : '']}">
                            <nav:title item="${item}"/>
                        </p:callTag>
                    </g:else>
                </li>
            </nav:secondary>
		</div>

	</body>
</html>