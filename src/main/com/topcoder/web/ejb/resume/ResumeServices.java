package com.topcoder.web.ejb.resume;

import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.web.tc.controller.request.resume.Resume;

import javax.ejb.EJBException;
import javax.ejb.EJBObject;
import java.rmi.RemoteException;

public interface ResumeServices extends EJBObject {

    public Resume getResume(long userId, String dataSource)
            throws EJBException, RemoteException;

    public void putResume(long userId, int fileType, String fileName, byte[] file, String dataSource)
            throws EJBException, RemoteException;

    public ResultSetContainer getFileTypes(String dataSource)
            throws EJBException, RemoteException;

    public boolean hasResume(long userId, String dataSource)
            throws EJBException, RemoteException;


}
