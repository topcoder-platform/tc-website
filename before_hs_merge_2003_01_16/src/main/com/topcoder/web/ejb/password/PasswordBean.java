package com.topcoder.web.ejb.password;

import java.rmi.RemoteException;
import javax.ejb.EJBException;
import com.topcoder.security.*;
import org.apache.log4j.Logger;

public class PasswordBean implements javax.ejb.SessionBean {

    private static Logger logger = Logger.getLogger(PasswordBean.class);

    public void ejbCreate() throws EJBException {}
    public void ejbRemove() throws RemoteException {}
    public void ejbActivate(){}
    public void ejbPassivate(){}
    public void setSessionContext(javax.ejb.SessionContext cntx){}
    
    public String encodePassword(String password) throws GeneralSecurityException {
        logger.debug("PasswordBean.encodePassword");
        return Util.encodePassword(password, "users");
    }
    
}
