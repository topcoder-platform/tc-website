package com.topcoder.web.ejb.longcompresult;

import javax.ejb.CreateException;
import javax.ejb.EJBHome;
import java.rmi.RemoteException;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Dec 2, 2005
 */
public interface LongCompResultHome extends EJBHome {
    public LongCompResult create() throws CreateException, RemoteException;
}
