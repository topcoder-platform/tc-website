package com.topcoder.ejb.Reporting;

import javax.ejb.*;
import java.rmi.RemoteException;
import java.util.*;
import com.topcoder.common.*;
import com.topcoder.common.web.data.report.*;
import com.topcoder.shared.docGen.xml.*;

public interface Reporting extends EJBObject {

  public RecordTag getDayReg ( java.sql.Timestamp after ) 
    throws RemoteException;

  public RecordTag getSchoolCount ( java.sql.Timestamp before ) 
    throws RemoteException;

  public RecordTag getSkillTotal ( java.sql.Timestamp before ) 
    throws RemoteException;

  public RecordTag getDayReg ( String tagName, java.sql.Timestamp after ) 
    throws RemoteException;
  
  public RecordTag getSchoolCount ( String tagName, java.sql.Timestamp before ) 
    throws RemoteException;

  public RecordTag getSkillTotal ( String tagName, java.sql.Timestamp before ) 
    throws RemoteException;

  public ArrayList getResult (Query query)
    throws RemoteException;
  
}
