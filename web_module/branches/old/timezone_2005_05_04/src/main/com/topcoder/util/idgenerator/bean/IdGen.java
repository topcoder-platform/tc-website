package com.topcoder.util.idgenerator.bean;

import java.rmi.RemoteException;
import java.sql.SQLException;
import javax.ejb.EJBObject;

/**
 * The remote interface for the id generator bean.  
 * 
 * @version 1.0  
 * @author Timur Zambalayev
 */ 
public interface IdGen extends EJBObject {

    /**
     * Returns the next id.
     *  
     * @return the next id.
     * @throws RemoteException  a communication-related problem.  
     * @throws SQLException     if a database access error occurs.
     */ 
    long nextId() throws RemoteException, SQLException;

    /**
     * Returns the next id for the given table id.
     *  
     * @param tableId           the table/sequence name.
     * @return the next id.
     * @throws SQLException     if a database access error occurs.
     */ 
    long nextId(String tableId) throws RemoteException, SQLException;
    
}
