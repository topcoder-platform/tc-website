package com.topcoder.web.jobposting.ejb.JobPostingServices;

import javax.ejb.EJBObject;
import java.rmi.RemoteException;

public interface JobPostingServices extends EJBObject {

    public void addJobHit(long userId, long jobId, int hitTypeId) throws RemoteException;
    public String getLink(long jobId) throws RemoteException;
    public boolean jobExists(long jobId) throws RemoteException;
}
