/**
 * this is a list of User profile headers.  It is just an array that is created
 * becase all parsing of result sets should go in specific classes.
 *
 * DBP 3/20 - Change path to ResultSetContainer - now in com.topcoder.web.common
 *
 * @author Matt Murphy
 * @see UserProfileHeader
 */

package com.topcoder.web.tc.controller.legacy.pacts.common;

import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.logging.Logger;

import java.util.Map;

public class UserProfileHeaderList implements PactsConstants {
    private static Logger log = Logger.getLogger(UserProfileHeaderList.class);

    public UserProfileHeader[] headerList = null;

    /**
     * will parse the result set container looking for several
     * rows of UserProfileHeader data.  In the event of an error
     * the array will of length 0, but will not be null.  It expects
     * the result set to be set indexed with the USER_PROFILE_HEADER_LIST contsant
     *
     * @param results the results of a db query
     */
    public UserProfileHeaderList(Map results) {
        ResultSetContainer rsc = (ResultSetContainer)
                results.get(USER_PROFILE_HEADER_LIST);

        //make sure we got the user profile headers
        if (rsc == null) {
            log.error("There were no " + USER_PROFILE_HEADER_LIST + " entries in the" +
                    " result set map sent to the UserProfileHeaderList\n" +
                    "constructor.");
            headerList = new UserProfileHeader[0];
        }

        // see if there are any rows of data
        int numRows = rsc.getRowCount();
        if (numRows <= 0) {
            log.debug("there were no rows of data in the result set sent\n" +
                    "to the UserProfileHeaderList constructor");
            headerList = new UserProfileHeader[0];
        }

        headerList = new UserProfileHeader[numRows];
        for (int n = 0; n < numRows; n++) {
            log.debug("adding UserProfileHeader " + n);
            headerList[n] = new UserProfileHeader(results, n);
        }
    }
}

;
