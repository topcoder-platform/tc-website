package com.topcoder.util.idgenerator.sql;

import java.sql.Connection;
import java.sql.SQLException;

/**
 * Currently the table locking strategy.  
 * 
 * @version     1.0  
 * @author      Timur Zambalayev
 */ 
public interface DB {

    /**
     * Locks the table for the given connection and table name.
     *  
     * @param connection        a db connection/session.
     * @param tableName         table name.
     * @throws SQLException     if a database access error occurs.
     */ 
    void lockTable(Connection connection, String tableName) throws SQLException;

}
