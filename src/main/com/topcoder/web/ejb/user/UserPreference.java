package com.topcoder.web.ejb.user;

import javax.ejb.EJBObject;
import javax.ejb.EJBException;
import java.rmi.RemoteException;

/**
 * @author dok
 * Date: Jan 20, 2004
 */
public interface UserPreference extends EJBObject  {
    void createUserPreference(long userId, int preferenceId, String dataSource) throws EJBException,RemoteException;
    void removeUserPreference(long userId, int preferenceId, String dataSource) throws EJBException,RemoteException;
    void setValue(long userId, int preferenceId, String value, String dataSource) throws EJBException,RemoteException;
    String getValue(long userId, int preferenceId, String dataSource) throws EJBException,RemoteException;
}
