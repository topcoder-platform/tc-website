package com.topcoder.security.admin;

import javax.ejb.EJBException;
import javax.ejb.CreateException;
import javax.ejb.FinderException;
import com.topcoder.security.GeneralSecurityException;

/**
 * @author Heather Van Aelst
 * @version 1.0
 */
public interface PrincipalMgrLocalHome extends javax.ejb.EJBLocalHome {

    public static final String EJB_REF_NAME="java:comp/env/ejb/security/PrincipalMgrEJB";

    public PrincipalMgrLocal create() throws EJBException, CreateException;

}
