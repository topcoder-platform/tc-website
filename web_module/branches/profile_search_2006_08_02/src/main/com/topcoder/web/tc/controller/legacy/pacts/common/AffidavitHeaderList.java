/**
 * this is a list of Affidavit headers.  It is just an array that is created
 * becase all parsing of result sets should go in specific classes.
 *
 *
 * @author Matt Murphy
 * @see AffidavitHeader
 */

package com.topcoder.web.tc.controller.legacy.pacts.common;

import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.logging.Logger;

import java.util.Map;

public class AffidavitHeaderList implements PactsConstants {
    private static Logger log = Logger.getLogger(AffidavitHeaderList.class);

    private AffidavitHeader[] headerList = null;

    /**
     * will parse the result set container looking for several
     * rows of AffidavitHeader data.  In the event of an error
     * the array will of length 0, but will not be null.  It expects
     * the result set to be set indexed with the AFFIDAVIT_HEADER_LIST contsant
     *
     * @param results the results of a db query
     */
    public AffidavitHeaderList(Map results) {
        ResultSetContainer rsc = (ResultSetContainer)
                results.get(AFFIDAVIT_HEADER_LIST);

        //make sure we got the affidavit headers
        if (rsc == null) {
            log.error("There were no " + AFFIDAVIT_HEADER_LIST + " entries in the" +
                    " result set map sent to the AffidavitHeaderList\n" +
                    "constructor.");
            headerList = new AffidavitHeader[0];
        }

        // see if there are any rows of data
        int numRows = rsc.getRowCount();
        if (numRows <= 0) {
            log.debug("there were no rows of data in the result set sent\n" +
                    "to the AffidavitHeaderList constructor");
            headerList = new AffidavitHeader[0];
        }

        headerList = new AffidavitHeader[numRows];
        for (int n = 0; n < numRows; n++) {
            log.debug("adding AffidavitHeader " + n);
            headerList[n] = new AffidavitHeader(results, n);
        }
    }


    public AffidavitHeader[] getHeaderList() {
        return headerList;
    }


}

