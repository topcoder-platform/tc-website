package com.topcoder.web.ejb.phone;

import com.topcoder.shared.util.logging.Logger;
import com.topcoder.util.idgenerator.IdGenerator;
import com.topcoder.util.idgenerator.sql.SimpleDB;
import com.topcoder.shared.util.DBMS;

import javax.ejb.SessionBean;
import javax.ejb.SessionContext;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.ejb.EJBException;
import javax.naming.NamingException;
import java.rmi.RemoteException;
import java.sql.SQLException;

/**
*
* @author   George Nassar
* @version  $Revision$
*
*/

public class PhoneBean implements SessionBean {

    private SessionContext ctx;
    private static Logger log = Logger.getLogger(PhoneBean.class);
    private static final String dataSourceName = "CORP_OLTP";
    private static final String idGenDataSourceName = "CORP_OLTP";

    //required ejb methods

    public void ejbActivate() {
    }

    public void ejbPassivate() {
    }

    public void ejbCreate() {

      //InitContext = new InitialContext(); // from BaseEJB
    }

    public void ejbRemove() {
    }

    public void setSessionContext(SessionContext ctx) {

        this.ctx = ctx;
    }

    //business methods

    public long createPhone(long userId) {

        log.debug("createPhone called...");

        Context ctx = null;
        PreparedStatement ps = null; // could just use Statement
        Connection conn = null;
        DataSource ds = null;
        long ret = 0;

        try {
            ctx = new InitialContext();
            if (!IdGenerator.isInitialized()) {
                IdGenerator.init(new SimpleDB(), (DataSource)ctx.lookup(idGenDataSourceName), "sequence_object", "name", "current_value", 9999999999L, 1, true);
            }
            ret = IdGenerator.nextId("PHONE_SEQ");

            StringBuffer query = new StringBuffer(100);
            query.append("INSERT INTO phone (user_id, phone_id, create_date, modify_date) VALUES (");
            query.append(Long.toString(userId) + "," + Long.toString(ret));
            query.append(",'now','now')");

            ds = (DataSource)ctx.lookup(dataSourceName);
            conn = ds.getConnection();
            ps = conn.prepareStatement(query.toString());
            int rows = ps.executeUpdate();
            if (rows!=1) throw new EJBException("Wrong number of rows in insert: " + rows);

        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new EJBException("SQLException creating phone");
        } catch (NamingException e) {
            throw new EJBException("NamingException creating phone");
        } catch (Exception e) {
            throw new EJBException("Exception creating phone:\n" + e.getMessage());
        } finally {
            if (ps != null) {try {ps.close();} catch (Exception ignore) {log.error("FAILED to close PreparedStatement in createPhone");}}
            if (conn != null) {try {conn.close();} catch (Exception ignore) {log.error("FAILED to close Connection in createPhone");}}
            if (ctx != null) {try {ctx.close();} catch (Exception ignore) {log.error("FAILED to close Context in createPhone");}}
        }
        return(ret);
    }

    public long getPhoneTypeId(long userId, long phoneId) {

        log.debug("getPhoneTypeId called...user_id: " + userId + " phone_id: " + phoneId);

        Context ctx = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        Connection conn = null;
        DataSource ds = null;
        long ret = 0;

        try {
            StringBuffer query = new StringBuffer(100);
            query.append("SELECT phone_type_id FROM phone WHERE user_id = ");
            query.append(Long.toString(userId));
            query.append(" AND phone_id = ");
            query.append(Long.toString(phoneId));

            ctx = new InitialContext();
            ds = (DataSource)ctx.lookup(dataSourceName);
            conn = ds.getConnection();
            ps = conn.prepareStatement(query.toString());
            rs = ps.executeQuery();
            if (rs.next()) ret = rs.getLong("phone_type_id");

        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new EJBException("SQLException getting phone_type_id");
        } catch (NamingException e) {
            throw new EJBException("NamingException getting phone_type_id");
        } catch (Exception e) {
            throw new EJBException("Exception getting phone_type_id\n" + e.getMessage());
        } finally {
            if (rs != null) {try {rs.close();} catch (Exception ignore) {log.error("FAILED to close ResultSet in getPhoneTypeId");}}
            if (ps != null) {try {ps.close();} catch (Exception ignore) {log.error("FAILED to close PreparedStatement in getPhoneTypeId");}}
            if (conn != null) {try {conn.close();} catch (Exception ignore) {log.error("FAILED to close Connection in getPhoneTypeId");}}
            if (ctx != null) {try {ctx.close();} catch (Exception ignore) {log.error("FAILED to close Context in getPhoneTypeId");}}
        }
        return(ret);
    }

    public String getNumber(long userId, long phoneId) {

        log.debug("getNumber called...user_id: " + userId + " phone_id: " + phoneId);

        Context ctx = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        Connection conn = null;
        DataSource ds = null;
        String ret = null;

        try {
            StringBuffer query = new StringBuffer(100);
            query.append("SELECT phone_number FROM phone WHERE user_id = ");
            query.append(Long.toString(userId));
            query.append(" AND phone_id = ");
            query.append(Long.toString(phoneId));

            ctx = new InitialContext();
            ds = (DataSource)ctx.lookup(dataSourceName);
            conn = ds.getConnection();
            ps = conn.prepareStatement(query.toString());
            rs = ps.executeQuery();
            if (rs.next()) ret = rs.getString("phone_number");

        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new EJBException("SQLException getting phone number");
        } catch (NamingException e) {
            throw new EJBException("NamingException getting phone number");
        } catch (Exception e) {
            throw new EJBException("Exception getting phone number\n" + e.getMessage());
        } finally {
            if (rs != null) {try {rs.close();} catch (Exception ignore) {log.error("FAILED to close ResultSet in getNumber");}}
            if (ps != null) {try {ps.close();} catch (Exception ignore) {log.error("FAILED to close PreparedStatement in getNumber");}}
            if (conn != null) {try {conn.close();} catch (Exception ignore) {log.error("FAILED to close Connection in getNumber");}}
            if (ctx != null) {try {ctx.close();} catch (Exception ignore) {log.error("FAILED to close Context in getNumber");}}
        }
        return(ret);
    }

    public void setPhoneTypeId(long userId, long phoneId, long phoneTypeId) {

        log.debug("setPhoneTypeId called...userId: " + userId + " phoneId: " + phoneId + " phoneTypeId: " + phoneTypeId);

        Context ctx = null;
        PreparedStatement ps = null;
        Connection conn = null;
        DataSource ds = null;

        try {
            StringBuffer query = new StringBuffer(100);
            query.append("UPDATE phone SET phone_type_id = " + phoneTypeId + ", modify_date = 'now' WHERE user_id = ");
            query.append(Long.toString(userId));
            query.append(" AND phone_id = ");
            query.append(Long.toString(phoneId));

            ctx = new InitialContext();
            ds = (DataSource)ctx.lookup(dataSourceName);
            conn = ds.getConnection();
            ps = conn.prepareStatement(query.toString());
            int rows = ps.executeUpdate();
            if (rows!=1) throw new EJBException("Wrong number of rows in update: " + rows);

        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new EJBException("SQLException updating phoneTypeId");
        } catch (NamingException e) {
            throw new EJBException("NamingException updating phoneTypeId");
        } catch (Exception e) {
            throw new EJBException("Exception updating phoneTypeId\n" + e.getMessage());
        } finally {
            if (ps != null) {try {ps.close();} catch (Exception ignore) {log.error("FAILED to close PreparedStatement in setPhoneTypeId");}}
            if (conn != null) {try {conn.close();} catch (Exception ignore) {log.error("FAILED to close Connection in setPhoneTypeId");}}
            if (ctx != null) {try {ctx.close();} catch (Exception ignore) {log.error("FAILED to close Context in setPhoneTypeId");}}
        }
    }

    public void setNumber(long userId, long phoneId, String number) {

        log.debug("setNumber called...userId: " + userId + " phoneId: " + phoneId + " number: " + number);

        Context ctx = null;
        PreparedStatement ps = null;
        Connection conn = null;
        DataSource ds = null;

        try {
            StringBuffer query = new StringBuffer(100);
            query.append("UPDATE phone SET phone_number = '" + number + "', modify_date = 'now' WHERE user_id = ");
            query.append(Long.toString(userId));
            query.append(" AND phone_id = ");
            query.append(Long.toString(phoneId));

            ctx = new InitialContext();
            ds = (DataSource)ctx.lookup(dataSourceName);
            conn = ds.getConnection();
            ps = conn.prepareStatement(query.toString());
            int rows = ps.executeUpdate();
            if (rows!=1) throw new EJBException("Wrong number of rows in update: " + rows);

        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new EJBException("SQLException updating phone_number");
        } catch (NamingException e) {
            throw new EJBException("NamingException updating phone_number");
        } catch (Exception e) {
            throw new EJBException("Exception updating phone_number\n" + e.getMessage());
        } finally {
            if (ps != null) {try {ps.close();} catch (Exception ignore) {log.error("FAILED to close PreparedStatement in setNumber");}}
            if (conn != null) {try {conn.close();} catch (Exception ignore) {log.error("FAILED to close Connection in setNumber");}}
            if (ctx != null) {try {ctx.close();} catch (Exception ignore) {log.error("FAILED to close Context in setNumber");}}
        }
    }
}