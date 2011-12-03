dataSource {
	pooled = true
	driverClassName = "org.hsqldb.jdbcDriver"
	username = "sa"
	password = ""
}
hibernate {
    cache.use_second_level_cache=true
    cache.use_query_cache=true
//    cache.provider_class='net.sf.ehcache.hibernate.EhCacheRegionFactory'
    cache.provider_class='net.sf.ehcache.hibernate.EhCacheProvider'
}
// environment specific settings
environments {
	development {
		dataSource {
//			dbCreate = "update" // one of 'create', 'create-drop','update'
//			dbCreate = "create-drop" // one of 'create', 'create-drop','update'
//			url = "jdbc:hsqldb:mem:devDB"
			//logSql=true
//			url = "jdbc:hsqldb:file:prodDb;shutdown=true"
			url = "jdbc:hsqldb:file:prodDb_temp;shutdown=true"

//			driverClassName = "org.h2.Driver"

//			url = "jdbc:h2:mem:devDb"
		}
	}
	test {
		dataSource {
			dbCreate = "update"
			url = "jdbc:hsqldb:mem:testDb"
		}
	}
	production {
		dataSource {
//			dbCreate = "update"
			url = "jdbc:hsqldb:file:/root/prodDb_temp;shutdown=true"
		}
	}
}