package com.topcoder.ejb.Util;

import javax.ejb.*;
import java.rmi.RemoteException;

    
public interface UtilHome extends EJBHome { 
	
  Util create() throws CreateException, RemoteException;

}
