package com.topcoder.dde.user;

import javax.ejb.CreateException;
import javax.ejb.EJBException;

public interface UserManagerLocalHome extends javax.ejb.EJBLocalHome {

    public static final String EJB_REF_NAME = "java:comp/env/ejb/UserManagerEJB";

    public UserManagerLocal create() throws EJBException, CreateException;

}
