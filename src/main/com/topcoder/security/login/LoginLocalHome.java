package com.topcoder.security.login;

import javax.ejb.CreateException;
import javax.ejb.EJBException;

public interface LoginLocalHome extends javax.ejb.EJBLocalHome {

    public static final String EJB_REF_NAME = "java:"+ LoginLocalHome.class.getName();

    public LoginLocal create()
            throws EJBException, CreateException;

}
