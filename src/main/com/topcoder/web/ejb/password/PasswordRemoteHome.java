package com.topcoder.web.ejb.password;

import java.rmi.RemoteException;
import javax.ejb.CreateException;
import javax.ejb.EJBException;

public interface PasswordRemoteHome extends javax.ejb.EJBHome {

    public static final String EJB_REF_NAME = "web/ejb/password/PasswordEJB";

    public PasswordRemote create() throws RemoteException, CreateException, EJBException;

}
