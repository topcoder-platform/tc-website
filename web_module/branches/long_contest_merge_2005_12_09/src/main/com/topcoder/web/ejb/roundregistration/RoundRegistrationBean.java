package com.topcoder.web.ejb.roundregistration;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.ejb.BaseEJB;

import javax.ejb.EJBException;
import javax.naming.Context;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class RoundRegistrationBean extends BaseEJB {

    private static final Logger log = Logger.getLogger(RoundRegistrationBean.class);

    public void createRoundRegistration(long userId, long roundId) throws EJBException {
        log.debug("createRoundRegistration called... user_id=" + userId + " roundId=" + roundId);

        Context ctx = null;
        PreparedStatement ps = null;
        Connection conn = null;

        try {
            conn = DBMS.getConnection(DBMS.JTS_OLTP_DATASOURCE_NAME);

            ps = conn.prepareStatement("INSERT INTO round_registration (round_id, coder_id, timestamp, eligible) VALUES (?,?,current,?)");
            ps.setLong(1, roundId);
            ps.setLong(2, userId);
            ps.setInt(3, 1);

            int rows = ps.executeUpdate();

            if (rows != 1)
                throw new EJBException("Wrong number of rows in insert: " + rows);
        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new EJBException("SQLException creating RoundRegistration user_id=" + userId + " roundId=" + roundId);
        } catch (Exception e) {
            throw new EJBException("Exception creating RoundRegistration user_id=" + userId + " roundId=" + roundId +
                    ":\n" + e.getMessage());
        } finally {
            close(ps);
            close(conn);
            close(ctx);
        }
    }
    
    public boolean exists(long userId, long roundId) throws EJBException {
        log.debug("exists called... user_id=" + userId + " roundId=" + roundId);

        Context ctx = null;
        PreparedStatement ps = null;
        Connection conn = null;
        ResultSet rs = null;
        try {
            conn = DBMS.getConnection(DBMS.JTS_OLTP_DATASOURCE_NAME);

            ps = conn.prepareStatement("SELECT * FROM round_registration WHERE coder_id = ? AND round_id = ?");
            ps.setLong(1, userId);
            ps.setLong(2, roundId);

            rs = ps.executeQuery();
            return rs.next();
        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new EJBException("SQLException exists user_id=" + userId + " roundId=" + roundId);
        } catch (Exception e) {
            throw new EJBException("Exception exists user_id=" + userId + " roundId=" + roundId + ":\n" + e.getMessage());
        } finally {
            close(rs);
            close(ps);
            close(conn);
            close(ctx);
        }
    
    }
}
