package com.topcoder.util.idgenerator;

import java.sql.SQLException;

/**
 * Id generator interface.  
 * 
 * @version     1.0  
 * @author      Timur Zambalayev
 */ 
interface IdGeneratorInterface {

    /**
     * Gets the next id.
     * 
     * @return the next id.
     * @throws SQLException     if a db access error occurs.
     */ 
    long nextId() throws SQLException;

}
