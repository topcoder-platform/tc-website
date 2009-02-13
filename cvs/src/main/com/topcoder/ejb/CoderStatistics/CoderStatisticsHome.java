package com.topcoder.ejb.CoderStatistics;

import javax.ejb.*;
import java.rmi.RemoteException;
import java.util.*;

/**
 *
 * This class creates an instance of Statistical ejb.
 * 
 */
    
  public interface CoderStatisticsHome extends EJBHome { 
	
 /**
 *
 * This method returns a Statistical ejb.
 *
 */

    CoderStatistics create() throws CreateException, RemoteException;
  }
