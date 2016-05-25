dataSource {
    pooled = true
    driverClassName = "org.postgresql.Driver"
    dialect = "org.hibernate.dialect.PostgreSQLDialect"
    username = "autohutt"
    password = "autohutt4postgres"
    
    properties {
       maxActive = -1
       minEvictableIdleTimeMillis=1800000
       timeBetweenEvictionRunsMillis=1800000
       numTestsPerEvictionRun=3
       testOnBorrow=true
       testWhileIdle=true
       testOnReturn=true
       validationQuery="SELECT 1"
    }
}
hibernate {
    cache.use_second_level_cache = true
    cache.use_query_cache = true
//    cache.provider_class='net.sf.ehcache.hibernate.EhCacheRegionFactory'
    cache.provider_class = 'net.sf.ehcache.hibernate.EhCacheProvider'
}
// environment specific settings
environments {
    development {
        dataSource {
//          dataSource {
            dbCreate = "update" // one of 'create', 'create-drop', 'update', 'validate', ''

            url = "jdbc:postgresql://webmpuls.de:5432/autohutt-int"

            logSql = true
            formatSql = true
        }
    }
    /*dataSource {
        dbCreate = "update"
        url = "jdbc:h2:prodDb;MVCC=TRUE;LOCK_TIMEOUT=10000"
        pooled = true
        properties {
            maxActive = -1
            minEvictableIdleTimeMillis=1800000
            timeBetweenEvictionRunsMillis=1800000
            numTestsPerEvictionRun=3
            testOnBorrow=true
            testWhileIdle=true
            testOnReturn=true
            validationQuery="SELECT 1"
        }
    }*/
    test {
        dataSource {
            dbCreate = "update" // one of 'create', 'create-drop', 'update', 'validate', ''

            url = "jdbc:postgresql://webmpuls.de:5432/autohutt-int"

            logSql = true
            formatSql = true
        }
    }

    /*test {
        dataSource {
            dbCreate = "update"
            url = "jdbc:h2:mem:testDb;MVCC=TRUE;LOCK_TIMEOUT=10000"
        }
    }*/

    production {
        dataSource {
            dbCreate = "update"

            url = "jdbc:postgresql://webmpuls.de:5432/autohutt-prod"
        }
    }

    /*production {
        dataSource {
            dbCreate = "update"
            url = "jdbc:h2:prodDb;MVCC=TRUE;LOCK_TIMEOUT=10000"
            pooled = true
            properties {
                maxActive = -1
                minEvictableIdleTimeMillis=1800000
                timeBetweenEvictionRunsMillis=1800000
                numTestsPerEvictionRun=3
                testOnBorrow=true
                testWhileIdle=true
                testOnReturn=true
                validationQuery="SELECT 1"
            }
        }
    }*/
}
