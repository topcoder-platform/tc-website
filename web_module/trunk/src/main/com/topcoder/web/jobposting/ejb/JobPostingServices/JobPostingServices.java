package com.topcoder.web.jobposting.ejb.JobPostingServices;

import javax.ejb.EJBObject;
import java.rmi.RemoteException;

public interface JobPostingServices extends EJBObject {

    public void addJobHit(int userId, int jobId, int hitTypeId) throws RemoteException;
    public String getLink(int jobId) throws RemoteException;
    public boolean jobExists(int jobId) throws RemoteException;
}
