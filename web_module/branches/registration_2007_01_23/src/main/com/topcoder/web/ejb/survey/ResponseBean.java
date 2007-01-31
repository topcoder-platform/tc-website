package com.topcoder.web.ejb.survey;

import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.IdGeneratorClient;
import com.topcoder.web.ejb.BaseEJB;

import javax.ejb.EJBException;
import javax.naming.Context;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ResponseBean extends BaseEJB {

    private static final Logger log = Logger.getLogger(ResponseBean.class);

    public void createResponse(long userId, long questionId, long answerId) {
        log.debug("createResponse called... user_id=" + userId + " questionId=" + questionId + " answerId=" + answerId);

        Context ctx = null;
        PreparedStatement ps = null;
        Connection conn = null;

        long responseId = 0;
        try {
            conn = DBMS.getConnection(DBMS.JTS_OLTP_DATASOURCE_NAME);
            responseId = IdGeneratorClient.getSeqId("RESPONSE_SEQ");

            ps = conn.prepareStatement("INSERT INTO response (response_id, user_id, question_id, answer_id) VALUES (?,?,?,?)");
            ps.setLong(1, responseId);
            ps.setLong(2, userId);
            ps.setLong(3, questionId);
            ps.setLong(4, answerId);

            int rows = ps.executeUpdate();

            if (rows != 1)
                throw new EJBException("Wrong number of rows in insert: " + rows);
        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new EJBException("SQLException creating response responseId=" + responseId + " user_id=" + userId + " questionId=" + questionId + " answerId=" + answerId);
        } catch (Exception e) {
            throw new EJBException("Exception creating response responseId=" + responseId + " user_id=" + userId + " questionId=" + questionId + " answerId=" + answerId +
                    ":\n" + e.getMessage());
        } finally {
            close(ps);
            close(conn);
            close(ctx);
        }
    }

    public void createResponse(long userId, long questionId, String text) {
        log.debug("createResponse called... user_id=" + userId + " questionId=" + questionId + " text=" + text);

        Context ctx = null;
        PreparedStatement ps = null;
        Connection conn = null;

        long responseId = 0;
        try {
            conn = DBMS.getConnection(DBMS.JTS_OLTP_DATASOURCE_NAME);
            responseId = IdGeneratorClient.getSeqId("RESPONSE_SEQ");

            ps = conn.prepareStatement("INSERT INTO response (response_id, user_id, question_id, response) VALUES (?,?,?,?)");
            ps.setLong(1, responseId);
            ps.setLong(2, userId);
            ps.setLong(3, questionId);
            ps.setString(4, text);

            int rows = ps.executeUpdate();

            if (rows != 1)
                throw new EJBException("Wrong number of rows in insert: " + rows);
        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new EJBException("SQLException creating response responseId=" + responseId + " user_id=" + userId + " questionId=" + questionId + " text=" + text);
        } catch (Exception e) {
            throw new EJBException("Exception creating response responseId=" + responseId + " user_id=" + userId + " questionId=" + questionId + " text=" + text +
                    ":\n" + e.getMessage());
        } finally {
            close(ps);
            close(conn);
            close(ctx);
        }
    }


    public boolean exists(long userId, long questionId) {
        log.debug("exists called... user_id=" + userId + " questionId=" + questionId);

        Context ctx = null;
        PreparedStatement ps = null;
        Connection conn = null;
        ResultSet rs = null;

        try {
            conn = DBMS.getConnection(DBMS.JTS_OLTP_DATASOURCE_NAME);

            ps = conn.prepareStatement("SELECT '1' FROM response WHERE user_id = ? AND question_id = ?");
            ps.setLong(1, userId);
            ps.setLong(2, questionId);

            rs = ps.executeQuery();
            return rs.next();
        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new EJBException("SQLException exists user_id=" + userId + " questionId=" + questionId);
        } catch (Exception e) {
            throw new EJBException("Exception exists user_id=" + userId + " questionId=" + questionId + ":\n" + e.getMessage());
        } finally {
            close(rs);
            close(ps);
            close(conn);
            close(ctx);
        }
    }

    public boolean exists(long responseId) {
        log.debug("exists called... responseId=" + responseId);

        Context ctx = null;
        PreparedStatement ps = null;
        Connection conn = null;
        ResultSet rs = null;

        try {
            conn = DBMS.getConnection(DBMS.JTS_OLTP_DATASOURCE_NAME);

            ps = conn.prepareStatement("SELECT '1' FROM response WHERE response_id = ?");
            ps.setLong(1, responseId);

            rs = ps.executeQuery();
            return rs.next();
        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new EJBException("SQLException exists responseId=" + responseId);
        } catch (Exception e) {
            throw new EJBException("Exception exists responseId=" + responseId + ":\n" + e.getMessage());
        } finally {
            close(rs);
            close(ps);
            close(conn);
            close(ctx);
        }
    }

}
