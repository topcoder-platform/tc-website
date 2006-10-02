package com.topcoder.util.idgenerator.sql;

/**
 * A simple Informix data source.  
 * 
 * @version     1.0  
 * @author      Timur Zambalayev
 */ 
class SimpleInformixDataSource extends SimpleDataSource {

    /**
     * Creates an instance of this class.
     * 
     * @param host                      host.
     * @param port                      port.
     * @param informixServer            Informix server.
     * @param dbName                    db name.
     * @param user                      user.
     * @param password                  password.
     * @throws ClassNotFoundException   if the driver class not found in the classpath.
     */ 
    SimpleInformixDataSource(String host, int port, String informixServer, String dbName, String user, String password) 
            throws ClassNotFoundException {
        super("com.informix.jdbc.IfxDriver", "jdbc:informix-sqli://"+host+":"+port+"/"+dbName+":INFORMIXSERVER="+informixServer,
                user, password);
    }

}
