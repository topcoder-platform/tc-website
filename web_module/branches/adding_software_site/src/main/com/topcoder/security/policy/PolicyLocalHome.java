package com.topcoder.security.policy;

import javax.ejb.CreateException;
import javax.ejb.EJBException;

/**
 * The Session EJB is a proxy to the Policy object. This should be used by EJB clients.
 *
 * @author Heather Van Aelst
 * @version 1.0
 */
public interface PolicyLocalHome extends javax.ejb.EJBLocalHome {

    public static final String EJB_REF_NAME = "java:comp/env/ejb/security/PolicyEJB";

    public PolicyLocal create() throws EJBException, CreateException;

}
