package com.topcoder.web.ejb.email;

import com.topcoder.util.idgenerator.IdGenerator;
import com.topcoder.util.idgenerator.sql.SimpleDB;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.ejb.BaseEJB;

import javax.ejb.EJBException;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import java.rmi.RemoteException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class EmailBean extends BaseEJB {
    private static Logger log = Logger.getLogger(EmailBean.class);

    private final static String DATA_SOURCE = "java:comp/env/datasource_name";
    private final static String JTS_DATA_SOURCE = "java:comp/env/jts_datasource_name";

    public long createEmail(long userId) throws EJBException, RemoteException {

        long email_id = 0;

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

            email_id = IdGenerator.nextId("EMAIL_SEQ");

            StringBuffer query = new StringBuffer(1024);
            query.append("INSERT ");
            query.append("INTO email (email_id,user_id) ");
            query.append("VALUES (?,?)");

            conn = ds.getConnection();
            ps = conn.prepareStatement(query.toString());
            ps.setLong(1, email_id);
            ps.setLong(2, userId);

            int rc = ps.executeUpdate();
            if (rc != 1) {
                throw(new EJBException("Wrong number of rows inserted into 'email'. " +
                        "Inserted " + rc + ", should have inserted 1."));
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
        return (email_id);
    }

    public void setPrimaryEmailId(long userId, long _email_id)
            throws EJBException, RemoteException {

        Connection conn = null;
        PreparedStatement ps = null;
        InitialContext ctx = null;

        try {
            ctx = new InitialContext();
            DataSource ds = (DataSource) ctx.lookup(JTS_DATA_SOURCE);

            StringBuffer query = new StringBuffer(1024);
            query.append("UPDATE email ");
            query.append("SET primary=0 ");
            query.append("WHERE user_id=?");

            conn = ds.getConnection();
            ps = conn.prepareStatement(query.toString());
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

            ps = conn.prepareStatement(query.toString());
            ps.setLong(1, userId);
            ps.setLong(2, _email_id);

            rc = ps.executeUpdate();
            if (rc != 1) {
                throw(new EJBException("Wrong number of rows updated in 'email'. " +
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

    public long getPrimaryEmailId(long userId)
            throws EJBException, RemoteException {
        long email_id = 0;

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        InitialContext ctx = null;

        try {
            ctx = new InitialContext();
            DataSource ds = (DataSource) ctx.lookup(DATA_SOURCE);

            StringBuffer query = new StringBuffer(1024);
            query.append("SELECT email_id ");
            query.append("FROM email ");
            query.append("WHERE user_id=? AND primary=1");

            conn = ds.getConnection();
            ps = conn.prepareStatement(query.toString());
            ps.setLong(1, userId);

            rs = ps.executeQuery();
            if (rs.next()) {
                email_id = rs.getLong(1);
            } else {
                throw(new EJBException("No rows found when selecting from 'email' " +
                        "with user_id=" + userId + "."));
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
        return (email_id);
    }

    public void setEmailTypeId(long _email_id, long _email_type_id)
            throws EJBException, RemoteException {

        Connection conn = null;
        PreparedStatement ps = null;

        InitialContext ctx = null;

        try {
            ctx = new InitialContext();
            DataSource ds = (DataSource) ctx.lookup(JTS_DATA_SOURCE);

            StringBuffer query = new StringBuffer(1024);
            query.append("UPDATE email ");
            query.append("SET email_type_id=? ");
            query.append("WHERE email_id=?");

            conn = ds.getConnection();
            ps = conn.prepareStatement(query.toString());
            ps.setLong(1, _email_type_id);
            ps.setLong(2, _email_id);

            int rc = ps.executeUpdate();
            if (rc != 1) {
                throw(new EJBException("Wrong number of rows updated in 'email'. " +
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

    public long getEmailTypeId(long _email_id)
            throws EJBException, RemoteException {

        long email_type_id = 0;

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        InitialContext ctx = null;

        try {
            ctx = new InitialContext();
            DataSource ds = (DataSource) ctx.lookup(DATA_SOURCE);

            StringBuffer query = new StringBuffer(1024);
            query.append("SELECT email_type_id ");
            query.append("FROM email ");
            query.append("WHERE email_id=?");

            conn = ds.getConnection();
            ps = conn.prepareStatement(query.toString());
            ps.setLong(1, _email_id);

            rs = ps.executeQuery();
            if (rs.next()) {
                email_type_id = rs.getLong(1);
            } else {
                throw(new EJBException("No rows found when selecting from 'email' " +
                        "with email_id=" + _email_id + "."));
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
        return (email_type_id);
    }

    public void setAddress(long _email_id, String _address)
            throws EJBException, RemoteException {

        Connection conn = null;
        PreparedStatement ps = null;

        InitialContext ctx = null;

        try {
            ctx = new InitialContext();
            DataSource ds = (DataSource) ctx.lookup(JTS_DATA_SOURCE);

            StringBuffer query = new StringBuffer(1024);
            query.append("UPDATE email ");
            query.append("SET address=? ");
            query.append("WHERE email_id=?");

            conn = ds.getConnection();
            ps = conn.prepareStatement(query.toString());
            ps.setString(1, _address);
            ps.setLong(2, _email_id);

            int rc = ps.executeUpdate();
            if (rc != 1) {
                throw(new EJBException("Wrong number of rows updated in 'email'. " +
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

    public String getAddress(long _email_id)
            throws EJBException, RemoteException {

        String address = "";

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        InitialContext ctx = null;

        try {
            ctx = new InitialContext();
            DataSource ds = (DataSource) ctx.lookup(DATA_SOURCE);

            StringBuffer query = new StringBuffer(1024);
            query.append("SELECT address ");
            query.append("FROM email ");
            query.append("WHERE email_id=?");

            conn = ds.getConnection();
            ps = conn.prepareStatement(query.toString());
            ps.setLong(1, _email_id);

            rs = ps.executeQuery();
            if (rs.next()) {
                address = rs.getString(1);
            } else {
                throw(new EJBException("No rows found when selecting from 'email' " +
                        "with email_id=" + _email_id + "."));
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
        return (address);
    }

}
