package com.topcoder.security.admin;

import javax.ejb.CreateException;
import javax.ejb.EJBException;

/**
 * @author Heather Van Aelst
 * @version 1.0
 */
public interface PolicyMgrLocalHome extends javax.ejb.EJBLocalHome {

    public static final String EJB_REF_NAME = "java:comp/env/ejb/security/PolicyMgrEJB";

    public PolicyMgrLocal create() throws EJBException, CreateException;

}
