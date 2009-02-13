package com.topcoder.web.ejb.email;

import com.topcoder.shared.util.DBMS;
import com.topcoder.util.idgenerator.*;
import com.topcoder.util.idgenerator.sql.*;

import java.rmi.RemoteException;
import java.sql.*;
import javax.ejb.*;
import javax.naming.*;
import javax.sql.*;

public class EmailBean implements SessionBean {

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

    public long createEmail(long userId) throws EJBException, RemoteException {

        long emailId = 0;

        Connection con = null;
        PreparedStatement ps = null;

        try {

            String dsName = (String) initCtx.lookup(DATA_SOURCE);
            DataSource ds = (DataSource) initCtx.lookup(dsName);

            if (!IdGenerator.isInitialized()) {
                IdGenerator.init(new SimpleDB(), ds, "sequence_object", "name",
                                 "current_value", 9999999999L, 1, true);
            }

            emailId = IdGenerator.nextId("EMAIL_SEQ");

            dsName = (String) initCtx.lookup(JTS_DATA_SOURCE);
            ds = (DataSource) initCtx.lookup(dsName);

            StringBuffer query = new StringBuffer(1024);
            query.append("INSERT ");
            query.append("INTO email (email_id,user_id) ");
            query.append("VALUES (?,?)");

            con = ds.getConnection();
            ps = con.prepareStatement(query.toString());
            ps.setLong(1, emailId);
            ps.setLong(2, userId);

            int rc = ps.executeUpdate();
            if (rc != 1) {
                throw(new EJBException("Wrong number of rows inserted into 'email'. " +
                                       "Inserted " + rc + ", should have inserted 1."));
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
        return (emailId);
    }

    public void setPrimaryEmailId(long userId, long emailId)
            throws EJBException, RemoteException {

        Connection con = null;
        PreparedStatement ps = null;

        try {

            String dsName = (String) initCtx.lookup(JTS_DATA_SOURCE);
            DataSource ds = (DataSource) initCtx.lookup(dsName);

            StringBuffer query = new StringBuffer(1024);
            query.append("UPDATE email ");
            query.append("SET primary=0 ");
            query.append("WHERE user_id=?");

            con = ds.getConnection();
            ps = con.prepareStatement(query.toString());
            ps.setLong(1, userId);

            int rc = ps.executeUpdate();
            if (rc < 1) {
                throw(new EJBException("Wrong number of rows updated in 'email'. " +
                                       "Updated " + rc + ", should have updated at least " +
                                       "1."));
            }

            query = new StringBuffer(1024);
            query.append("UPDATE email ");
            query.append("SET primary=1 ");
            query.append("WHERE user_id=? AND email_id=?");

            ps = con.prepareStatement(query.toString());
            ps.setLong(1, userId);
            ps.setLong(2, emailId);

            rc = ps.executeUpdate();
            if (rc != 1) {
                throw(new EJBException("Wrong number of rows updated in 'email'. " +
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

    public long getPrimaryEmailId(long userId)
            throws EJBException, RemoteException {
        long emailId = 0;

        Connection con = null;
        PreparedStatement ps = null;

        try {

            String dsName = (String) initCtx.lookup(JTS_DATA_SOURCE);
            DataSource ds = (DataSource) initCtx.lookup(dsName);

            StringBuffer query = new StringBuffer(1024);
            query.append("SELECT email_id ");
            query.append("FROM email ");
            query.append("WHERE user_id=? AND primary=1");

            con = ds.getConnection();
            ps = con.prepareStatement(query.toString());
            ps.setLong(1, userId);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                emailId = rs.getLong(1);
            }
            else {
                throw(new EJBException("No rows found when selecting from 'email' " +
                                       "with user_id=" + userId + "."));
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
        return (emailId);
    }

    public void setEmailTypeId(long emailId, long emailTypeId)
            throws EJBException, RemoteException {

        Connection con = null;
        PreparedStatement ps = null;

        try {

            String dsName = (String) initCtx.lookup(JTS_DATA_SOURCE);
            DataSource ds = (DataSource) initCtx.lookup(dsName);

            StringBuffer query = new StringBuffer(1024);
            query.append("UPDATE email ");
            query.append("SET email_type_id=? ");
            query.append("WHERE email_id=?");

            con = ds.getConnection();
            ps = con.prepareStatement(query.toString());
            ps.setLong(1, emailTypeId);
            ps.setLong(2, emailId);

            int rc = ps.executeUpdate();
            if (rc != 1) {
                throw(new EJBException("Wrong number of rows updated in 'email'. " +
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

    public long getEmailTypeId(long emailId)
            throws EJBException, RemoteException {

        long emailTypeId = 0;

        Connection con = null;
        PreparedStatement ps = null;

        try {

            String dsName = (String) initCtx.lookup(JTS_DATA_SOURCE);
            DataSource ds = (DataSource) initCtx.lookup(dsName);

            StringBuffer query = new StringBuffer(1024);
            query.append("SELECT email_type_id ");
            query.append("FROM email ");
            query.append("WHERE email_id=?");

            con = ds.getConnection();
            ps = con.prepareStatement(query.toString());
            ps.setLong(1, emailId);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                emailTypeId = rs.getLong(1);
            }
            else {
                throw(new EJBException("No rows found when selecting from 'email' " +
                                       "with email_id=" + emailId + "."));
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
        return (emailTypeId);
    }

    public void setAddress(long emailId, String address)
            throws EJBException, RemoteException {

        Connection con = null;
        PreparedStatement ps = null;

        try {

            String dsName = (String) initCtx.lookup(JTS_DATA_SOURCE);
            DataSource ds = (DataSource) initCtx.lookup(dsName);

            StringBuffer query = new StringBuffer(1024);
            query.append("UPDATE email ");
            query.append("SET address=? ");
            query.append("WHERE email_id=?");

            con = ds.getConnection();
            ps = con.prepareStatement(query.toString());
            ps.setString(1, address);
            ps.setLong(2, emailId);

            int rc = ps.executeUpdate();
            if (rc != 1) {
                throw(new EJBException("Wrong number of rows updated in 'email'. " +
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

    public String getAddress(long emailId)
            throws EJBException, RemoteException {

        String address = "";

        Connection con = null;
        PreparedStatement ps = null;

        try {

            String dsName = (String) initCtx.lookup(JTS_DATA_SOURCE);
            DataSource ds = (DataSource) initCtx.lookup(dsName);

            StringBuffer query = new StringBuffer(1024);
            query.append("SELECT address ");
            query.append("FROM email ");
            query.append("WHERE email_id=?");

            con = ds.getConnection();
            ps = con.prepareStatement(query.toString());
            ps.setLong(1, emailId);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                address = rs.getString(1);
            }
            else {
                throw(new EJBException("No rows found when selecting from 'email' " +
                                       "with email_id=" + emailId + "."));
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
        return (address);
    }

};
