package com.topcoder.web.ejb.userevent;

import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.web.common.RowNotFoundException;

import javax.ejb.EJBObject;
import java.rmi.RemoteException;
import java.sql.Date;

/**
 * @author dok
 *         Date: Apr 2, 2004
 */
public interface UserEvent extends EJBObject {

    void createUserEvent(long userId, int statusId, int eventId, Date eventDate, String dataSource) throws RemoteException;

    ResultSetContainer getUserEventsByStatus(int statusId, String dataSource) throws RemoteException;

    void setUserEventStatus(long userEventId, int statusId, String dataSource) throws RemoteException;

    void setUserId(long userEventId, long userId, String dataSource) throws RemoteException;

    void setEventId(long userEventId, int eventId, String dataSource) throws RemoteException;

    void setEventDate(long userEventId, Date eventDate, String dataSource) throws RemoteException;

    int getUserEventStatus(long userEventId, String dataSource) throws RowNotFoundException, RemoteException;

    long getUserId(long userEventId, String dataSource) throws RowNotFoundException, RemoteException;

    int getEventId(long userEventId, String dataSource) throws RowNotFoundException, RemoteException;

    Date getEventDate(long userEventId, String dataSource) throws RowNotFoundException, RemoteException;

}
