package com.topcoder.web.ejb.demographic;

import com.topcoder.web.ejb.BaseEJB;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import javax.ejb.EJBException;
import java.sql.PreparedStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.ResultSet;

public class ResponseBean extends BaseEJB {

    private static Logger log = Logger.getLogger(ResponseBean.class);

    public void createResponse(long userId, long questionId, String dataSource) {
        log.debug("createResponse called... user_id="+userId+" questionId="+questionId);

        Context ctx = null;
        PreparedStatement ps = null;
        Connection conn = null;
        DataSource ds = null;

        try {
            ctx = new InitialContext();

            ds = (DataSource) ctx.lookup(dataSource);
            conn = ds.getConnection();

            ps = conn.prepareStatement("INSERT INTO demographic_response (coder_id, demographic_question_id) VALUES (?,?)");
            ps.setLong(1, userId);
            ps.setLong(2, questionId);

            int rows = ps.executeUpdate();

            if (rows != 1)
                throw new EJBException("Wrong number of rows in insert: " + rows);
        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new EJBException("SQLException creating response user_id="+userId+" questionId="+questionId);
        } catch (NamingException e) {
            throw new EJBException("NamingException creating response user_id="+userId+" questionId="+questionId);
        } catch (Exception e) {
            throw new EJBException("Exception creating response user_id="+userId+" questionId="+
                    questionId+":\n" + e.getMessage());
        } finally {
            close(ps);
            close(conn);
            close(ctx);
        }
    }



    public void setAnswerId(long userId, long questionId, long answerId, String dataSource) {
        log.debug("setAnswerId called... user_id="+userId+" questionId="+questionId+" answerId="+answerId);

        Context ctx = null;
        PreparedStatement ps = null;
        Connection conn = null;
        DataSource ds = null;

        try {
            ctx = new InitialContext();

            ds = (DataSource) ctx.lookup(dataSource);
            conn = ds.getConnection();

            ps = conn.prepareStatement("UPDATE demographic_response set demographic_answer_id = ? WHERE coder_id = ? AND demographic_question_id = ?");
            ps.setLong(1, answerId);
            ps.setLong(2, userId);
            ps.setLong(3, questionId);

            int rows = ps.executeUpdate();

            if (rows != 1)
                throw new EJBException("Wrong number of rows in update: " + rows);
        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new EJBException("SQLException updating user_id="+userId+" questionId="+questionId+" answerId="+answerId);
        } catch (NamingException e) {
            throw new EJBException("NamingException updating user_id="+userId+" questionId="+questionId+" answerId="+answerId);
        } catch (Exception e) {
            throw new EJBException("Exception creating user_id="+userId+" questionId="+questionId+" answerId="+
                    answerId+":\n" + e.getMessage());
        } finally {
            close(ps);
            close(conn);
            close(ctx);
        }
    }

    public void setResponseText(long userId, long questionId, String text, String dataSource) {
        log.debug("setResponseText called... user_id="+userId+" questionId="+questionId);

        Context ctx = null;
        PreparedStatement ps = null;
        Connection conn = null;
        DataSource ds = null;

        try {
            ctx = new InitialContext();

            ds = (DataSource) ctx.lookup(dataSource);
            conn = ds.getConnection();

            ps = conn.prepareStatement("UPDATE demographic_response set demographic_response = ? WHERE coder_id = ? AND demographic_question_id = ?");
            ps.setString(1, text);
            ps.setLong(2, userId);
            ps.setLong(3, questionId);

            int rows = ps.executeUpdate();

            if (rows != 1)
                throw new EJBException("Wrong number of rows in insert: " + rows);
        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new EJBException("SQLException creating user_id="+userId+" questionId="+questionId);
        } catch (NamingException e) {
            throw new EJBException("NamingException creating user_id="+userId+" questionId="+questionId);
        } catch (Exception e) {
            throw new EJBException("Exception creating user_id="+userId+" questionId="+questionId+":\n" + e.getMessage());
        } finally {
            close(ps);
            close(conn);
            close(ctx);
        }
    }


    public ResultSetContainer getResponses(long userId, String dataSource) {
        log.debug("getResponses called... user_id="+userId);

        Context ctx = null;
        PreparedStatement ps = null;
        Connection conn = null;
        DataSource ds = null;
        ResultSet rs = null;

        try {
            ctx = new InitialContext();

            ds = (DataSource) ctx.lookup(dataSource);
            conn = ds.getConnection();

            StringBuffer query = new StringBuffer(500);
            query.append("SELECT dr.demographic_question_id");
            query.append("     , dr.demographic_answer_id");
            query.append("     , dr.demographic_response");
            query.append("     , dass.sort");
            query.append("  FROM demographic_response dr");
            query.append("     , user u");
            query.append("     , coder c");
            query.append("     , demographic_assignment dass");
            query.append(" WHERE dass.demographic_question_id = dr.demographic_question_id");
            query.append("   AND c.coder_id = u.user_id");
            query.append("   AND c.coder_type_id = dass.coder_type_id");
            query.append("   AND dr.coder_id = ?");
            query.append("   AND dr.coder_id = u.user_id");
            query.append(" ORDER BY dass.sort ASC");

            ps = conn.prepareStatement(query.toString());
            ps.setLong(1, userId);

            rs = ps.executeQuery();
            ResultSetContainer ret = new ResultSetContainer(rs);
            return ret;
        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new EJBException("SQLException getting responses for user="+userId);
        } catch (NamingException e) {
            throw new EJBException("NamingException getting responses for user="+userId);
        } catch (Exception e) {
            throw new EJBException("Exception getting responses for user="+userId+":\n" + e.getMessage());
        } finally {
            close(rs);
            close(ps);
            close(conn);
            close(ctx);
        }
    }


}
