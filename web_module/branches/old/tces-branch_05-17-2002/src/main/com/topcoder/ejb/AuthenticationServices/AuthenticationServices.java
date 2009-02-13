package com.topcoder.ejb.AuthenticationServices;

import javax.ejb.*;
import java.util.ArrayList;
import java.rmi.RemoteException;
import com.topcoder.common.web.error.*;
import com.topcoder.common.web.data.*;


public interface AuthenticationServices extends EJBObject {

  public boolean validHandle(String userName) 
    throws RemoteException, TCException; 

  public boolean agreed (int sectorId, int userId) 
    throws RemoteException, TCException; 

  public Authentication getActivation(int coderId) 
    throws RemoteException, TCException;

  public Authentication getCredentials(String firstName, 
    String lastName, String email) 
    throws RemoteException, TCException;

  public Authentication authenticate(String userName, String password) 
    throws RemoteException, TCException; 

  public ArrayList getLikeUsers ( String userName )
    throws RemoteException, TCException;

  public void insertSectorAccess ( int sectorId, int userId, String authorized )
    throws RemoteException, TCException;

  public void insertSectorAgreement ( int sectorId, int userId )
    throws RemoteException, TCException;

}
