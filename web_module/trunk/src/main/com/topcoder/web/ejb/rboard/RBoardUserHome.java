package com.topcoder.web.ejb.rboard;

import javax.ejb.CreateException;
import java.rmi.RemoteException;

/**
 * @author dok
 * Date: Feb 13, 2004
 */
public interface RBoardUserHome extends javax.ejb.EJBHome {
    public RBoardUser create() throws CreateException, RemoteException;
}
