package com.topcoder.web.corp.controller.request;

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
import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.TCWebException;

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
     *  @throws com.topcoder.web.common.TCWebException
     *  @see com.topcoder.web.common.BaseProcessor#businessProcessing()
     */
    protected void businessProcessing() throws TCWebException {
        log.debug("Attempting to set up user list");
        setIsNextPageInContext(true);
        long userId;
//        WebAuthentication authToken = getAuthenticityToken();

        /* Find the current logged in users ID number.  */
        User currentUser = getUser();
        userId = currentUser.getId();

        Request dataRequest = new Request();
        dataRequest.setContentHandle("corp_company_user_listing");

        dataRequest.setProperty("uid", Long.toString(userId));

        ResultSetContainer rsc = null;
        try {
            DataAccessInt dai = new DataAccess(DBMS.CORP_OLTP_DATASOURCE_NAME);

            Map resultMap = dai.getData(dataRequest);
            rsc = (ResultSetContainer) resultMap.get("CORP_user_list");
        } catch (TCWebException e) {
            throw e;
        } catch (Exception e) {
            throw(new TCWebException(e));
        }

//        if (rsc.getRowCount() == 0) {
//            throw new Exception("User list invalid. userId="+userId);
//        }
//System.err.println("--------"+rsc.getRowCount()+"---");
        getRequest().setAttribute("companyUsers", rsc);
        setNextPage(Constants.USERLIST_PAGE);
    }
}
