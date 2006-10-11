package com.topcoder.web.ejb.userevent;

import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.ejb.BaseEJB;

import javax.ejb.EJBException;
import java.rmi.RemoteException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 * @author dok
 * Date: Apr 2, 2004
 */
public class UserEventBean extends BaseEJB {

    public void createUserEvent(long userId, int statusId, int eventId, Date eventDate, String dataSource) throws RemoteException {
        StringBuffer query = new StringBuffer(200);
        query.append("insert into user_event (user_id, status_id, event_id, event_date)");
        query.append(" values (?, ?, ?, ?)");

        Connection conn = null;
        PreparedStatement ps = null;
        try {

            conn = DBMS.getConnection(dataSource);
            ps = conn.prepareStatement(query.toString());

            ps.setLong(1, userId);
            ps.setInt(2, statusId);
            ps.setInt(3, eventId);
            ps.setDate(4, eventDate);

            int ret = ps.executeUpdate();
            if (ret != 1) {
                throw(new EJBException("Wrong number of rows inserted into " +
                        "'rboard_user'. Inserted " + ret + ", " +
                        "should have inserted 1."));
            }
        } catch (SQLException e) {
            DBMS.printSqlException(true, e);
            throw(new EJBException(e.getMessage()));
        } finally {
            close(ps);
            close(conn);
        }

    }

    public ResultSetContainer getUserEventsByStatus(int statusId, String dataSource) throws RemoteException {
        return selectSet("user_event",
                new String[]{"user_event_id", "user_id", "event_id", "status_id", "event_date"},
                new String[]{"status_id"},
                new String[]{String.valueOf(statusId)}, dataSource);
    }

    public void setUserEventStatus(long userEventId, int statusId, String dataSource) throws RemoteException {
        update("user_event",
                new String[]{"status_id"},
                new String[]{String.valueOf(statusId)},
                new String[]{"user_event_id"},
                new String[]{String.valueOf(userEventId)}, dataSource);
    }

    public void setUserId(long userEventId, long userId, String dataSource) throws RemoteException {
        update("user_event",
                new String[]{"user_id"},
                new String[]{String.valueOf(userId)},
                new String[]{"user_event_id"},
                new String[]{String.valueOf(userEventId)}, dataSource);
    }

    public void setEventId(long userEventId, int eventId, String dataSource) throws RemoteException {
        update("user_event",
                new String[]{"event_id"},
                new String[]{String.valueOf(eventId)},
                new String[]{"user_event_id"},
                new String[]{String.valueOf(userEventId)}, dataSource);
    }

    public void setEventDate(long userEventId, Date eventDate, String dataSource) throws RemoteException {
        updateDate("user_event", "event_date", eventDate,
                new String[]{"user_event_id"},
                new String[]{String.valueOf(userEventId)}, dataSource);

    }

    public int getUserEventStatus(long userEventId, String dataSource) throws RemoteException {
        return selectInt("user_event",
                "status_id",
                new String[]{"user_event_id"},
                new String[]{String.valueOf(userEventId)},
                dataSource).intValue();
    }

    public long getUserId(long userEventId, String dataSource) throws RemoteException {
        return selectLong("user_event",
                "user_id",
                new String[]{"user_event_id"},
                new String[]{String.valueOf(userEventId)},
                dataSource).longValue();

    }

    public int getEventId(long userEventId, String dataSource) throws RemoteException {
        return selectInt("user_event",
                "event_id",
                new String[]{"user_event_id"},
                new String[]{String.valueOf(userEventId)},
                dataSource).intValue();

    }

    public Date getEventDate(long userEventId, String dataSource) throws RemoteException {
        return selectDate("user_event", "event_date",
                new String[]{"user_event_id"},
                new String[]{String.valueOf(userEventId)}, dataSource);
    }

}
