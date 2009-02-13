package com.topcoder.ejb.Search;

import javax.ejb.*;
import java.rmi.RemoteException;
import java.util.*;
import com.topcoder.shared.util.*;
import com.topcoder.common.web.data.*;

public interface Search extends EJBObject {

  public MemberSearch getCoders(MemberSearch search) 
    throws RemoteException; 

  public MemberSearch scroll(MemberSearch search) 
    throws RemoteException; 

  public ArrayList getReferrals ( int userId )
    throws RemoteException; 

}
