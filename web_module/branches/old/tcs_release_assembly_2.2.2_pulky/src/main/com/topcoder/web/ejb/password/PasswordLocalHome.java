package com.topcoder.web.ejb.password;

import javax.ejb.CreateException;
import javax.ejb.EJBException;

public interface PasswordLocalHome extends javax.ejb.EJBLocalHome {

    public static final String EJB_REF_NAME = "java:comp/env/ejb/com/topcoder/web/ejb/password/PasswordEJB";

    public PasswordLocal create() throws EJBException, CreateException;
}
