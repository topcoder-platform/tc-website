  package com.topcoder.ejb.ProblemServices;
       
  import javax.ejb.*;
  import java.rmi.RemoteException;
   
  /** 
  *
  */
  public interface ProblemServicesHome extends EJBHome {
             
    /**
    *
    */
    ProblemServices create() throws CreateException, RemoteException;
            
  }

 
