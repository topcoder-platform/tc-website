package com.topcoder.web.ejb.school;

import com.topcoder.util.idgenerator.IdGenerator;
import com.topcoder.util.idgenerator.sql.SimpleDB;

import javax.ejb.CreateException;
import javax.ejb.EJBException;
import javax.ejb.SessionBean;
import javax.ejb.SessionContext;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import java.rmi.RemoteException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class SchoolBean implements SessionBean {

    private final static String DATA_SOURCE = "java:comp/env/datasource_name";
    private final static String JTS_DATA_SOURCE = "java:comp/env/jts_datasource_name";

    private transient InitialContext init_ctx = null;

    private SessionContext ctx;

    public void ejbActivate() {
        /* do nothing */
    }

    public void ejbPassivate() {
        /* do nothing */
    }

    public void ejbCreate() throws CreateException {
        try {
            init_ctx = new InitialContext();
        } catch (NamingException _ne) {
            _ne.printStackTrace();
        }
    }

    public void ejbRemove() {
        /* do nothing */
    }

    public void setSessionContext(SessionContext _ctx) {
        ctx = _ctx;
    }

    public long createSchool() throws EJBException, RemoteException {

        long school_id = 0;

        Connection con = null;
        PreparedStatement ps = null;

        try {

            String ds_name = (String) init_ctx.lookup(DATA_SOURCE);
            DataSource ds = (DataSource) init_ctx.lookup(ds_name);

            if (!IdGenerator.isInitialized()) {
                IdGenerator.init(new SimpleDB(), ds, "sequence_object", "name",
                        "current_value", 9999999999L, 1, false);
            }

            school_id = IdGenerator.nextId("SCHOOL_SEQ");

            StringBuffer query = new StringBuffer(1024);
            query.append("INSERT ");
            query.append("INTO school (school_id) ");
            query.append("VALUES (?)");

            con = ds.getConnection();
            ps = con.prepareStatement(query.toString());
            ps.setLong(1, school_id);

            int rc = ps.executeUpdate();
            if (rc != 1) {
                throw(new EJBException("Wrong number of rows inserted into " +
                        "'school'. Inserted " + rc + ", should have " +
                        "inserted 1."));
            }
        } catch (SQLException _sqle) {
            _sqle.printStackTrace();
            throw(new EJBException(_sqle.getMessage()));
        } catch (NamingException _ne) {
            _ne.printStackTrace();
            throw(new EJBException(_ne.getMessage()));
        } finally {
            if (con != null) {
                try {
                    con.close();
                } catch (Exception _e) {
                    /* do nothing */
                }
            }
            if (ps != null) {
                try {
                    ps.close();
                } catch (Exception _e) {
                    /* do nothing */
                }
            }
        }
        return (school_id);
    }

    public void setSchoolDivisionCode(long _school_id,
                                      String _school_division_code)
            throws EJBException, RemoteException {

        Connection con = null;
        PreparedStatement ps = null;

        try {

            String ds_name = (String) init_ctx.lookup(JTS_DATA_SOURCE);
            DataSource ds = (DataSource) init_ctx.lookup(ds_name);

            StringBuffer query = new StringBuffer(1024);
            query.append("UPDATE school ");
            query.append("SET school_division_code=? ");
            query.append("WHERE school_id=?");

            con = ds.getConnection();
            ps = con.prepareStatement(query.toString());
            ps.setString(1, _school_division_code);
            ps.setLong(2, _school_id);

            int rc = ps.executeUpdate();
            if (rc != 1) {
                throw(new EJBException("Wrong number of rows updated in 'school'. " +
                        "Updated " + rc + ", should have updated 1."));
            }
        } catch (SQLException _sqle) {
            _sqle.printStackTrace();
            throw(new EJBException(_sqle.getMessage()));
        } catch (NamingException _ne) {
            _ne.printStackTrace();
            throw(new EJBException(_ne.getMessage()));
        } finally {
            if (con != null) {
                try {
                    con.close();
                } catch (Exception _e) {
                    /* do nothing */
                }
            }
            if (ps != null) {
                try {
                    ps.close();
                } catch (Exception _e) {
                    /* do nothing */
                }
            }
        }
    }

    public void setFullName(long _school_id, String _full_name)
            throws EJBException, RemoteException {

        Connection con = null;
        PreparedStatement ps = null;

        try {

            String ds_name = (String) init_ctx.lookup(JTS_DATA_SOURCE);
            DataSource ds = (DataSource) init_ctx.lookup(ds_name);

            StringBuffer query = new StringBuffer(1024);
            query.append("UPDATE school ");
            query.append("SET full_name=? ");
            query.append("WHERE school_id=?");

            con = ds.getConnection();
            ps = con.prepareStatement(query.toString());
            ps.setString(1, _full_name);
            ps.setLong(2, _school_id);

            int rc = ps.executeUpdate();
            if (rc != 1) {
                throw(new EJBException("Wrong number of rows updated in 'school'. " +
                        "Updated " + rc + ", should have updated 1."));
            }
        } catch (SQLException _sqle) {
            _sqle.printStackTrace();
            throw(new EJBException(_sqle.getMessage()));
        } catch (NamingException _ne) {
            _ne.printStackTrace();
            throw(new EJBException(_ne.getMessage()));
        } finally {
            if (con != null) {
                try {
                    con.close();
                } catch (Exception _e) {
                    /* do nothing */
                }
            }
            if (ps != null) {
                try {
                    ps.close();
                } catch (Exception _e) {
                    /* do nothing */
                }
            }
        }
    }

    public void setShortName(long _school_id, String _short_name)
            throws EJBException, RemoteException {

        Connection con = null;
        PreparedStatement ps = null;

        try {

            String ds_name = (String) init_ctx.lookup(JTS_DATA_SOURCE);
            DataSource ds = (DataSource) init_ctx.lookup(ds_name);

            StringBuffer query = new StringBuffer(1024);
            query.append("UPDATE school ");
            query.append("SET short_name=? ");
            query.append("WHERE school_id=?");

            con = ds.getConnection();
            ps = con.prepareStatement(query.toString());
            ps.setString(1, _short_name);
            ps.setLong(2, _school_id);

            int rc = ps.executeUpdate();
            if (rc != 1) {
                throw(new EJBException("Wrong number of rows updated in 'school'. " +
                        "Updated " + rc + ", should have updated 1."));
            }
        } catch (SQLException _sqle) {
            _sqle.printStackTrace();
            throw(new EJBException(_sqle.getMessage()));
        } catch (NamingException _ne) {
            _ne.printStackTrace();
            throw(new EJBException(_ne.getMessage()));
        } finally {
            if (con != null) {
                try {
                    con.close();
                } catch (Exception _e) {
                    /* do nothing */
                }
            }
            if (ps != null) {
                try {
                    ps.close();
                } catch (Exception _e) {
                    /* do nothing */
                }
            }
        }
    }

    public String getSchoolDivisionCode(long _school_id)
            throws EJBException, RemoteException {

        String school_division_code = null;

        Connection con = null;
        PreparedStatement ps = null;

        try {

            String ds_name = (String) init_ctx.lookup(DATA_SOURCE);
            DataSource ds = (DataSource) init_ctx.lookup(ds_name);

            StringBuffer query = new StringBuffer(1024);
            query.append("SELECT school_division_code ");
            query.append("FROM school ");
            query.append("WHERE school_id=?");

            con = ds.getConnection();
            ps = con.prepareStatement(query.toString());
            ps.setLong(1, _school_id);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                school_division_code = rs.getString(1);
            } else {
                throw(new EJBException("No rows found when selecting from 'school' " +
                        "with school_id=" + _school_id + "."));
            }
        } catch (SQLException _sqle) {
            _sqle.printStackTrace();
            throw(new EJBException(_sqle.getMessage()));
        } catch (NamingException _ne) {
            _ne.printStackTrace();
            throw(new EJBException(_ne.getMessage()));
        } finally {
            if (con != null) {
                try {
                    con.close();
                } catch (Exception _e) {
                    /* do nothing */
                }
            }
            if (ps != null) {
                try {
                    ps.close();
                } catch (Exception _e) {
                    /* do nothing */
                }
            }
        }
        return (school_division_code);
    }

    public String getFullName(long _school_id)
            throws EJBException, RemoteException {

        String full_name = null;

        Connection con = null;
        PreparedStatement ps = null;

        try {

            String ds_name = (String) init_ctx.lookup(DATA_SOURCE);
            DataSource ds = (DataSource) init_ctx.lookup(ds_name);

            StringBuffer query = new StringBuffer(1024);
            query.append("SELECT full_name ");
            query.append("FROM school ");
            query.append("WHERE school_id=?");

            con = ds.getConnection();
            ps = con.prepareStatement(query.toString());
            ps.setLong(1, _school_id);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                full_name = rs.getString(1);
            } else {
                throw(new EJBException("No rows found when selecting from 'school' " +
                        "with school_id=" + _school_id + "."));
            }
        } catch (SQLException _sqle) {
            _sqle.printStackTrace();
            throw(new EJBException(_sqle.getMessage()));
        } catch (NamingException _ne) {
            _ne.printStackTrace();
            throw(new EJBException(_ne.getMessage()));
        } finally {
            if (con != null) {
                try {
                    con.close();
                } catch (Exception _e) {
                    /* do nothing */
                }
            }
            if (ps != null) {
                try {
                    ps.close();
                } catch (Exception _e) {
                    /* do nothing */
                }
            }
        }
        return (full_name);
    }

    public String getShortName(long _school_id)
            throws EJBException, RemoteException {

        String short_name = null;

        Connection con = null;
        PreparedStatement ps = null;

        try {

            String ds_name = (String) init_ctx.lookup(DATA_SOURCE);
            DataSource ds = (DataSource) init_ctx.lookup(ds_name);

            StringBuffer query = new StringBuffer(1024);
            query.append("SELECT short_name ");
            query.append("FROM school ");
            query.append("WHERE school_id=?");

            con = ds.getConnection();
            ps = con.prepareStatement(query.toString());
            ps.setLong(1, _school_id);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                short_name = rs.getString(1);
            } else {
                throw(new EJBException("No rows found when selecting from 'school' " +
                        "with school_id=" + _school_id + "."));
            }
        } catch (SQLException _sqle) {
            _sqle.printStackTrace();
            throw(new EJBException(_sqle.getMessage()));
        } catch (NamingException _ne) {
            _ne.printStackTrace();
            throw(new EJBException(_ne.getMessage()));
        } finally {
            if (con != null) {
                try {
                    con.close();
                } catch (Exception _e) {
                    /* do nothing */
                }
            }
            if (ps != null) {
                try {
                    ps.close();
                } catch (Exception _e) {
                    /* do nothing */
                }
            }
        }
        return (short_name);
    }

}

;
