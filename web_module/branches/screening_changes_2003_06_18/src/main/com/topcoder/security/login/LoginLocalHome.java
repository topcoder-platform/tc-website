package com.topcoder.security.login;

import javax.ejb.EJBException;
import javax.ejb.CreateException;

public interface LoginLocalHome extends javax.ejb.EJBLocalHome {

    public static final String EJB_REF_NAME="java:comp/env/ejb/security/LoginEJB";

    public LoginLocal create() 
        throws EJBException, CreateException;

}
