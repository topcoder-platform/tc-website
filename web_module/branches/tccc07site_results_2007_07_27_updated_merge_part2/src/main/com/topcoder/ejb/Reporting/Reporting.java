package com.topcoder.ejb.Reporting;

import com.topcoder.common.web.data.report.Query;

import javax.ejb.EJBObject;
import java.rmi.RemoteException;
import java.util.ArrayList;

public interface Reporting extends EJBObject {

    public ArrayList getResult(Query query)
            throws RemoteException;

}
