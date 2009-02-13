package com.topcoder.util.idgenerator.bean;

import java.sql.SQLException;
import javax.ejb.EJBLocalObject;

/**
 * The local interface for the id generator bean.  
 * 
 * @version 1.0  
 * @author Timur Zambalayev
 */ 
public interface LocalIdGen extends EJBLocalObject {

    /**
     * Returns the next id.
     *  
     * @return the next id.
     * @throws SQLException     if a database access error occurs.
     */ 
    long nextId() throws SQLException;

    /**
     * Returns the next id for the given table id.
     *  
     * @param tableId           the table/sequence name.
     * @return the next id.
     * @throws SQLException     if a database access error occurs.
     */ 
    long nextId(String tableId) throws SQLException;
    
}
