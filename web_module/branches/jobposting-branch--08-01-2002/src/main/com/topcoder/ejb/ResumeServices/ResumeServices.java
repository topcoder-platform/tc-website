package com.topcoder.ejb.ResumeServices;

import com.topcoder.common.web.data.MemberSearch;

import javax.ejb.EJBObject;
import java.rmi.RemoteException;
import java.util.ArrayList;

public interface ResumeServices extends EJBObject {

    public byte[] getResume(int userID)
            throws RemoteException;
    public void putResume(int userID,String fileType, String fileName, byte[] file)
            throws RemoteException;
    public ArrayList getFileTypes()
            throws RemoteException;

}
