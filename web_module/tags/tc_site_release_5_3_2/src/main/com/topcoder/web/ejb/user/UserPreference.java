package com.topcoder.web.ejb.user;

import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;

import javax.ejb.EJBException;
import javax.ejb.EJBObject;
import java.rmi.RemoteException;

/**
 * @author dok
 * Date: Jan 20, 2004
 */
public interface UserPreference extends EJBObject {
    void createUserPreference(long userId, int preferenceId, String dataSource) throws EJBException, RemoteException;

    void removeUserPreference(long userId, int preferenceId, String dataSource) throws EJBException, RemoteException;

    void setValue(long userId, int preferenceId, String value, String dataSource) throws EJBException, RemoteException;

    String getValue(long userId, int preferenceId, String dataSource) throws EJBException, RemoteException;

    void setPreferenceValueID(long userId, int preferenceId, int valueId, String dataSource) throws EJBException, RemoteException;

    int getPreferenceValueID(long userId, int preferenceId, String dataSource) throws EJBException, RemoteException;

    ResultSetContainer getPreferencesByGroup(long userId, int groupId, String dataSource) throws EJBException, RemoteException;
}
