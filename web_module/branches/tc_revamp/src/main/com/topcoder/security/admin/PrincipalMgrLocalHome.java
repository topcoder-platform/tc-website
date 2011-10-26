package com.topcoder.security.admin;

import javax.ejb.CreateException;
import javax.ejb.EJBException;

/**
 * @author Heather Van Aelst
 * @version 1.0
 */
public interface PrincipalMgrLocalHome extends javax.ejb.EJBLocalHome {

    public static final String EJB_REF_NAME = "java:" + PrincipalMgrLocalHome.class.getName();

    public PrincipalMgrLocal create() throws EJBException, CreateException;

}
