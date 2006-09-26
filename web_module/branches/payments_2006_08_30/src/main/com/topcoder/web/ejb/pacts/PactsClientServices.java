package com.topcoder.web.ejb.pacts;

import java.rmi.RemoteException;
import java.sql.SQLException;
import java.util.List;

import javax.ejb.EJBObject;

/**
 * EJB for working with payments.
 * Each payment is represented by an instance of a BasePayment subclass, depending on its type.
 * All the payments that doesn't have any reference to a table, like contract, CCIP, Article and so on,
 * use the NoReferencePayment.
 * 
 * The payment objects can be created with a minimum of information, generally the coder id, gross amount, 
 * an id to a reference (like round_id) and sometimes a placed value just for creating a description.
 * Then, additional data is looked up when saving the payment and stored in the payment object, like the
 * status, description and so on.
 * 
 * 
 * @author Cucu
 *
 */
public interface PactsClientServices extends EJBObject {

	BasePayment fillPaymentData(BasePayment payment) throws RemoteException, SQLException;

    BasePayment addPayment(BasePayment payment)  throws RemoteException, SQLException;

    BasePayment updatePayment(BasePayment payment) throws RemoteException, Exception;

    List findPayments(int paymentTypeId) throws RemoteException, Exception;

    List findPayments(int paymentTypeId, long referenceId) throws RemoteException, Exception;

    List findCoderPayments(long coderId) throws RemoteException, Exception;
    
    List findCoderPayments(long coderId, int paymentTypeId) throws RemoteException, Exception;
    
    List findCoderPayments(long coderId, int paymentTypeId, long referenceId) throws RemoteException, Exception;

    void deletePayment(long paymentId) throws RemoteException, Exception;

    void deletePayment(BasePayment payment) throws RemoteException, Exception;

}

