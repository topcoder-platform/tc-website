package com.topcoder.web.ejb.user;

import javax.ejb.EJBObject;
import java.rmi.RemoteException;
import javax.ejb.EJBException;


/**
 * EJB object for User table get/set functions
 *
 * @author George Nassar
 * @version $Revision$
 */
public interface User extends EJBObject {
    /**
     *
     *
     * @see com.topcoder.web.ejb.user.UserBean#createUser
     */
    void createUser(long userId, String handle, char status)
               throws RemoteException, EJBException;

    /**
     *
     *
     * @see com.topcoder.web.ejb.user.UserBean#setFirstName
     */
    void setFirstName(long userId, String firstName)
               throws RemoteException, EJBException;

    /**
     *
     *
     * @see com.topcoder.web.ejb.user.UserBean#setLastName
     */
    void setLastName(long userId, String lastName)
              throws RemoteException, EJBException;

    /**
     *
     *
     * @see com.topcoder.web.ejb.user.UserBean#setUserStatusId
     */
    void setUserStatusId(long userId, long userStatusId)
                  throws RemoteException, EJBException;

    /**
     *
     *
     * @see com.topcoder.web.ejb.user.UserBean#getFirstName
     */
    String getFirstName(long userId) throws RemoteException, EJBException;

    /**
     *
     *
     * @see com.topcoder.web.ejb.user.UserBean#getLastName
     */
    String getLastName(long userId) throws RemoteException, EJBException;

    /**
     *
     *
     * @see com.topcoder.web.ejb.user.UserBean#getUserStatusId
     */
    long getUserStatusId(long userId) throws RemoteException, EJBException;
}
