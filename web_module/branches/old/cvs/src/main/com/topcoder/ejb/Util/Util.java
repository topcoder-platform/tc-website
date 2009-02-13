package com.topcoder.ejb.Util;

import javax.ejb.*;
import java.rmi.RemoteException;
import java.util.*;
import com.topcoder.common.web.error.*;
import com.topcoder.common.web.data.*;

public interface Util extends EJBObject {

  public java.sql.Date getCurrentDate ()
    throws TCException, RemoteException;

  public java.sql.Time getCurrentTime ()
    throws TCException, RemoteException;

  public java.sql.Timestamp getCurrentTimestamp ()
    throws TCException, RemoteException;

  public void insertJMSError ( int coderId, String msg )
    throws TCException, RemoteException;

  public void incrementAdvertiserHitCount ( int advertiserId )
    throws TCException, RemoteException;

  public String getRegionCode ( String stateCode, int userTypeId )
    throws TCException, RemoteException;

  public boolean allowFullResume ( int subscriberId, int coderId )
    throws TCException, RemoteException;

  public void incrementJobPostingHits ( int jobPostingId, int userId )
    throws TCException, RemoteException;

  public void incrementPressReleaseHitCount ( int id, String host )
    throws TCException, RemoteException;

  public int logMail ( EMailMessage mail )
    throws RemoteException;

}
