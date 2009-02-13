package com.topcoder.web.tces.ejb.TCESServices;

import javax.ejb.EJBObject;
import java.rmi.RemoteException;

public interface TCESServices extends EJBObject {

    public void addJobHit(int userId, int jobId, int hitTypeId) throws RemoteException;

}
