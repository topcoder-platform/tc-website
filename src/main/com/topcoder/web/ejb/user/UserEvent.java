/*
 * UserEvent.java
 *
 * Created on August 9, 2004, 3:03 PM
 */

package com.topcoder.web.ejb.user;

import javax.ejb.EJBObject;
import javax.ejb.EJBException;
import java.rmi.RemoteException;

/**
 *
 * @author  rfairfax
 */
public interface UserEvent extends EJBObject {
    
    void createUserEvent(long userId, long eventId, String dataSource) throws EJBException,RemoteException;
    
}
