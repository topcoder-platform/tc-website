package com.topcoder.web.ejb.school;

import com.topcoder.shared.util.DBMS;
import com.topcoder.util.idgenerator.*;
import com.topcoder.util.idgenerator.sql.*;

import java.rmi.RemoteException;
import java.sql.*;
import javax.ejb.*;
import javax.naming.*;
import javax.sql.*;

public class SchoolBean implements SessionBean {

    private final static String DATA_SOURCE = "java:comp/env/datasource_name";

    private final static String JTS_DATA_SOURCE = "java:comp/env/jts_datasource_name";

    private transient InitialContext initCtx = null;

    private SessionContext ctx;

    public void ejbActivate() {
        /* do nothing */
    }

    public void ejbPassivate() {
        /* do nothing */
    }

    public void ejbCreate() throws CreateException {
        try {
            initCtx = new InitialContext();
        }
        catch (NamingException ne) {
            ne.printStackTrace();
        }
    }

    public void ejbRemove() {
        /* do nothing */
    }

    public void setSessionContext(SessionContext ctx) {
        this.ctx = ctx;
    }

    public long createSchool() throws EJBException, RemoteException {

        long schoolId = 0;

        Connection con = null;
        PreparedStatement ps = null;

        try {

            String dsName = (String) initCtx.lookup(DATA_SOURCE);
            DataSource ds = (DataSource) initCtx.lookup(dsName);

            if (!IdGenerator.isInitialized()) {
                IdGenerator.init(new SimpleDB(), ds, "sequence_object", "name",
                                 "current_value", 9999999999L, 1, true);
            }

            schoolId = IdGenerator.nextId("SCHOOL_SEQ");

            dsName = (String) initCtx.lookup(JTS_DATA_SOURCE);
            ds = (DataSource) initCtx.lookup(dsName);

            StringBuffer query = new StringBuffer(1024);
            query.append("INSERT ");
            query.append("INTO school (school_id) ");
            query.append("VALUES (?)");

            con = ds.getConnection();
            ps = con.prepareStatement(query.toString());
            ps.setLong(1, schoolId);

            int rc = ps.executeUpdate();
            if (rc != 1) {
                throw(new EJBException("Wrong number of rows inserted into " +
                                       "'school'. Inserted " + rc + ", should have " +
                                       "inserted 1."));
            }
        }
        catch (SQLException sqle) {
            sqle.printStackTrace();
            throw(new EJBException(sqle.getMessage()));
        }
        catch (NamingException ne) {
            ne.printStackTrace();
            throw(new EJBException(ne.getMessage()));
        }
        finally {
            if (con != null) {
                try {
                    con.close();
                }
                catch (Exception e) {
                    /* do nothing */
                }
            }
            if (ps != null) {
                try {
                    ps.close();
                }
                catch (Exception e) {
                    /* do nothing */
                }
            }
        }
        return (schoolId);
    }

    public void setSchoolDivisionCode(long schoolId,
                                      String schoolDivisionCode)
            throws EJBException, RemoteException {

        Connection con = null;
        PreparedStatement ps = null;

        try {

            String dsName = (String) initCtx.lookup(JTS_DATA_SOURCE);
            DataSource ds = (DataSource) initCtx.lookup(dsName);

            StringBuffer query = new StringBuffer(1024);
            query.append("UPDATE school ");
            query.append("SET school_division_code=? ");
            query.append("WHERE school_id=?");

            con = ds.getConnection();
            ps = con.prepareStatement(query.toString());
            ps.setString(1, schoolDivisionCode);
            ps.setLong(2, schoolId);

            int rc = ps.executeUpdate();
            if (rc != 1) {
                throw(new EJBException("Wrong number of rows updated in 'school'. " +
                                       "Updated " + rc + ", should have updated 1."));
            }
        }
        catch (SQLException sqle) {
            sqle.printStackTrace();
            throw(new EJBException(sqle.getMessage()));
        }
        catch (NamingException ne) {
            ne.printStackTrace();
            throw(new EJBException(ne.getMessage()));
        }
        finally {
            if (con != null) {
                try {
                    con.close();
                }
                catch (Exception e) {
                    /* do nothing */
                }
            }
            if (ps != null) {
                try {
                    ps.close();
                }
                catch (Exception e) {
                    /* do nothing */
                }
            }
        }
    }

    public void setFullName(long schoolId, String fullName)
            throws EJBException, RemoteException {

        Connection con = null;
        PreparedStatement ps = null;

        try {

            String dsName = (String) initCtx.lookup(JTS_DATA_SOURCE);
            DataSource ds = (DataSource) initCtx.lookup(dsName);

            StringBuffer query = new StringBuffer(1024);
            query.append("UPDATE school ");
            query.append("SET full_name=? ");
            query.append("WHERE school_id=?");

            con = ds.getConnection();
            ps = con.prepareStatement(query.toString());
            ps.setString(1, fullName);
            ps.setLong(2, schoolId);

            int rc = ps.executeUpdate();
            if (rc != 1) {
                throw(new EJBException("Wrong number of rows updated in 'school'. " +
                                       "Updated " + rc + ", should have updated 1."));
            }
        }
        catch (SQLException sqle) {
            sqle.printStackTrace();
            throw(new EJBException(sqle.getMessage()));
        }
        catch (NamingException ne) {
            ne.printStackTrace();
            throw(new EJBException(ne.getMessage()));
        }
        finally {
            if (con != null) {
                try {
                    con.close();
                }
                catch (Exception e) {
                    /* do nothing */
                }
            }
            if (ps != null) {
                try {
                    ps.close();
                }
                catch (Exception e) {
                    /* do nothing */
                }
            }
        }
    }

    public void setShortName(long schoolId, String shortName)
            throws EJBException, RemoteException {

        Connection con = null;
        PreparedStatement ps = null;

        try {

            String dsName = (String) initCtx.lookup(JTS_DATA_SOURCE);
            DataSource ds = (DataSource) initCtx.lookup(dsName);

            StringBuffer query = new StringBuffer(1024);
            query.append("UPDATE school ");
            query.append("SET short_name=? ");
            query.append("WHERE school_id=?");

            con = ds.getConnection();
            ps = con.prepareStatement(query.toString());
            ps.setString(1, shortName);
            ps.setLong(2, schoolId);

            int rc = ps.executeUpdate();
            if (rc != 1) {
                throw(new EJBException("Wrong number of rows updated in 'school'. " +
                                       "Updated " + rc + ", should have updated 1."));
            }
        }
        catch (SQLException sqle) {
            sqle.printStackTrace();
            throw(new EJBException(sqle.getMessage()));
        }
        catch (NamingException ne) {
            ne.printStackTrace();
            throw(new EJBException(ne.getMessage()));
        }
        finally {
            if (con != null) {
                try {
                    con.close();
                }
                catch (Exception e) {
                    /* do nothing */
                }
            }
            if (ps != null) {
                try {
                    ps.close();
                }
                catch (Exception e) {
                    /* do nothing */
                }
            }
        }
    }

    public String getSchoolDivisionCode(long schoolId)
            throws EJBException, RemoteException {

        String schoolDivisionCode = null;

        Connection con = null;
        PreparedStatement ps = null;

        try {

            String dsName = (String) initCtx.lookup(JTS_DATA_SOURCE);
            DataSource ds = (DataSource) initCtx.lookup(dsName);

            StringBuffer query = new StringBuffer(1024);
            query.append("SELECT school_division_code ");
            query.append("FROM school ");
            query.append("WHERE school_id=?");

            con = ds.getConnection();
            ps = con.prepareStatement(query.toString());
            ps.setLong(1, schoolId);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                schoolDivisionCode = rs.getString(1);
            }
            else {
                throw(new EJBException("No rows found when selecting from 'school' " +
                                       "with school_id=" + schoolId + "."));
            }
        }
        catch (SQLException sqle) {
            sqle.printStackTrace();
            throw(new EJBException(sqle.getMessage()));
        }
        catch (NamingException ne) {
            ne.printStackTrace();
            throw(new EJBException(ne.getMessage()));
        }
        finally {
            if (con != null) {
                try {
                    con.close();
                }
                catch (Exception e) {
                    /* do nothing */
                }
            }
            if (ps != null) {
                try {
                    ps.close();
                }
                catch (Exception e) {
                    /* do nothing */
                }
            }
        }
        return (schoolDivisionCode);
    }

    public String getFullName(long schoolId)
            throws EJBException, RemoteException {

        String fullName = null;

        Connection con = null;
        PreparedStatement ps = null;

        try {

            String dsName = (String) initCtx.lookup(JTS_DATA_SOURCE);
            DataSource ds = (DataSource) initCtx.lookup(dsName);

            StringBuffer query = new StringBuffer(1024);
            query.append("SELECT full_name ");
            query.append("FROM school ");
            query.append("WHERE school_id=?");

            con = ds.getConnection();
            ps = con.prepareStatement(query.toString());
            ps.setLong(1, schoolId);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                fullName = rs.getString(1);
            }
            else {
                throw(new EJBException("No rows found when selecting from 'school' " +
                                       "with school_id=" + schoolId + "."));
            }
        }
        catch (SQLException sqle) {
            sqle.printStackTrace();
            throw(new EJBException(sqle.getMessage()));
        }
        catch (NamingException ne) {
            ne.printStackTrace();
            throw(new EJBException(ne.getMessage()));
        }
        finally {
            if (con != null) {
                try {
                    con.close();
                }
                catch (Exception e) {
                    /* do nothing */
                }
            }
            if (ps != null) {
                try {
                    ps.close();
                }
                catch (Exception e) {
                    /* do nothing */
                }
            }
        }
        return (fullName);
    }

    public String getShortName(long schoolId)
            throws EJBException, RemoteException {

        String shortName = null;

        Connection con = null;
        PreparedStatement ps = null;

        try {

            String dsName = (String) initCtx.lookup(JTS_DATA_SOURCE);
            DataSource ds = (DataSource) initCtx.lookup(dsName);

            StringBuffer query = new StringBuffer(1024);
            query.append("SELECT short_name ");
            query.append("FROM school ");
            query.append("WHERE school_id=?");

            con = ds.getConnection();
            ps = con.prepareStatement(query.toString());
            ps.setLong(1, schoolId);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                shortName = rs.getString(1);
            }
            else {
                throw(new EJBException("No rows found when selecting from 'school' " +
                                       "with school_id=" + schoolId + "."));
            }
        }
        catch (SQLException sqle) {
            sqle.printStackTrace();
            throw(new EJBException(sqle.getMessage()));
        }
        catch (NamingException ne) {
            ne.printStackTrace();
            throw(new EJBException(ne.getMessage()));
        }
        finally {
            if (con != null) {
                try {
                    con.close();
                }
                catch (Exception e) {
                    /* do nothing */
                }
            }
            if (ps != null) {
                try {
                    ps.close();
                }
                catch (Exception e) {
                    /* do nothing */
                }
            }
        }
        return (shortName);
    }

};
