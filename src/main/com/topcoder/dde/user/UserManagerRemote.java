package com.topcoder.dde.user;

import com.topcoder.dde.DDEException;
import com.topcoder.security.TCSubject;
import com.topcoder.security.login.AuthenticationException;

import javax.ejb.EJBException;
import java.rmi.RemoteException;

public interface UserManagerRemote extends javax.ejb.EJBObject {

    boolean sampleInquiry(String firstName, String lastName,
                          String emailAddress, String catalog, int countryId, int contactMe)
            throws RemoteException, EJBException;


    User register(RegistrationInfo info)
            throws RemoteException, DDEException, DuplicateUsernameException,
            InvalidRegistrationException, EJBException;

    User register(RegistrationInfo info, boolean sendActivationCode)
            throws RemoteException, DDEException, DuplicateUsernameException,
            InvalidRegistrationException, EJBException;

    User activate(String activationCode)
            throws RemoteException, DDEException, NoSuchUserException, EJBException;

    void updateUser(User user)
            throws RemoteException, DDEException, NoSuchUserException,
            InvalidRegistrationException, EJBException;

    void removeUser(User user)
            throws RemoteException, DDEException, NoSuchUserException, EJBException;

    void removeUser(String username)
            throws RemoteException, DDEException, NoSuchUserException, EJBException;

    User getUser(String username)
            throws RemoteException, DDEException, NoSuchUserException, EJBException;

    User getUser(long userId)
            throws RemoteException, DDEException, NoSuchUserException, EJBException;

    java.util.Collection getPricingTiers()
            throws RemoteException, DDEException, EJBException;

    TCSubject login(String username, String password)
            throws RemoteException, AuthenticationException, UserNotActivatedException, DDEException, EJBException;

    void sendPasswordEmail(String username)
            throws RemoteException, DDEException, NoSuchUserException, EJBException;

    void registerInquiry(long userId, long componentId, long rating, long tcUserId, String Comments, boolean agreeToTerms, long phase, long version, long projectId)
            throws RemoteException, DDEException, NoSuchUserException, EJBException;

/*
    long getRatingForInquiry(long userId, long version, long componentId)
        throws RemoteException, DDEException, NoSuchUserException, EJBException;
*/

}
