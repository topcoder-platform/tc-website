package com.topcoder.web.ejb.rboard;

import javax.ejb.CreateException;
import java.rmi.RemoteException;

/**
 * @author dok
 * Date: Feb 12, 2004
 */
public interface RBoardApplicationHome extends javax.ejb.EJBHome {
    public RBoardApplication create() throws CreateException, RemoteException;
}
