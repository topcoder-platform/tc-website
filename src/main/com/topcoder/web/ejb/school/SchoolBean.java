package com.topcoder.web.ejb.school;

import com.topcoder.util.idgenerator.IdGenerator;
import com.topcoder.util.idgenerator.sql.SimpleDB;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.ejb.BaseEJB;
import com.topcoder.web.ejb.idgeneratorclient.IdGeneratorClient;

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

    public long createSchool(String dataSource, String idDataSource, String sortLetter, String city, String country, long userId, String name) throws EJBException {
        log.debug("create school (many fields) called...");

        long school_id = 0;

        Connection conn = null;
        PreparedStatement ps = null;
        try {

            school_id = IdGeneratorClient.getSeqId("SCHOOL_SEQ");

            StringBuffer query = new StringBuffer(1024);
            query.append("INSERT ");
            query.append("INTO school (school_id, sort_letter, city, country_code, user_id, name) ");
            query.append("VALUES (?, ?, ?, ?, ?, ?)");

            conn = DBMS.getConnection(dataSource);
            ps = conn.prepareStatement(query.toString());
            ps.setLong(1, school_id);
            ps.setString(2, sortLetter);
            ps.setString(3, city);
            ps.setString(4, country);
            ps.setLong(5, userId);
            ps.setString(6, name);

            int rc = ps.executeUpdate();
            if (rc != 1) {
                throw(new EJBException("Wrong number of rows inserted into " +
                        "'school'. Inserted " + rc + ", should have " +
                        "inserted 1."));
            }
        } catch (SQLException _sqle) {
            DBMS.printSqlException(true, _sqle);
            throw(new EJBException(_sqle.getMessage()));
        } finally {
            close(ps);
            close(conn);
        }
        return (school_id);
    }

    public long createSchool(String dataSource, String idDataSource) throws EJBException {
        log.debug("create school called...");

        long school_id = 0;

        Connection conn = null;
        PreparedStatement ps = null;
        try {
            school_id = IdGeneratorClient.getSeqId("SCHOOL_SEQ");

            StringBuffer query = new StringBuffer(1024);
            query.append("INSERT ");
            query.append("INTO school (school_id) ");
            query.append("VALUES (?)");

            conn = DBMS.getConnection(dataSource);
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
        } finally {
            close(ps);
            close(conn);
        }
        return (school_id);
    }

    public void setSchoolDivisionCode(long schoolId,
                                      String schoolDivisionCode, String dataSource)
            throws EJBException {
        log.debug("setSchoolDivisionCode called...");

        Connection conn = null;
        PreparedStatement ps = null;

        InitialContext ctx = null;
        try {
            StringBuffer query = new StringBuffer(1024);
            query.append("UPDATE school ");
            query.append("SET school_division_code=? ");
            query.append("WHERE school_id=?");

            conn = DBMS.getConnection(dataSource);
            ps = conn.prepareStatement(query.toString());
            ps.setString(1, schoolDivisionCode);
            ps.setLong(2, schoolId);

            int rc = ps.executeUpdate();
            if (rc != 1) {
                throw(new EJBException("Wrong number of rows updated in 'school'. " +
                        "Updated " + rc + ", should have updated 1."));
            }
        } catch (SQLException _sqle) {
            DBMS.printSqlException(true, _sqle);
            throw(new EJBException(_sqle.getMessage()));
        } finally {
            close(ps);
            close(conn);
            close(ctx);
        }
    }

    public void setFullName(long schoolId, String fullName, String dataSource)
            throws EJBException {
        log.debug("setFullName called...");
        Connection conn = null;
        PreparedStatement ps = null;

        InitialContext ctx = null;
        try {

            StringBuffer query = new StringBuffer(1024);
            query.append("UPDATE school ");
            query.append("SET full_name=? ");
            query.append("WHERE school_id=?");

            conn = DBMS.getConnection(dataSource);
            ps = conn.prepareStatement(query.toString());
            ps.setString(1, fullName);
            ps.setLong(2, schoolId);

            int rc = ps.executeUpdate();
            if (rc != 1) {
                throw(new EJBException("Wrong number of rows updated in 'school'. " +
                        "Updated " + rc + ", should have updated 1."));
            }
        } catch (SQLException _sqle) {
            DBMS.printSqlException(true, _sqle);
            throw(new EJBException(_sqle.getMessage()));
        } finally {
            close(ps);
            close(conn);
            close(ctx);
        }
    }

    public void setShortName(long schoolId, String shortName, String dataSource)
            throws EJBException {
        log.debug("setShortName called...");

        Connection conn = null;
        PreparedStatement ps = null;

        InitialContext ctx = null;
        try {

            StringBuffer query = new StringBuffer(1024);
            query.append("UPDATE school ");
            query.append("SET short_name=? ");
            query.append("WHERE school_id=?");

            conn = DBMS.getConnection(dataSource);
            ps = conn.prepareStatement(query.toString());
            ps.setString(1, shortName);
            ps.setLong(2, schoolId);

            int rc = ps.executeUpdate();
            if (rc != 1) {
                throw(new EJBException("Wrong number of rows updated in 'school'. " +
                        "Updated " + rc + ", should have updated 1."));
            }
        } catch (SQLException _sqle) {
            DBMS.printSqlException(true, _sqle);
            throw(new EJBException(_sqle.getMessage()));
        } finally {
            close(ps);
            close(conn);
            close(ctx);
        }
    }

    public String getSchoolDivisionCode(long schoolId, String dataSource)
            throws EJBException {
        log.debug("getSchoolDivisionCode called...");

        String schoolDivisionCode = null;

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        InitialContext ctx = null;
        try {

            StringBuffer query = new StringBuffer(1024);
            query.append("SELECT school_division_code ");
            query.append("FROM school ");
            query.append("WHERE school_id=?");

            conn = DBMS.getConnection(dataSource);
            ps = conn.prepareStatement(query.toString());
            ps.setLong(1, schoolId);

            rs = ps.executeQuery();
            if (rs.next()) {
                schoolDivisionCode = rs.getString(1);
            } else {
                throw(new EJBException("No rows found when selecting from 'school' " +
                        "with school_id=" + schoolId + "."));
            }
        } catch (SQLException _sqle) {
            DBMS.printSqlException(true, _sqle);
            throw(new EJBException(_sqle.getMessage()));
        } finally {
            close(rs);
            close(ps);
            close(conn);
            close(ctx);
        }
        return (schoolDivisionCode);
    }

    public String getFullName(long schoolId, String dataSource)
            throws EJBException {
        log.debug("getFullName called...");
        String full_name = null;

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        InitialContext ctx = null;
        try {

            StringBuffer query = new StringBuffer(1024);
            query.append("SELECT full_name ");
            query.append("FROM school ");
            query.append("WHERE school_id=?");

            conn = DBMS.getConnection(dataSource);
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
        } finally {
            close(rs);
            close(ps);
            close(conn);
            close(ctx);
        }
        return (full_name);
    }

    public long getSchoolId(String name, String dataSource) throws EJBException {
        long ret = 0;
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        InitialContext ctx = null;
        try {

            StringBuffer query = new StringBuffer(1024);
            query.append("SELECT school_id ");
            query.append("FROM school ");
            query.append("WHERE lower(name) = ?");

            conn = DBMS.getConnection(dataSource);
            ps = conn.prepareStatement(query.toString());
            ps.setString(1, name.toLowerCase());

            rs = ps.executeQuery();
            if (rs.next()) {
                ret = rs.getLong(1);
            }
        } catch (SQLException _sqle) {
            DBMS.printSqlException(true, _sqle);
            throw(new EJBException(_sqle.getMessage()));
        } finally {
            close(rs);
            close(ps);
            close(conn);
            close(ctx);
        }
        return ret;
    }

    public String getShortName(long schoolId, String dataSource)
            throws EJBException {
        log.debug("getShortName called...");
        String shortName = null;

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        InitialContext ctx = null;
        try {

            StringBuffer query = new StringBuffer(1024);
            query.append("SELECT short_name ");
            query.append("FROM school ");
            query.append("WHERE school_id=?");

            conn = DBMS.getConnection(dataSource);
            ps = conn.prepareStatement(query.toString());
            ps.setLong(1, schoolId);

            rs = ps.executeQuery();
            if (rs.next()) {
                shortName = rs.getString(1);
            } else {
                throw(new EJBException("No rows found when selecting from 'school' " +
                        "with school_id=" + schoolId + "."));
            }
        } catch (SQLException _sqle) {
            DBMS.printSqlException(true, _sqle);
            throw(new EJBException(_sqle.getMessage()));
        } finally {
            close(rs);
            close(ps);
            close(conn);
            close(ctx);
        }
        return (shortName);
    }

}

;
