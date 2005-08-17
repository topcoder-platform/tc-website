package com.topcoder.util.idgenerator.bean;

import java.rmi.RemoteException;
import javax.ejb.CreateException;
import javax.ejb.EJBHome;

/**
 * The home interface for the id generator bean.  
 * 
 * @version     1.0  
 * @author      Timur Zambalayev
 */ 
public interface IdGenHome extends EJBHome {

    /**
     * Returns the id generator's remote interface.
     *  
     * @return the id generator's remote interface. 
     * @throws RemoteException  a communication-related problem.  
     * @throws CreateException  a failure to create an EJB object.
     * @throws IdGenException   if there is an id generator problem.
     */ 
    IdGen create() throws RemoteException, CreateException, IdGenException;

}
