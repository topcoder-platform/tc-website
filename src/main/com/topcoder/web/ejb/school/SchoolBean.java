package com.topcoder.web.ejb.school;

import com.topcoder.util.idgenerator.IdGenerator;
import com.topcoder.util.idgenerator.sql.SimpleDB;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.ejb.BaseEJB;

import javax.ejb.EJBException;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class SchoolBean extends BaseEJB {
    private static Logger log = Logger.getLogger(SchoolBean.class);
    private final static String DATA_SOURCE = "java:comp/env/datasource_name";
    private final static String JTS_DATA_SOURCE = "java:comp/env/jts_datasource_name";

    public long createSchool() throws EJBException {

        long school_id = 0;

        Connection conn = null;
        PreparedStatement ps = null;
        InitialContext ctx = null;
        try {
            ctx = new InitialContext();

            DataSource ds = (DataSource) ctx.lookup(JTS_DATA_SOURCE);

            if (!IdGenerator.isInitialized()) {
                IdGenerator.init(new SimpleDB(), (DataSource) ctx.lookup(DATA_SOURCE), "sequence_object", "name",
                        "current_value", 9999999999L, 1, false);
            }

            school_id = IdGenerator.nextId("SCHOOL_SEQ");

            StringBuffer query = new StringBuffer(1024);
            query.append("INSERT ");
            query.append("INTO school (school_id) ");
            query.append("VALUES (?)");

            conn = ds.getConnection();
            ps = conn.prepareStatement(query.toString());
            ps.setLong(1, school_id);

            int rc = ps.executeUpdate();
            if (rc != 1) {
                throw(new EJBException("Wrong number of rows inserted into " +
                        "'school'. Inserted " + rc + ", should have " +
                        "inserted 1."));
            }
        } catch (SQLException _sqle) {
            DBMS.printSqlException(true, _sqle);
            throw(new EJBException(_sqle.getMessage()));
        } catch (NamingException _ne) {
            _ne.printStackTrace();
            throw(new EJBException(_ne.getMessage()));
        } finally {
            close(ps);
            close(conn);
            close(ctx);
        }
        return (school_id);
    }

    public void setSchoolDivisionCode(long schoolId,
                                      String _school_division_code)
            throws EJBException {

        Connection conn = null;
        PreparedStatement ps = null;

        InitialContext ctx = null;
        try {
            ctx = new InitialContext();

            DataSource ds = (DataSource) ctx.lookup(JTS_DATA_SOURCE);

            StringBuffer query = new StringBuffer(1024);
            query.append("UPDATE school ");
            query.append("SET school_division_code=? ");
            query.append("WHERE school_id=?");

            conn = ds.getConnection();
            ps = conn.prepareStatement(query.toString());
            ps.setString(1, _school_division_code);
            ps.setLong(2, schoolId);

            int rc = ps.executeUpdate();
            if (rc != 1) {
                throw(new EJBException("Wrong number of rows updated in 'school'. " +
                        "Updated " + rc + ", should have updated 1."));
            }
        } catch (SQLException _sqle) {
            DBMS.printSqlException(true, _sqle);
            throw(new EJBException(_sqle.getMessage()));
        } catch (NamingException _ne) {
            _ne.printStackTrace();
            throw(new EJBException(_ne.getMessage()));
        } finally {
            close(ps);
            close(conn);
            close(ctx);
        }
    }

    public void setFullName(long schoolId, String _full_name)
            throws EJBException {

        Connection conn = null;
        PreparedStatement ps = null;

        InitialContext ctx = null;
        try {
            ctx = new InitialContext();

            DataSource ds = (DataSource) ctx.lookup(JTS_DATA_SOURCE);

            StringBuffer query = new StringBuffer(1024);
            query.append("UPDATE school ");
            query.append("SET full_name=? ");
            query.append("WHERE school_id=?");

            conn = ds.getConnection();
            ps = conn.prepareStatement(query.toString());
            ps.setString(1, _full_name);
            ps.setLong(2, schoolId);

            int rc = ps.executeUpdate();
            if (rc != 1) {
                throw(new EJBException("Wrong number of rows updated in 'school'. " +
                        "Updated " + rc + ", should have updated 1."));
            }
        } catch (SQLException _sqle) {
            DBMS.printSqlException(true, _sqle);
            throw(new EJBException(_sqle.getMessage()));
        } catch (NamingException _ne) {
            _ne.printStackTrace();
            throw(new EJBException(_ne.getMessage()));
        } finally {
            close(ps);
            close(conn);
            close(ctx);
        }
    }

    public void setShortName(long schoolId, String _short_name)
            throws EJBException {

        Connection conn = null;
        PreparedStatement ps = null;

        InitialContext ctx = null;
        try {
            ctx = new InitialContext();

            DataSource ds = (DataSource) ctx.lookup(JTS_DATA_SOURCE);

            StringBuffer query = new StringBuffer(1024);
            query.append("UPDATE school ");
            query.append("SET short_name=? ");
            query.append("WHERE school_id=?");

            conn = ds.getConnection();
            ps = conn.prepareStatement(query.toString());
            ps.setString(1, _short_name);
            ps.setLong(2, schoolId);

            int rc = ps.executeUpdate();
            if (rc != 1) {
                throw(new EJBException("Wrong number of rows updated in 'school'. " +
                        "Updated " + rc + ", should have updated 1."));
            }
        } catch (SQLException _sqle) {
            DBMS.printSqlException(true, _sqle);
            throw(new EJBException(_sqle.getMessage()));
        } catch (NamingException _ne) {
            _ne.printStackTrace();
            throw(new EJBException(_ne.getMessage()));
        } finally {
            close(ps);
            close(conn);
            close(ctx);
        }
    }

    public String getSchoolDivisionCode(long schoolId)
            throws EJBException {

        String school_division_code = null;

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        InitialContext ctx = null;
        try {
            ctx = new InitialContext();

            DataSource ds = (DataSource) ctx.lookup(DATA_SOURCE);

            StringBuffer query = new StringBuffer(1024);
            query.append("SELECT school_division_code ");
            query.append("FROM school ");
            query.append("WHERE school_id=?");

            conn = ds.getConnection();
            ps = conn.prepareStatement(query.toString());
            ps.setLong(1, schoolId);

            rs = ps.executeQuery();
            if (rs.next()) {
                school_division_code = rs.getString(1);
            } else {
                throw(new EJBException("No rows found when selecting from 'school' " +
                        "with school_id=" + schoolId + "."));
            }
        } catch (SQLException _sqle) {
            DBMS.printSqlException(true, _sqle);
            throw(new EJBException(_sqle.getMessage()));
        } catch (NamingException _ne) {
            _ne.printStackTrace();
            throw(new EJBException(_ne.getMessage()));
        } finally {
            close(rs);
            close(ps);
            close(conn);
            close(ctx);
        }
        return (school_division_code);
    }

    public String getFullName(long schoolId)
            throws EJBException {

        String full_name = null;

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        InitialContext ctx = null;
        try {
            ctx = new InitialContext();

            DataSource ds = (DataSource) ctx.lookup(DATA_SOURCE);

            StringBuffer query = new StringBuffer(1024);
            query.append("SELECT full_name ");
            query.append("FROM school ");
            query.append("WHERE school_id=?");

            conn = ds.getConnection();
            ps = conn.prepareStatement(query.toString());
            ps.setLong(1, schoolId);

            rs = ps.executeQuery();
            if (rs.next()) {
                full_name = rs.getString(1);
            } else {
                throw(new EJBException("No rows found when selecting from 'school' " +
                        "with school_id=" + schoolId + "."));
            }
        } catch (SQLException _sqle) {
            DBMS.printSqlException(true, _sqle);
            throw(new EJBException(_sqle.getMessage()));
        } catch (NamingException _ne) {
            _ne.printStackTrace();
            throw(new EJBException(_ne.getMessage()));
        } finally {
            close(rs);
            close(ps);
            close(conn);
            close(ctx);
        }
        return (full_name);
    }

    public String getShortName(long schoolId)
            throws EJBException {

        String short_name = null;

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        InitialContext ctx = null;
        try {
            ctx = new InitialContext();

            DataSource ds = (DataSource) ctx.lookup(DATA_SOURCE);

            StringBuffer query = new StringBuffer(1024);
            query.append("SELECT short_name ");
            query.append("FROM school ");
            query.append("WHERE school_id=?");

            conn = ds.getConnection();
            ps = conn.prepareStatement(query.toString());
            ps.setLong(1, schoolId);

            rs = ps.executeQuery();
            if (rs.next()) {
                short_name = rs.getString(1);
            } else {
                throw(new EJBException("No rows found when selecting from 'school' " +
                        "with school_id=" + schoolId + "."));
            }
        } catch (SQLException _sqle) {
            DBMS.printSqlException(true, _sqle);
            throw(new EJBException(_sqle.getMessage()));
        } catch (NamingException _ne) {
            _ne.printStackTrace();
            throw(new EJBException(_ne.getMessage()));
        } finally {
            close(rs);
            close(ps);
            close(conn);
            close(ctx);
        }
        return (short_name);
    }

}

;
