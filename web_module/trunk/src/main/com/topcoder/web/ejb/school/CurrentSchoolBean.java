package com.topcoder.web.ejb.school;

import com.topcoder.web.ejb.BaseEJB;
import com.topcoder.shared.util.DBMS;

import javax.ejb.EJBException;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.ResultSet;

public class CurrentSchoolBean extends BaseEJB {
    public void createCurrentSchool(long coderId, String dataSource) throws EJBException {

        Connection conn = null;
        PreparedStatement ps = null;
        InitialContext ctx = null;

        try {
            StringBuffer query = new StringBuffer(1024);
            query.append("INSERT ");
            query.append(  "INTO current_school (coder_id) ");
            query.append("VALUES (?)");

            ctx = new InitialContext();
            DataSource ds = (DataSource) ctx.lookup(dataSource);
            conn = ds.getConnection();
            ps = conn.prepareStatement(query.toString());
            ps.setLong(1, coderId);

            int rc = ps.executeUpdate();
            if (rc != 1) {
                throw(new EJBException("Wrong number of rows inserted into " +
                        "'current_school'. Inserted " + rc + ", should have " +
                        "inserted 1."));
            }
        } catch (SQLException sqle) {
            DBMS.printSqlException(true, sqle);
            throw(new EJBException(sqle.getMessage()));
        } catch (NamingException e) {
            e.printStackTrace();
        } finally {
            close(ps);
            close(conn);
            close(ctx);
        }

    }


    public void setSchoolName(long coderId, String schoolName, String dataSource) throws EJBException {

        Connection conn = null;
        PreparedStatement ps = null;
        InitialContext ctx = null;

        try {
            StringBuffer query = new StringBuffer(1024);
            query.append("UPDATE current_school SET school_name = ? WHERE coder_id = ?");

            ctx = new InitialContext();
            DataSource ds = (DataSource) ctx.lookup(dataSource);
            conn = ds.getConnection();
            ps = conn.prepareStatement(query.toString());
            ps.setString(1, schoolName);
            ps.setLong(2, coderId);

            int rc = ps.executeUpdate();
            if (rc != 1) {
                throw(new EJBException("Wrong number of rows udpated in " +
                        "'current_school'. Updated " + rc + ", should have " +
                        "updated 1."));
            }
        } catch (SQLException sqle) {
            DBMS.printSqlException(true, sqle);
            throw(new EJBException(sqle.getMessage()));
        } catch (NamingException e) {
            e.printStackTrace();
        } finally {
            close(ps);
            close(conn);
            close(ctx);
        }

    }


    public void setSchoolId(long coderId, long schoolId, String dataSource) throws EJBException {

        Connection conn = null;
        PreparedStatement ps = null;
        InitialContext ctx = null;

        try {
            StringBuffer query = new StringBuffer(1024);
            query.append("UPDATE current_school SET school_id = ? WHERE coder_id = ?");

            ctx = new InitialContext();
            DataSource ds = (DataSource) ctx.lookup(dataSource);
            conn = ds.getConnection();
            ps = conn.prepareStatement(query.toString());
            ps.setLong(1, schoolId);
            ps.setLong(2, coderId);

            int rc = ps.executeUpdate();
            if (rc != 1) {
                throw(new EJBException("Wrong number of rows udpated in " +
                        "'current_school'. Updated " + rc + ", should have " +
                        "updated 1."));
            }
        } catch (SQLException sqle) {
            DBMS.printSqlException(true, sqle);
            throw(new EJBException(sqle.getMessage()));
        } catch (NamingException e) {
            e.printStackTrace();
        } finally {
            close(ps);
            close(conn);
            close(ctx);
        }

    }


    public boolean exists(long coderId, String dataSource) throws EJBException {

        Connection conn = null;
        PreparedStatement ps = null;
        InitialContext ctx = null;
        ResultSet rs = null;
        boolean ret = false;

        try {
            StringBuffer query = new StringBuffer(1024);
            query.append("SELECT '1' ");
            query.append( " FROM current_school");
            query.append(" WHERE coder_id = ?");

            ctx = new InitialContext();
            DataSource ds = (DataSource) ctx.lookup(dataSource);
            conn = ds.getConnection();
            ps = conn.prepareStatement(query.toString());
            ps.setLong(1, coderId);

            rs = ps.executeQuery();
            ret = rs.next();
        } catch (SQLException sqle) {
            DBMS.printSqlException(true, sqle);
            throw(new EJBException(sqle.getMessage()));
        } catch (NamingException e) {
            e.printStackTrace();
        } finally {
            close(rs);
            close(ps);
            close(conn);
            close(ctx);
        }
        return ret;

    }


}
