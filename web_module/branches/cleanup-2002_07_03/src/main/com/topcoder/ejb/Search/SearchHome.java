package com.topcoder.ejb.Search;

import javax.ejb.*;
import java.rmi.RemoteException;
import java.util.*;

/**
 *
 * This class creates an instance of Search ejb.
 * 
 */
    
  public interface SearchHome extends EJBHome { 
	
 /**
 *
 * This method returns a Search ejb.
 *
 */

    Search create() throws CreateException, RemoteException;
  }
