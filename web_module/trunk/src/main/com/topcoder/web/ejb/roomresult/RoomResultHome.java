package com.topcoder.web.ejb.roomresult;

import javax.ejb.EJBHome;
import javax.ejb.CreateException;
import java.rmi.RemoteException;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Dec 2, 2005
 */
public interface RoomResultHome extends EJBHome {
    public RoomResult create() throws CreateException, RemoteException;
}
