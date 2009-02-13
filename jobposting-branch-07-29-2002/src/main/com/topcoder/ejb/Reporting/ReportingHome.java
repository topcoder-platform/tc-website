package com.topcoder.ejb.Reporting;

import javax.ejb.*;
import java.rmi.RemoteException;

    
public interface ReportingHome extends EJBHome { 
	
  Reporting create() throws CreateException, RemoteException;

}
