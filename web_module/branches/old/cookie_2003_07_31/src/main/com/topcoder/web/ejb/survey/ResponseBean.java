package com.topcoder.web.ejb.survey;

import com.topcoder.web.ejb.BaseEJB;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.shared.util.DBMS;

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
    private final static String DATA_SOURCE = "java:comp/env/datasource_name";
    private final static String JTS_DATA_SOURCE = "java:comp/env/jts_datasource_name";

    public void createResponse(long userId, long questionId) {
        log.debug("createResponse called... user_id="+userId+" questionId="+questionId);

        Context ctx = null;
        PreparedStatement ps = null;
        Connection conn = null;
        DataSource ds = null;

        try {
            ctx = new InitialContext();

            ds = (DataSource) ctx.lookup(JTS_DATA_SOURCE);
            conn = ds.getConnection();

            ps = conn.prepareStatement("INSERT INTO response (user_id, question_id) VALUES (?,?)");
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



    public void setAnswerId(long userId, long questionId, long answerId) {
        log.debug("setAnswerId called... user_id="+userId+" questionId="+questionId+" answerId="+answerId);

        Context ctx = null;
        PreparedStatement ps = null;
        Connection conn = null;
        DataSource ds = null;

        try {
            ctx = new InitialContext();

            ds = (DataSource) ctx.lookup(JTS_DATA_SOURCE);
            conn = ds.getConnection();

            ps = conn.prepareStatement("UPDATE response SET answer_id = ? WHERE coder_id = ? AND question_id = ?");
            ps.setLong(1, answerId);
            ps.setLong(2, userId);
            ps.setLong(3, questionId);

            int rows = ps.executeUpdate();

            if (rows != 1)
                throw new EJBException("Wrong number of rows in insert: " + rows);
        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new EJBException("SQLException updating user_id="+userId+" questionId="+questionId+" answerId="+answerId);
        } catch (NamingException e) {
            throw new EJBException("NamingException updating user_id="+userId+" questionId="+questionId+" answerId="+answerId);
        } catch (Exception e) {
            throw new EJBException("Exception updating user_id="+userId+" questionId="+questionId+" answerId="+
                    answerId+":\n" + e.getMessage());
        } finally {
            close(ps);
            close(conn);
            close(ctx);
        }
    }

    public void setResponseText(long userId, long questionId, String text) {
        log.debug("createResponse called... user_id="+userId+" questionId="+questionId);

        Context ctx = null;
        PreparedStatement ps = null;
        Connection conn = null;
        DataSource ds = null;

        try {
            ctx = new InitialContext();

            ds = (DataSource) ctx.lookup(JTS_DATA_SOURCE);
            conn = ds.getConnection();

            ps = conn.prepareStatement("UPDATE response set response = ? WHERE user_id = ? AND question_id = ?");
            ps.setBytes(1, DBMS.serializeTextString(text));
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


    public boolean exists(long userId, long questionId) {
        log.debug("exists called... user_id="+userId+" questionId="+questionId);

        Context ctx = null;
        PreparedStatement ps = null;
        Connection conn = null;
        DataSource ds = null;

        try {
            ctx = new InitialContext();

            ds = (DataSource) ctx.lookup(DATA_SOURCE);
            conn = ds.getConnection();

            ps = conn.prepareStatement("SELECT '1' FROM response WHERE user_id = ? AND question_id = ?");
            ps.setLong(1, userId);
            ps.setLong(2, questionId);

            ResultSet rs = ps.executeQuery();
            return rs.next();
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

}
