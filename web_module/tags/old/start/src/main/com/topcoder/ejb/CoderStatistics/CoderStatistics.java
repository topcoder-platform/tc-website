package com.topcoder.ejb.CoderStatistics;

import javax.ejb.*;
import java.rmi.RemoteException;
import java.util.*;
import com.topcoder.common.web.data.stat.coder.*;
import com.topcoder.common.web.data.stat.*;
import com.topcoder.common.*;

public interface CoderStatistics extends EJBObject {

  public ArrayList getLastCoderComps(int coderId, int num) throws RemoteException; 

  public ArrayList getTopRankedCoders(int first, int last) throws RemoteException;

  public Coder getCoderEarnings(int coderId) throws RemoteException;

  public ArrayList getEarningsHistory(int coderId) throws RemoteException;
 
  public boolean getAdvanced(int coderId, int roundId) throws RemoteException;
 
  public Coder getCoderStatistics(int coderId) throws RemoteException;

}
