package com.topcoder.util.idgenerator.sql;

/**
 * The TC and Informix specific <code>DataSource</code> implementation.  
 * 
 * @version     1.0  
 * @author      Timur Zambalayev
 */ 
public final class SimpleTCInformixDataSource extends SimpleInformixDataSource {

    /**
     * Creates an instance of this class.
     * 
     * @param dbName                        the Informix database name.
     * @param password                      the user's password.
     * @throws ClassNotFoundException       if the class cannot be located.
     */ 
    public SimpleTCInformixDataSource(String dbName, String password) throws ClassNotFoundException {
        super("65.112.118.208", 1526, "tc_memeber_dev_tcp", dbName, "coder", password);
    }

}
