package com.topcoder.ejb.JavaDocServices;

import javax.ejb.EJBObject;
import java.rmi.RemoteException;

public interface JavaDocServices extends EJBObject {
    /**
     * Checks if a user has permission to view a java doc.  The returned String is "" if he does and a String error
     * message if he doesn't.
     */
    public String authenticateUserForWebService(String handle, String password, String webServiceName)
            throws RemoteException, JavaDocServicesException;

    /**
     * Returns the HTML corresponding the the file specified by path for the specified web service.
     */
    public String getFile(String webServiceName, String path)
            throws RemoteException, JavaDocServicesException;
}
