package com.topcoder.web.ejb.pacts;

import java.rmi.RemoteException;
import java.sql.SQLException;
import java.util.List;

import javax.ejb.EJBObject;


public interface PactsClientServices extends EJBObject {

    void fillPaymentData(BasePayment payment) throws RemoteException, SQLException;

    void addPayment(BasePayment payment)  throws RemoteException, SQLException;

    void updatePayment(BasePayment payment) throws RemoteException, Exception;

    public List findPayments(int paymentTypeId) throws RemoteException, Exception;

    public List findPayments(int paymentTypeId, long referenceId) throws RemoteException, Exception;

    public List findCoderPayments(long coderId) throws RemoteException, Exception;
    
    public List findCoderPayments(long coderId, int paymentTypeId) throws RemoteException, Exception;
    
    public List findCoderPayments(long coderId, int paymentTypeId, long referenceId) throws RemoteException, Exception;

}

