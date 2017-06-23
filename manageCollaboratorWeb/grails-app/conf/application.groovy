dataSource {
  pooled = true
  dbCreate = "create-drop"  // 'none', 'create-drop', 'create', 'update' or 'validate'
  driverClassName = "com.mysql.jdbc.Driver"
  username = "root"
  password = ""
  url = "jdbc:mysql://localhost/admocolaborador"
  properties {
    jmxEnabled = true
    initialSize = 5
    maxActive = 50
    minIdle = 5
    maxIdle = 25
    maxWait = 10000
    maxAge = 10 * 60000
    timeBetweenEvictionRunsMillis = 5000
    minEvictableIdleTimeMillis = 60000
    validationQuery = "SELECT 1"
    validationQueryTimeout = 3
    validationInterval = 15000
    testOnBorrow = true
    testWhileIdle = true
    testOnReturn = false
    jdbcInterceptors = "ConnectionState"
    defaultTransactionIsolation = java.sql.Connection.TRANSACTION_READ_COMMITTED
  }
} 