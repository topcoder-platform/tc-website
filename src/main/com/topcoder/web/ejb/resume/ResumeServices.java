package com.topcoder.web.ejb.resume;

import com.topcoder.web.resume.bean.Resume;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;

import javax.ejb.EJBObject;
import java.rmi.RemoteException;

public interface ResumeServices extends EJBObject {

    public Resume getResume(long userId)
            throws RemoteException;
    public void putResume(long userId,int fileType, String fileName, byte[] file)
            throws RemoteException;
    public ResultSetContainer getFileTypes()
            throws RemoteException;
    public boolean hasResume(long userId)
            throws RemoteException;


}
