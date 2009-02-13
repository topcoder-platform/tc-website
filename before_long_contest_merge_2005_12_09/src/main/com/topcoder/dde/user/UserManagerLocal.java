package com.topcoder.dde.user;

import com.topcoder.dde.DDEException;
import com.topcoder.security.TCSubject;
import com.topcoder.security.login.AuthenticationException;

import javax.ejb.EJBException;

public interface UserManagerLocal extends javax.ejb.EJBLocalObject {

    public User register(RegistrationInfo info)
            throws EJBException, DDEException, DuplicateUsernameException,
            InvalidRegistrationException;

    public User activate(String activationCode)
            throws EJBException, DDEException, NoSuchUserException;

    public void updateUser(User user)
            throws EJBException, DDEException, NoSuchUserException,
            InvalidRegistrationException;

    public void removeUser(User user)
            throws EJBException, DDEException, NoSuchUserException;

    public void removeUser(String username)
            throws EJBException, DDEException, NoSuchUserException;

    public User getUser(String username)
            throws EJBException, DDEException, NoSuchUserException;

    public User getUser(long userId)
            throws EJBException, DDEException, NoSuchUserException;

    public java.util.Collection getPricingTiers()
            throws EJBException, DDEException;

    public TCSubject login(String username, String password)
            throws EJBException, AuthenticationException, UserNotActivatedException, DDEException;

    public void sendPasswordEmail(String username)
            throws EJBException, DDEException, NoSuchUserException;

    public void agreeToComponentTerms(long userId) throws EJBException;
    public String getComponentTerms() throws EJBException;
}
