package com.topcoder.util.idgenerator.sql;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

/**
 * The Informix table locking implementation.  
 * 
 * @version     1.0  
 * @author      Timur Zambalayev
 */ 
public final class InformixDB implements DB {

    public void lockTable(Connection connection, String tableName) throws SQLException {
        Statement statement=null;
        try {
            statement=connection.createStatement();
            statement.executeUpdate("LOCK TABLE "+tableName+" IN EXCLUSIVE MODE");
        } finally {
            if (statement!=null) {
                statement.close();
            }
        }
    }

}
