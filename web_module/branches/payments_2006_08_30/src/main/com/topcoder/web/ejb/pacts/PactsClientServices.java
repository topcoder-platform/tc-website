package com.topcoder.web.ejb.pacts;

import java.rmi.RemoteException;
import java.sql.SQLException;

import javax.ejb.EJBObject;

import com.topcoder.web.tc.controller.legacy.pacts.common.IllegalUpdateException;


public interface PactsClientServices extends EJBObject {

    ProblemPayment addProblemWritingPayment(long coderId, double grossAmount, long problemId) 
    	throws RemoteException, IllegalUpdateException, SQLException;

}

