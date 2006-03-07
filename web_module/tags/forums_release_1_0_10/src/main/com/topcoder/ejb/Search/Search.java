package com.topcoder.ejb.Search;

import com.topcoder.common.web.data.MemberSearch;

import javax.ejb.EJBObject;
import java.rmi.RemoteException;
import java.util.ArrayList;

public interface Search extends EJBObject {

    public MemberSearch getCoders(MemberSearch search)
            throws RemoteException;

    public MemberSearch scroll(MemberSearch search)
            throws RemoteException;

    public ArrayList getReferrals(int userId)
            throws RemoteException;

}
