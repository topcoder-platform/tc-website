package com.topcoder.web.ejb.requestservices;

import com.topcoder.shared.util.logging.Logger;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.ejb.BaseEJB;

import javax.ejb.EJBException;
import javax.naming.InitialContext;
import java.sql.Timestamp;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 * User: dok
 * Date: Nov 19, 2004
 * Time: 11:18:50 AM
 */
public class RequestServicesBean extends BaseEJB {

    private final static Logger log = Logger.getLogger(RequestServicesBean.class);

    public void createRequest(long userId, String url, Timestamp time, String dataSource) {
        log.debug("createRequest called. url: " + url
                + " userId: " + userId + " time: " + time);

        StringBuffer query = new StringBuffer(200);
        query.append("insert into request (user_id, url, create_date) ");
        query.append(" values (?, ?, ?)");

        Connection conn = null;
        PreparedStatement ps = null;
        InitialContext ctx = null;
        try {
            conn = DBMS.getConnection(dataSource);
            ps = conn.prepareStatement(query.toString());
            ps.setLong(1, userId);
            ps.setString(2, url);
            ps.setTimestamp(3, time);

            ps.executeUpdate();
        } catch (SQLException e) {
            DBMS.printSqlException(true, e);
            throw(new EJBException(e.getMessage()));
        } finally {
            close(ps);
            close(conn);
            close(ctx);
        }
    }

    public void createRequest(String url, Timestamp time, String dataSource) {
        log.debug("createRequest called. url: " + url + " time: " + time);
        StringBuffer query = new StringBuffer(200);
        query.append("insert into request (url, create_date) ");
        query.append(" values (?, ?)");

        Connection conn = null;
        PreparedStatement ps = null;
        InitialContext ctx = null;
        try {
            conn = DBMS.getConnection(dataSource);
            ps = conn.prepareStatement(query.toString());
            ps.setString(1, url);
            ps.setTimestamp(2, time);

            ps.executeUpdate();
        } catch (SQLException e) {
            DBMS.printSqlException(true, e);
            throw(new EJBException(e.getMessage()));
        } finally {
            close(ps);
            close(conn);
            close(ctx);
        }
    }

}
