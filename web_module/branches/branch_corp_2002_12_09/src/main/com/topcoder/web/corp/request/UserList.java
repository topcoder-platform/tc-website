package com.topcoder.web.corp.request;

import com.topcoder.shared.util.logging.Logger;

import com.topcoder.shared.security.*;
import com.topcoder.web.common.security.BasicAuthentication;
import com.topcoder.web.common.security.WebAuthentication;
import com.topcoder.shared.util.DBMS;

import com.topcoder.security.login.AuthenticationException;
import com.topcoder.shared.dataAccess.*;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.dataAccess.resultSet.TCResultItem;

import java.util.*;
import javax.naming.InitialContext;

/**
* Processor for user list page, contains logic for setting up a
* list of users associated with a company and putting them into a 
* ResultSetContainer which is then stored in the request object for
* use by the ListIteratorTag in the userlist jsp page.
* 
* @author   Daniel Cohn
* @version  1.0
*
*/

public class UserList extends BaseProcessor {
    private static Logger log = Logger.getLogger(UserList.class);

    private static final String USER_LIST_PAGE = "/acc_admin/UserListView.jsp"; 

   /**  <p>BusinessProcessing for this processor will retrieve a list of user
     *  information from the database related to current company of the
     *  user who is logged in.  
     *  <p> A ResultSetContainer is created to hold the information about
     *  the companies users and is put into the request attribute named: 
     *  "companyUsers" for use in the userlist jsp page.
    *  @throws AuthenticationException
    *  @throws Exception
    *  @see com.topcoder.web.corp.request.BaseProcessor#businessProcessing()
    */
    void businessProcessing() throws Exception {
        log.debug("Attempting to set up user list");
        pageInContext = true;
        long userId;
        WebAuthentication authToken = getAuthenticityToken();

        /* Find the current logged in users ID number.  */
        User currentUser = authToken.getActiveUser();
        userId = currentUser.getId();

        /* get the company associated with that logged in users ID number */
        long companyId = new 
            com.topcoder.web.ejb.user.ContactBean().getCompanyId(userId);
        log.debug("--- UserList getting users for companyId: "+companyId);
        Request dataRequest = new Request();
        dataRequest.setContentHandle("corp_company_user_listing");
        
        dataRequest.setProperty("comid", Long.toString(companyId) );
        
        DataAccessInt dai = new DataAccess(
            (javax.sql.DataSource)new InitialContext().lookup("CORP_OLTP"));

        Map resultMap = dai.getData(dataRequest);
        
        ResultSetContainer rsc = (ResultSetContainer) resultMap.get("CORP_user_list");
        if (rsc.getRowCount() == 0) {
            throw new Exception("User list invalid. userId="+userId);
        }
        request.setAttribute("companyUsers",rsc);
        nextPage = USER_LIST_PAGE;
    }
}
