package com.topcoder.web.ejb.demographic;

import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.ejb.BaseEJB;

import javax.ejb.EJBException;
import javax.naming.Context;
import javax.naming.NamingException;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ResponseBean extends BaseEJB {

    private static Logger log = Logger.getLogger(ResponseBean.class);

    public void createResponse(long userId, long questionId, long answerId, String dataSource) {
        log.debug("createResponse called... user_id=" + userId + " questionId=" + questionId + " answerId=" + answerId);

        Context ctx = null;
        PreparedStatement ps = null;
        Connection conn = null;
        DataSource ds = null;

        try {
            conn = DBMS.getConnection(dataSource);

            ps = conn.prepareStatement("INSERT INTO demographic_response (user_id, demographic_question_id, demographic_answer_id) VALUES (?,?,?)");
            ps.setLong(1, userId);
            ps.setLong(2, questionId);
            ps.setLong(3, answerId);

            int rows = ps.executeUpdate();

            if (rows != 1)
                throw new EJBException("Wrong number of rows in insert: " + rows);
        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new EJBException("SQLException creating response user_id=" + userId + " questionId=" + questionId + " answerId=" + answerId);
        } catch (Exception e) {
            throw new EJBException("Exception creating response user_id=" + userId + " questionId=" +
                    questionId + " answerId=" + answerId + ":\n" + e.getMessage());
        } finally {
            close(ps);
            close(conn);
            close(ctx);
        }
    }


    public void createResponse(long userId, long questionId, String answerText, String dataSource) {
        log.debug("createResponse called... user_id=" + userId + " questionId=" + questionId + " answerText=" + answerText);

        Context ctx = null;
        PreparedStatement ps = null;
        Connection conn = null;
        DataSource ds = null;

        try {
            conn = DBMS.getConnection(dataSource);

            ps = conn.prepareStatement("INSERT INTO demographic_response (user_id, demographic_question_id, demographic_response) VALUES (?,?,?)");
            ps.setLong(1, userId);
            ps.setLong(2, questionId);
            ps.setString(3, answerText);

            int rows = ps.executeUpdate();

            if (rows != 1)
                throw new EJBException("Wrong number of rows in insert: " + rows);
        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new EJBException("SQLException creating response user_id=" + userId + " questionId=" + questionId + " answerText=" + answerText);
        } catch (Exception e) {
            throw new EJBException("Exception creating response user_id=" + userId + " questionId=" +
                    questionId + " answerText=" + answerText + ":\n" + e.getMessage());
        } finally {
            close(ps);
            close(conn);
            close(ctx);
        }
    }


    public ResultSetContainer getResponses(long userId, String dataSource) {
        log.debug("getResponses called... user_id=" + userId);

        Context ctx = null;
        PreparedStatement ps = null;
        Connection conn = null;
        DataSource ds = null;
        ResultSet rs = null;

        try {
            conn = DBMS.getConnection(dataSource);

            StringBuffer query = new StringBuffer(500);
            query.append("SELECT dr.demographic_question_id");
            query.append("     , dr.demographic_answer_id");
            query.append("     , dr.demographic_response");
            query.append("     , dass.sort");
            query.append("  FROM demographic_response dr");
            query.append("     , coder c");
            query.append("     , demographic_assignment dass");
            query.append(" WHERE dass.demographic_question_id = dr.demographic_question_id");
            query.append("   AND c.coder_id = dr.user_id");
            query.append("   AND c.coder_type_id = dass.coder_type_id");
            query.append("   AND dr.user_id = ?");
            query.append(" ORDER BY dass.sort ASC");

            ps = conn.prepareStatement(query.toString());
            ps.setLong(1, userId);

            rs = ps.executeQuery();
            ResultSetContainer ret = new ResultSetContainer(rs);
            return ret;
        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new EJBException("SQLException getting responses for user=" + userId);
        } catch (NamingException e) {
            throw new EJBException("NamingException getting responses for user=" + userId);
        } catch (Exception e) {
            throw new EJBException("Exception getting responses for user=" + userId + ":\n" + e.getMessage());
        } finally {
            close(rs);
            close(ps);
            close(conn);
            close(ctx);
        }
    }


    public int remove(long userId, long questionId, String dataSource) {
        log.debug("remove called... user_id=" + userId + " questionId=" + questionId);

        Context ctx = null;
        PreparedStatement ps = null;
        Connection conn = null;
        DataSource ds = null;

        try {
            conn = DBMS.getConnection(dataSource);

            StringBuffer query = new StringBuffer(500);
            query.append("DELETE FROM demographic_response WHERE demographic_question_id = ? AND user_id = ?");

            ps = conn.prepareStatement(query.toString());
            ps.setLong(1, questionId);
            ps.setLong(2, userId);

            int ret = ps.executeUpdate();
            return ret;
        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new EJBException("SQLException getting responses for user=" + userId);
        } catch (Exception e) {
            throw new EJBException("Exception getting responses for user=" + userId + ":\n" + e.getMessage());
        } finally {
            close(ps);
            close(conn);
            close(ctx);
        }
    }

}
