package com.topcoder.web.corp.request;

import com.topcoder.shared.dataAccess.DataAccess;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.security.User;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.shared.util.TCContext;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.corp.Constants;
import com.topcoder.web.corp.Util;

import javax.naming.InitialContext;
import javax.sql.DataSource;
import java.util.Map;

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
     *  @throws Exception
     *  @see com.topcoder.web.corp.request.BaseProcessor#businessProcessing()
     */
    void businessProcessing() throws Exception {
        log.debug("Attempting to set up user list");
        pageInContext = true;
        long userId;
//        WebAuthentication authToken = getAuthenticityToken();

        /* Find the current logged in users ID number.  */
        User currentUser = authToken.getActiveUser();
        userId = currentUser.getId();

        Request dataRequest = new Request();
        dataRequest.setContentHandle("corp_company_user_listing");

        dataRequest.setProperty("uid", Long.toString(userId));

        InitialContext ic = null;
        ResultSetContainer rsc = null;
        try {
            ic = (InitialContext)TCContext.getInitial();
            DataAccessInt dai = new DataAccess((DataSource) ic.lookup(DBMS.OLTP_DATASOURCE_NAME));

            Map resultMap = dai.getData(dataRequest);
            rsc = (ResultSetContainer) resultMap.get("CORP_user_list");
        } finally {
            Util.closeIC(ic);
        }

//        if (rsc.getRowCount() == 0) {
//            throw new Exception("User list invalid. userId="+userId);
//        }
//System.err.println("--------"+rsc.getRowCount()+"---");
        request.setAttribute("companyUsers", rsc);
        nextPage = Constants.USERLIST_PAGE;
    }
}
