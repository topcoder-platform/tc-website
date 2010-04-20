package com.topcoder.web.ejb.forumpoll;

import javax.ejb.EJBObject;
import java.rmi.RemoteException;
import javax.ejb.EJBException;

import java.util.Hashtable;

public interface ForumPoll extends EJBObject {

    public int getVoterCountByPoll(long pollID, String dataSource) throws EJBException, RemoteException;

    public Hashtable getVoterCountByThread(long threadID, String dataSource) throws EJBException, RemoteException;
    
    public Hashtable getVoterCounts(String dataSource) throws EJBException, RemoteException;
}