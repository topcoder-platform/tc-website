package com.topcoder.web.ejb.fileconversion;

import java.rmi.RemoteException;
import javax.ejb.CreateException;
import javax.ejb.EJBHome;

public interface FileConversionHome extends EJBHome {

    FileConversion create() throws CreateException, RemoteException;
}

