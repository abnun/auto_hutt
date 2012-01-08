<html>
<head>
	<meta name="layout" content="html5boilerplate" />
</head>

<body>

<g:if test="${flash.message}">
	<div class="message">${flash.message}</div>
</g:if>


<g:uploadForm method="post" name="ImportForm" action="importExcel" >

	<div>
		Excel-File hochladen und importieren: <input type="file" name="file" />
	</div>
	<br />
	<div>
		gebraucht? <g:checkBox name="gebraucht" />
	</div>
	<div>
		neu? <g:checkBox name="neu" />
	</div>
	<div>
		alte loeschen? <g:checkBox name="deleteOld" />
	</div>

	<div>
		<g:submitButton name="submit" value="Abschicken" onclick="if(document.getElementsByName('deleteOld')[0].checked == true){alert('Sicher, dass vorher alle Datensaetze geloescht werden sollen?')}"/>
	</div>

</g:uploadForm>

</body>
</html>