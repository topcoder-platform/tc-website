package com.topcoder.web.ejb.collegetour;

import javax.ejb.EJBObject;
import java.rmi.RemoteException;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Dec 5, 2005
 */
public interface Registration extends EJBObject {

    void create(long eventId, long coderId, String dataSource) throws RemoteException;
    boolean exists(long eventId, long coderId, String dataSource) throws RemoteException;
}
