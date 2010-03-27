<%=packageName ? "package ${packageName}\n\n" : ''%>class ${className}Controller {
    
    def index = { redirect(action:list,params:params) }

    // the delete, save and update actions only accept POST requests
    static allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list =
    {
        params.max = Math.min( params.max ? params.max.toInteger() : 10,  100)

        [ ${propertyName}List: ${className}.list( params ), ${propertyName}Total: ${className}.count() ]
    }

    def show =
	{
        def ${propertyName} = ${className}.get( params.id )

        if(!${propertyName})
		{
            flash.message = "${className} mit der ID \${params.id} konnte nicht gefunden werden!"
            redirect(action:list)
        }
        else
		{
			return [ ${propertyName} : ${propertyName} ]
		}
    }

    def delete =
	{
        def ${propertyName} = ${className}.get( params.id )

		if(${propertyName})
		{
            ${propertyName}.delete()
            flash.message = "${className} \${params.id} gel&ouml;scht!"
            redirect(action:list)
        }
        else
		{
            flash.message = "${className} mit der ID \${params.id} konnte nicht gefunden werden!"
            redirect(action:list)
        }
    }

    def edit =
	{
        def ${propertyName} = ${className}.get( params.id )

        if(!${propertyName})
		{
            flash.message = "${className} mit der ID \${params.id} konnte nicht gefunden werden!"
            redirect(action:list)
        }
        else
		{
            return [ ${propertyName} : ${propertyName} ]
        }
    }

    def update =
	{
        def ${propertyName} = ${className}.get( params.id )

        if(${propertyName})
        {
            if(params.version)
            {
                def version = params.version.toLong()

                if(${propertyName}.version > version)
                {
                    <%def lowerCaseName = grails.util.GrailsNameUtils.getPropertyName(className)%>
                    ${propertyName}.errors.rejectValue("version", "${lowerCaseName}.optimistic.locking.failure", "Another user has updated this ${className} while you were editing.")
                    render(view:'edit',model:[${propertyName}:${propertyName}])
                    return
                }
            }
            ${propertyName}.properties = params

			if(!${propertyName}.hasErrors() && ${propertyName}.save())
			{
                flash.message = "${className} \${params.id} wurde ge&auml;ndert!"
                redirect(action:show,id:${propertyName}.id)
            }
            else
			{
                render(view:'edit',model:[${propertyName}:${propertyName}])
            }
        }
        else
		{
            flash.message = "${className} mit der ID \${params.id} konnte nicht gefunden werden!"
            redirect(action:edit,id:params.id)
        }
    }

    def create =
	{
        def ${propertyName} = new ${className}()
        ${propertyName}.properties = params

		return ['${propertyName}':${propertyName}]
    }

    def save =
	{
        def ${propertyName} = new ${className}(params)

		if(!${propertyName}.hasErrors() && ${propertyName}.save())
		{
            flash.message = "${className} \${${propertyName}.id} wurde erzeugt!"
            redirect(action:show,id:${propertyName}.id)
        }
        else
		{
            render(view:'create',model:[${propertyName}:${propertyName}])
        }
    }
}
