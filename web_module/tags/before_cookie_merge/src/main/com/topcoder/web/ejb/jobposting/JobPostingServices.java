package com.topcoder.web.ejb.jobposting;

import javax.ejb.EJBObject;
import java.rmi.RemoteException;

public interface JobPostingServices extends EJBObject {

    public void addJobHit(long userId, long jobId, int hitTypeId, String dataSource) throws RemoteException;
    public String getLink(long jobId, String dataSource) throws RemoteException;
    public boolean jobExists(long jobId, String dataSource) throws RemoteException;
}
