package com.topcoder.ejb.Graph;

import javax.ejb.*;
import java.rmi.RemoteException;
import java.util.*;
import com.topcoder.common.*;

public interface Graph extends EJBObject {

  public ArrayList getRatingDistribution() throws RemoteException;
  public ArrayList getAvgRatingsHistory() throws RemoteException;
  public ArrayList getPointsHistory(Integer coderId) throws RemoteException;
}
