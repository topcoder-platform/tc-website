package com.topcoder.web.ejb.email;

import com.topcoder.util.idgenerator.IdGenerator;
import com.topcoder.util.idgenerator.sql.SimpleDB;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.TCContext;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.ejb.BaseEJB;
import com.topcoder.web.ejb.idgeneratorclient.IdGeneratorClient;

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

    public long createEmail(long userId, String dataSource, String idDataSource) throws EJBException, RemoteException {

        long email_id = 0;

        Connection conn = null;
        PreparedStatement ps = null;

        try {

            email_id = IdGeneratorClient.getSeqId("EMAIL_SEQ");

            StringBuffer query = new StringBuffer(1024);
            query.append("INSERT ");
            query.append("INTO email (email_id,user_id) ");
            query.append("VALUES (?,?)");

            conn = DBMS.getConnection(dataSource);
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
        } finally {
            close(ps);
            close(conn);
        }
        return (email_id);
    }

    public void setPrimaryEmailId(long userId, long emailId, String dataSource)
            throws EJBException, RemoteException {

        Connection conn = null;
        PreparedStatement ps = null;
        InitialContext ctx = null;

        try {

            StringBuffer query = new StringBuffer(1024);
            query.append("UPDATE email ");
            query.append("SET primary_ind=0 ");
            query.append("WHERE user_id=?");

            conn = DBMS.getConnection(dataSource);
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
            query.append("SET primary_ind=1 ");
            query.append("WHERE user_id=? AND email_id=?");

            ps = conn.prepareStatement(query.toString());
            ps.setLong(1, userId);
            ps.setLong(2, emailId);

            rc = ps.executeUpdate();
            if (rc != 1) {
                throw(new EJBException("Wrong number of rows updated in 'email'. " +
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

    public long getPrimaryEmailId(long userId, String dataSource)
            throws EJBException, RemoteException {
        long email_id = 0;

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        InitialContext ctx = null;

        try {

            StringBuffer query = new StringBuffer(1024);
            query.append("SELECT email_id ");
            query.append("FROM email ");
            query.append("WHERE user_id=? AND primary_ind=1");

            conn = DBMS.getConnection(dataSource);
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
        } finally {
            close(rs);
            close(ps);
            close(conn);
            close(ctx);
        }
        return (email_id);
    }

    public void setEmailTypeId(long emailId, long emailTypeId, String dataSource)
            throws EJBException, RemoteException {

        Connection conn = null;
        PreparedStatement ps = null;

        InitialContext ctx = null;

        try {

            StringBuffer query = new StringBuffer(1024);
            query.append("UPDATE email ");
            query.append("SET email_type_id=? ");
            query.append("WHERE email_id=?");

            conn = DBMS.getConnection(dataSource);
            ps = conn.prepareStatement(query.toString());
            ps.setLong(1, emailTypeId);
            ps.setLong(2, emailId);

            int rc = ps.executeUpdate();
            if (rc != 1) {
                throw(new EJBException("Wrong number of rows updated in 'email'. " +
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

    public long getEmailTypeId(long emailId, String dataSource)
            throws EJBException, RemoteException {

        long email_type_id = 0;

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        InitialContext ctx = null;

        try {

            StringBuffer query = new StringBuffer(1024);
            query.append("SELECT email_type_id ");
            query.append("FROM email ");
            query.append("WHERE email_id=?");

            conn = DBMS.getConnection(dataSource);
            ps = conn.prepareStatement(query.toString());
            ps.setLong(1, emailId);

            rs = ps.executeQuery();
            if (rs.next()) {
                email_type_id = rs.getLong(1);
            } else {
                throw(new EJBException("No rows found when selecting from 'email' " +
                        "with email_id=" + emailId + "."));
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
        return (email_type_id);
    }

    public void setAddress(long emailId, String address, String dataSource)
            throws EJBException, RemoteException {

        Connection conn = null;
        PreparedStatement ps = null;

        InitialContext ctx = null;

        try {

            StringBuffer query = new StringBuffer(1024);
            query.append("UPDATE email ");
            query.append("SET address=? ");
            query.append("WHERE email_id=?");

            conn = DBMS.getConnection(dataSource);
            ps = conn.prepareStatement(query.toString());
            ps.setString(1, address);
            ps.setLong(2, emailId);

            int rc = ps.executeUpdate();
            if (rc != 1) {
                throw(new EJBException("Wrong number of rows updated in 'email'. " +
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

    public String getAddress(long emailId, String dataSource)
            throws EJBException, RemoteException {

        String address = "";

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        InitialContext ctx = null;

        try {

            StringBuffer query = new StringBuffer(1024);
            query.append("SELECT address ");
            query.append("FROM email ");
            query.append("WHERE email_id=?");

            conn = DBMS.getConnection(dataSource);
            ps = conn.prepareStatement(query.toString());
            ps.setLong(1, emailId);

            rs = ps.executeQuery();
            if (rs.next()) {
                address = rs.getString(1);
            } else {
                throw(new EJBException("No rows found when selecting from 'email' " +
                        "with email_id=" + emailId + "."));
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
        return (address);
    }

    public int getStatusId(long emailId, String dataSource) {
        return selectInt("email",
                "status_id",
                new String[] {"email_id"},
                new String[] {String.valueOf(emailId)},
                dataSource).intValue();
    }

    public void setStatusId(long emailId, int statusId, String dataSource) {
        int ret = update("email",
                new String[] {"status_id"},
                new String[] {String.valueOf(statusId)},
                new String[] {"email_id"},
                new String[] {String.valueOf(emailId)},
                dataSource);
        if (ret != 1) {
            throw(new EJBException("Wrong number of rows updated in " +
                    "'email'. Updated " + ret + ", " +
                    "should have updated 1."));
        }
    }



}
