package com.topcoder.web.corp.request;

import com.topcoder.shared.util.logging.Logger;

import com.topcoder.shared.dataAccess.*;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.dataAccess.resultSet.TCResultItem;
import com.topcoder.shared.util.logging.Logger;
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
* ---------------------------------------------------------------------------
* Test Only- not complete- still working on this.  Final file name will be
* UserList.java when testing is complete. 
* ---------------------------------------------------------------------------
* Processor for user list page, contains logic for querying databse for a 
* list of users associated with a company and putting them into a 
* ResultSetContainer.  This will then be stored in the request object for
* retreival by the IteratorTag in the userlist jsp page.
* 
* @author   Daniel Cohn
* @version  0.5
*
*/

class UserList extends BaseProcessor {
    private static Logger log = Logger.getLogger(UserBean.class);

	public UserList() {
        pageInContext = true;
        // Next page is user list page and is always in the context.
	}

   /** businessProcessing for this processor will call setUsersList 
    *  if there is an error catch it and send to error page.  
    *  @see com.topcoder.web.corp.request.BaseProcessor#businessProcessing()
    */
    void businessProcessing() throws Exception {
        try {
            setupUsersList();
            nextPage = ("/acc_admin/usr_list.jsp");
        }
        catch (Exception e) {
            log.error("ERROR while setting up users list: "+e);
            nextPage = ("/error.jsp?message=" + e);
        }
    }

    /**
     *  method for querying the database for user information related to 
     *  current company, user information columns retrieved are: 
     *  <p> user_id: decimal(18)  ,  handle: varchar(50)  ,   
     *  first_name: varchar(64)   ,  last_name: varchar(64)
     *  <p> Then a ResultSetContainer is created to hold the information about
     *  the companies users and is put into the request attribute named: 
     *  "companyUsers" for use in the userlist jsp page.
     */
    private void setupUsersList() throws Exception {

        log.debug("UserList getting users associated with company ID: " 
                   + companyID);
        String companyId = request.getAttribute("companyId");
        if (companyId == null || companyId.length() == 0) { 
            throw new Exception("Error getting company attribute");
        }
        final String dataSourceName = "CORP_OLTP";
        Context ctx = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        Connection conn = null;
        DataSource ds = null;
        ResultSetContainer ret = null;

        StringBuffer query = new StringBuffer();
        query.append("SELECT u.first_name, u.last_name, u.user_id
                      FROM   user u, contact c
                      WHERE  u.user_id = c.contact_id
                       AND   c.company_id = ");

//        query.append("SELECT u.user_id 
//                           , su.user_id AS handle
//                           , u.first_name
//                           , u.last_name
//                        FROM security_user su
//                           , user u
//                           , contact c
//                       WHERE su.login_id = u.user_id
//                         AND u.user_id = c.contact_id"
//                         AND c.company_id = ");

        query.append(Long.toString(companyId));
        try {
            ctx = new InitialContext();
            ds = (DataSource)ctx.lookup(dataSourceName);
            conn = ds.getConnection();
            ps = conn.prepareStatement(query.toString());
            rs = ps.executeQuery();
        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new Exception("SQLException processing users query: " +
                                    query.toString());
        } catch (NamingException e) {
            throw new Exception("NamingException getting users");
        } catch (Exception e) {
            throw new Exception("Exception getting user's information : " + userId + "\n" + e.getMessage());
        } finally {
            if (rs != null) {try {rs.close();} catch (Exception ignore) {log.error("FAILED to close ResultSet in getFirstName");}}
            if (ps != null) {try {ps.close();} catch (Exception ignore) {log.error("FAILED to close PreparedStatement in getFirstName");}}
            if (conn != null) {try {conn.close();} catch (Exception ignore) {log.error("FAILED to close Connection in getFirstName");}}
            if (ctx != null) {try {ctx.close();} catch (Exception ignore) {log.error("FAILED to close Context in getFirstName");}}
        }
        // resultSet rs 
        ret = new ResultSetContainer(rs);
        request.setAttribute("companyUsers",ret);
    }
}
