package com.topcoder.web.ejb.requestservices;

import javax.ejb.EJBObject;
import java.rmi.RemoteException;

/**
 * User: dok
 * Date: Nov 19, 2004
 * Time: 11:24:49 AM
 */
public interface RequestServices extends EJBObject {

    void createRequest(long userId, String url, String dataSource) throws RemoteException;
    void createRequest(String url, String dataSource) throws RemoteException;

}
