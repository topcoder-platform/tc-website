package com.topcoder.web.ejb.password;

import javax.ejb.EJBException;
import javax.ejb.CreateException;
import com.topcoder.security.GeneralSecurityException;
/**
 * @author Heather Van Aelst
 * @version 1.0
 */
public interface PasswordLocalHome extends javax.ejb.EJBLocalHome {

    public static final String EJB_REF_NAME="java:comp/env/ejb/com/topcoder/web/ejb/password/PasswordEJB";

    public String encodePassword(String password) throws EJBException, CreateException;

}
