package com.topcoder.web.resume.ejb.ResumeServices;

import com.topcoder.common.web.data.MemberSearch;
import com.topcoder.web.resume.bean.Resume;

import javax.ejb.EJBObject;
import java.rmi.RemoteException;
import java.util.ArrayList;

public interface ResumeServices extends EJBObject {

    public Resume getResume(int userID)
            throws RemoteException;
    public void putResume(int userID,int fileType, String fileName, byte[] file)
            throws RemoteException;
    public ArrayList getFileTypes()
            throws RemoteException;

}
