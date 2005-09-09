package com.topcoder.web.ejb.forum;

import javax.ejb.EJBObject;
import java.rmi.RemoteException;
import javax.ejb.EJBException;

//import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;

public interface Forum extends EJBObject {
    
    public void createForum(int roundID) throws EJBException, RemoteException;

    public String[] getCategoryNames() throws EJBException, RemoteException;
}