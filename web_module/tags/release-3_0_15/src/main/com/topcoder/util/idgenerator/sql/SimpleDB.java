package com.topcoder.util.idgenerator.sql;

import java.sql.Connection;

/**
 * The no-op table locking implementation.  
 * 
 * @version     1.0  
 * @author      Timur Zambalayev
 */ 
public final class SimpleDB implements DB {

    public void lockTable(Connection connection, String tableName) {
    }

}
