package com.topcoder.ejb.Util;

import javax.ejb.EJBObject;
import java.rmi.RemoteException;

public interface Util extends EJBObject {


    public void incrementSponsorHitCount(String link, String refer)
            throws RemoteException;

}
