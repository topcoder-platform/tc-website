package com.topcoder.web.ejb.currentschool;

import javax.ejb.EJBObject;
import javax.ejb.EJBException;
import java.rmi.RemoteException;

public interface CurrentSchool extends EJBObject {
    void createCurrentSchool(long coderId, String schoolName, String dataSource)
            throws EJBException, RemoteException;
}
