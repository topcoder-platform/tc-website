package com.topcoder.web.ejb.fileconversion;

import javax.ejb.CreateException;
import javax.ejb.EJBHome;
import java.rmi.RemoteException;

public interface FileConversionHome extends EJBHome {

    FileConversion create() throws CreateException, RemoteException;
}

