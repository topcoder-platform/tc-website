package com.topcoder.util.idgenerator;

import java.sql.SQLException;

/**
 * High value fetcher.  
 * 
 * @version     1.0  
 * @author      Timur Zambalayev
 */ 
interface HighValueFetcher {

    /**
     * Gets the next high value.
     * 
     * @param tableId           table id.
     * @return next high value.
     * @throws SQLException     if a db access error occurs.
     */ 
    long nextHighValue(String tableId) throws SQLException;

}
