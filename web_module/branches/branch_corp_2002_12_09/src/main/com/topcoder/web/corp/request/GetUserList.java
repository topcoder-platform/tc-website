package com.topcoder.web.corp.request;

import com.topcoder.shared.util.logging.Logger;

import com.topcoder.shared.dataAccess.*;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.dataAccess.resultSet.TCResultItem;
import com.topcoder.shared.util.DBMS;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.rmi.RemoteException;
import java.sql.SQLException;


/**
 * Small database query select file to access the database and return a list
 * of users associated with a specific companyID, Used by UserList.java 
 * processor to take all the database access code out of the processor.
 * 
 * @author   Daniel Cohn
 * @version  1.0
 *
 */

public class GetUserList {

    private static Logger log = Logger.getLogger(UserListTest.class);
    private static final String dataSourceName = "CORP_OLTP";

/**
 * static method to query database and return the user list assocated with a
 * company ID
 * @return a ResultSetContainer of elements returned from the select query.
 * @param companyID the companies id to look up.
 * @throws Exception when there is a problem querying the database.
 */
    public static ResultSetContainer run(long companyId) throws Exception {

        Context ctx = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        Connection conn = null;
        DataSource ds = null;
        ResultSetContainer ret = null;

        try {

            StringBuffer query = new StringBuffer();
            query.append( "SELECT u.user_id, su.user_id AS handle," );
            query.append( " u.first_name, u.last_name" );
            query.append( " FROM security_user su, user u, contact c" );
            query.append( " WHERE su.login_id = u.user_id" );
            query.append( " AND u.user_id = c.contact_id" );
            query.append( " AND c.company_id = ?" ); 

            ctx = new InitialContext();
            ds = (DataSource)ctx.lookup(dataSourceName);
            conn = ds.getConnection();
            ps = conn.prepareStatement(query.toString());
            ps.setLong(1, companyId);
            rs = ps.executeQuery();
            ret = new ResultSetContainer(rs);

        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new Exception("SQLException processing users query");
        } catch (NamingException e) {
            throw new Exception("NamingException getting users");
        } catch (Exception e) {
            throw new Exception("Exception getting user's information." + e.getMessage());
        } finally {
            if (rs != null) { try { rs.close(); } catch (Exception ignore) {
                log.error("FAILED to close ResultSet in getFirstName");
            } }
            if (ps != null) { try { ps.close(); } catch (Exception ignore) { 
                log.error("FAILED to close PreparedStatement in getFirstName");
            } }
            if (conn != null) { try { conn.close(); } catch (Exception ignore) {
                log.error("FAILED to close Connection in getFirstName");
            } }
            if (ctx != null) { try { ctx.close(); } catch (Exception ignore) {
                log.error("FAILED to close Context in getFirstName");
            } }
        }
        return ret;
    }
}
