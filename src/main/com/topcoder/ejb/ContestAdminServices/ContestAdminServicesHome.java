package com.topcoder.ejb.ContestAdminServices;

import javax.ejb.*;
import java.rmi.RemoteException;


public interface ContestAdminServicesHome extends EJBHome 
{ 
	
  //////////////////////////////////////////////////////////////////////////////// 
  ContestAdminServices create() throws CreateException, RemoteException;
  //////////////////////////////////////////////////////////////////////////////// 

}
