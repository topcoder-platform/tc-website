package com.topcoder.web.ejb.user;

import com.topcoder.shared.util.logging.Logger;
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

public class UserAddressBean implements SessionBean {

    private SessionContext ctx;
    private static Logger log = Logger.getLogger(UserAddressBean.class);
    private static final String dataSourceName = "CORP_OLTP";

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

    public void createUserAddress(long userId, long addressId) {

        log.debug("createUserAddress called...");

        Context ctx = null;
        PreparedStatement ps = null; // could just use Statement
        Connection conn = null;
        DataSource ds = null;

        try {
            StringBuffer query = new StringBuffer(100);
            query.append("INSERT INTO user_address_xref (user_id, address_id) VALUES (");
            query.append(Long.toString(userId) + "," + Long.toString(addressId));
            query.append(")");

            ctx = new InitialContext();
            ds = (DataSource)ctx.lookup(dataSourceName);
            conn = ds.getConnection();
            ps = conn.prepareStatement(query.toString());
            int rows = ps.executeUpdate();
            if (rows!=1) throw new EJBException("Wrong number of rows in insert: " + rows);

        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new EJBException("SQLException creating user address");
        } catch (NamingException e) {
            throw new EJBException("NamingException creating user address");
        } catch (Exception e) {
            throw new EJBException("Exception creating user address:\n" + e.getMessage());
        } finally {
            if (ps != null) {try {ps.close();} catch (Exception ignore) {log.error("FAILED to close PreparedStatement in createUserAddress");}}
            if (conn != null) {try {conn.close();} catch (Exception ignore) {log.error("FAILED to close Connection in createUserAddress");}}
            if (ctx != null) {try {ctx.close();} catch (Exception ignore) {log.error("FAILED to close Context in createUserAddress");}}
        }
    }

    public void removeUserAddress(long userId, long addressId) {

        log.debug("removeUserAddress called...");

        Context ctx = null;
        PreparedStatement ps = null;
        Connection conn = null;
        DataSource ds = null;

        try {
            StringBuffer query = new StringBuffer(100);
            query.append("DELETE FROM user_address_xref WHERE user_id = ");
            query.append(Long.toString(userId));
            query.append(" AND address_id = " + Long.toString(addressId));

            ctx = new InitialContext();
            ds = (DataSource)ctx.lookup(dataSourceName);
            conn = ds.getConnection();
            ps = conn.prepareStatement(query.toString());
            int rows = ps.executeUpdate();
            if (rows!=1) throw new EJBException("Wrong number of rows in remove: " + rows);

        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new EJBException("SQLException removing user address");
        } catch (NamingException e) {
            throw new EJBException("NamingException removing user address");
        } catch (Exception e) {
            throw new EJBException("Exception removing user address:\n" + e.getMessage());
        } finally {
            if (ps != null) {try {ps.close();} catch (Exception ignore) {log.error("FAILED to close PreparedStatement in removeUserAddress");}}
            if (conn != null) {try {conn.close();} catch (Exception ignore) {log.error("FAILED to close Connection in removeUserAddress");}}
            if (ctx != null) {try {ctx.close();} catch (Exception ignore) {log.error("FAILED to close Context in removeUserAddress");}}
        }
    }
}