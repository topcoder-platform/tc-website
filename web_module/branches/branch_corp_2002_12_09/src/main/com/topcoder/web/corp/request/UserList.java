package com.topcoder.web.corp.request;

import com.topcoder.shared.util.logging.Logger;

import com.topcoder.shared.security.User;
import com.topcoder.web.common.security.BasicAuthentication;
import com.topcoder.shared.util.DBMS;

import com.topcoder.shared.dataAccess.*;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.dataAccess.resultSet.TCResultItem;

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
        BasicAuthentication authToken = getAuthenticityToken();
        if (!authToken.isLoggedIn(true)) {
            throw new AuthenticationException("You must be logged in to perform this action");
        }

        /* Find the current logged in users ID number.  */
        User currentUser = authToken.getLoggedInUser();
        long userId = currentUser.getId();
        
        /* get the company associated with that logged in users ID number */
        long companyId = new 
            com.topcoder.web.ejb.user.ContactBean().getCompanyId(userId);

        log.debug("UserList getting users for companyId: "+companyId);

        Request dataRequest = new Request();
        dataRequest.setContentHandle("corp_company_user_listing");
        
        dataRequest.setProperty("cm", Long.toString(companyId) );
        
        DataAccessInt dai = new DataAccess(
            (javax.sql.DataSource)getInitialContext().lookup("CORP_OLTP"));

        Map resultMap = dai.getData(dataRequest);
        
        ResultSetContainer rsc = (ResultSetContainer) resultMap.get("CORP_USER_LIST");
        if (rsc.getRowCount() == 0) {
            throw new Exception("User list invalid");
        }
        request.setAttribute("companyUsers",rsc);
        nextPage = ("/acc_admin/user_list.jsp");
    }
}
