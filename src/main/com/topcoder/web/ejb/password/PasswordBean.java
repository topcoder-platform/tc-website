package com.topcoder.web.ejb.password;

import com.topcoder.security.GeneralSecurityException;
import com.topcoder.security.Util;
import org.apache.log4j.Logger;

import javax.ejb.EJBException;
import java.rmi.RemoteException;

public class PasswordBean implements javax.ejb.SessionBean {

    private static Logger logger = Logger.getLogger(PasswordBean.class);

    public void ejbCreate() throws EJBException {
    }

    public void ejbRemove() throws RemoteException {
    }

    public void ejbActivate() {
    }

    public void ejbPassivate() {
    }

    public void setSessionContext(javax.ejb.SessionContext cntx) {
    }

    public String encodePassword(String password) throws GeneralSecurityException {
        logger.debug("PasswordBean.encodePassword");
        return Util.encodePassword(password, "users");
    }

}
