package com.topcoder.ejb.Graph;

import javax.ejb.*;
import java.rmi.RemoteException;
import java.util.*;

/**
 *
 * This class creates an instance of Graph ejb.
 * 
 */
    
  public interface GraphHome extends EJBHome { 
	
 /**
 *
 * This method returns a Graph ejb.
 *
 */

    Graph create() throws CreateException, RemoteException;
  }
