package com.topcoder.web.ejb.pacts;

import java.rmi.RemoteException;
import java.sql.SQLException;

import javax.ejb.EJBObject;


public interface PactsClientServices extends EJBObject {

    void fillPaymentData(BasePayment payment) throws RemoteException, SQLException;

    void addPayment(BasePayment payment)  throws RemoteException, SQLException;

}

