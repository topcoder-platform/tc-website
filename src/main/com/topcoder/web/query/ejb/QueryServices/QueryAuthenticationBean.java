package com.topcoder.web.query.ejb.QueryServices;

import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.ejb.BaseEJB;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.logging.Logger;

import javax.ejb.EJBException;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import java.rmi.RemoteException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author   Greg Paul
 * @version  $Revision$
 */
public class QueryAuthenticationBean extends BaseEJB {

    private static Logger log = Logger.getLogger(QueryAuthenticationBean.class);
    private String dataSourceName;

    public ResultSetContainer getLoginInfo(String handle) throws RemoteException, EJBException {
        log.debug("getLoginInfo called...handle: " + handle);
        ResultSet rs = null;
        PreparedStatement ps = null;
        Connection conn = null;
        Context ctx = null;
        DataSource ds = null;
        ResultSetContainer rsc = null;

        try {
            StringBuffer query = new StringBuffer();
            query.append("SELECT u.handle");
            query.append(    " , u.password");
            query.append(    " , u.user_id");
            query.append( " FROM user u");
            query.append(" WHERE LOWER(u.handle) = LOWER(?)");
            query.append(  " AND u.user_id in (SELECT gu.user_id");
            query.append(                      " FROM group_user gu");
            query.append(                     " WHERE gu.group_id = 13)");
            ctx = new InitialContext();
            ds = (DataSource)ctx.lookup(DBMS.OLTP_DATASOURCE_NAME);
            conn = ds.getConnection();
            ps = conn.prepareStatement(query.toString());
            ps.setString(1, handle);
            rs = ps.executeQuery();
            rsc = new ResultSetContainer(rs);
        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new EJBException("SQLException getting login information for " + handle);
        } catch (Exception e) {
            throw new EJBException("Exception getting login information for " + handle + "\n " + e.getMessage());
        } finally {
            if (rs != null) {try {rs.close();} catch (Exception ignore) {log.error("FAILED to close ResultSet");}}
            if (ps != null) {try {ps.close();} catch (Exception ignore) {log.error("FAILED to close PreparedStatement");}}
            if (conn != null) {try {conn.close();} catch (Exception ignore) {log.error("FAILED to close Connection");}}
            if (ctx != null) {try {ctx.close();} catch (Exception ignore) {log.error("FAILED to close Context");}}
        }
        return rsc;
    }

    public void setDataSource(String dataSourceName) throws RemoteException, EJBException {
        if (dataSourceName.trim().length()>0)
            this.dataSourceName = dataSourceName;
    }
}


