package com.topcoder.util.idgenerator.bean;

import javax.ejb.CreateException;
import javax.ejb.EJBLocalHome;

/**
 * The local home interface for the id generator bean.  
 * 
 * @version     1.0  
 * @author      Timur Zambalayev
 */ 
public interface LocalIdGenHome extends EJBLocalHome {

    /**
     * The EJB reference name.
     */ 
    public static final String EJB_REF_NAME="java:comp/env/ejb/IdGenEJB";

    /**
     * Returns the id generator's local interface.
     *  
     * @return the id generator's local interface. 
     * @throws CreateException  a failure to create an EJB object.
     * @throws IdGenException   if there is an id generator problem.
     */ 
    LocalIdGen create() throws CreateException, IdGenException;

}
