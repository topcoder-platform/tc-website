package com.topcoder.web.corp.request;

import com.topcoder.shared.util.logging.Logger;

import com.topcoder.shared.dataAccess.*;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.dataAccess.resultSet.TCResultItem;

/**
* ---------------------------------------------------------------------------
* Test Only- not complete- still working on this.  Final file name will be
* UserList.java when testing is complete. 
* ---------------------------------------------------------------------------
* Processor for user list page, contains logic for setting up a
* list of users associated with a company and putting them into a 
* ResultSetContainer which is then stored in the request object for
* use by the ListIteratorTag in the userlist jsp page.
* 
* @author   Daniel Cohn
* @version  0.8
*
*/

public class UserListTest extends BaseProcessor {
    private static Logger log = Logger.getLogger(UserListTest.class);

    /** Constructor sets pageInContext to true since all Static pages are in
     * the same context 
     */
	public UserListTest() {
        pageInContext = true;
        // Next page is user list page and is always in the context.
	}

   /** businessProcessing for this processor will call setUsersList 
    *  if there is an error catch it and send to error page.  
    *  @throws Exception
    *  @see com.topcoder.web.corp.request.BaseProcessor#businessProcessing()
    */
    void businessProcessing() throws Exception {
        log.debug("Attempting to set up user list");
        setupUsersList();
        nextPage = ("/acc_admin/user_list.jsp");
    }

    /**
     *  method for calling GetUserList class for retrieving user information 
     *  from the database related to current company, user information columns 
     *  retrieved are: 
     *  <p> user_id: decimal(18)  ,  handle: varchar(50)  ,   
     *  first_name: varchar(64)   ,  last_name: varchar(64)
     *  <p> A ResultSetContainer is created to hold the information about
     *  the companies users and is put into the request attribute named: 
     *  "companyUsers" for use in the userlist jsp page.
     *  @throws Exception 
     *                   
     */
    private void setupUsersList() throws Exception {
        long companyId = -1;

        try {
            companyId = Long.parseLong(request.getParameter("companyId"));
        } catch (NumberFormatException nfe) {
            throw new Exception("Error determining company ID");
        }

        if (companyId == -1) { 
            throw new Exception("no companyId Parameter provided."); 
        }
        
        log.debug("UserList getting users for companyId: "+companyId);

        try { 
            ResultSetContainer rsc = GetUserList.run(companyId);
            request.setAttribute("companyUsers",ret);
        }
        catch (Exception e) {
            throw new Exception("Error retrieving user list");        
        }
    }
}
