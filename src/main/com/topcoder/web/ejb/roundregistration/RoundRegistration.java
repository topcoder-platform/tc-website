package com.topcoder.web.ejb.roundregistration;
import javax.ejb.EJBException;
import javax.ejb.EJBObject;
import java.rmi.RemoteException;
public interface RoundRegistration extends EJBObject {
    void createRoundRegistration(long userId, long roundId) throws RemoteException, EJBException;

    boolean exists(long userId, long roundId) throws RemoteException, EJBException;
}
