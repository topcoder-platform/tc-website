package com.topcoder.web.ejb.requestservices;

import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.ejb.BaseEJB;

import javax.ejb.EJBException;
import javax.naming.Context;
import java.sql.PreparedStatement;
import java.sql.Connection;
import java.sql.SQLException;

/**
 * User: dok
 * Date: Nov 19, 2004
 * Time: 11:18:50 AM
 */
public class RequestServicesBean extends BaseEJB {

    private final static Logger log = Logger.getLogger(RequestServicesBean.class);

    public void createRequest(long userId, String url, String dataSource)
            throws EJBException {
        log.debug("createRequest called. url: " + url
                + " userId: " + userId);

        Context ctx = null;
        PreparedStatement ps = null;
        Connection conn = null;

        try {
            StringBuffer query = new StringBuffer(180);
            query.append("INSERT INTO request (user_id, url) ");
            query.append("VALUES(?,?) ");

            conn = DBMS.getConnection(dataSource);
            ps = conn.prepareStatement(query.toString());

            ps.setLong(1, userId);
            ps.setString(2, url);

            ps.executeUpdate();

        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new EJBException("SQLException in createNote userId: " + userId + " url: " + url);
        } catch (Exception e) {
            throw new EJBException("Exception in createNote userId: " + userId + " url: " + url);
        } finally {
            close(ps);
            close(conn);
            close(ctx);
        }
    }


}
