package com.topcoder.web.ejb.email;

import java.rmi.RemoteException;
import javax.ejb.CreateException;
import javax.ejb.EJBHome;

public interface EmailHome extends EJBHome {

  public final static String EJB_REF_NAME=
                                         "com.topcoder.web.ejb.email.EmailHome";

  Email create() throws CreateException, RemoteException;

};
