/**
 * this is a list of Payment headers.  It is just an array that is created
 * becase all parsing of result sets should go in specific classes.
 *
 * DBP 3/20 - Change path to ResultSetContainer - now in com.topcoder.web.common
 *
 * @author Sam King
 * @see PaymentHeader
 */

package com.topcoder.web.tc.controller.legacy.pacts.common;

import com.topcoder.shared.util.logging.Logger;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;

import java.util.Map;

public class PaymentHeaderList implements PactsConstants {
    private static Logger log = Logger.getLogger(PaymentHeaderList.class);

    public PaymentHeader[] headerList = null;

    /**
     * will parse the result set container looking for several
     * rows of PaymentHeader data.  In the event of an error
     * the array will of length 0, but will not be null.  It expects
     * the result set to be set indexed with the PAYMENT_HEADER contsant
     *
     * @param results the results of a db query
     */
    public PaymentHeaderList(Map results) {
        ResultSetContainer rsc = (ResultSetContainer)
                results.get(PAYMENT_HEADER_LIST);

        //make sure we got the payment headers
        if (rsc == null) {
            log.error("There were no " + PAYMENT_HEADER_LIST + " entries in the" +
                    " result set map sent to the PaymentHeaderList\n" +
                    "constructor.");
            headerList = new PaymentHeader[0];
        }

        // see if there are any rows of data
        int numRows = rsc.getRowCount();
        if (numRows <= 0) {
            log.debug("there were no rows of data in the result set sent\n" +
                    "to the PaymentHeaderList constructor");
            headerList = new PaymentHeader[0];
        }

        //now form all of the contract headers
        headerList = new PaymentHeader[numRows];
        for (int idx = 0; idx < numRows; idx++) {
            headerList[idx] = new PaymentHeader(results, idx);
        }
    }
}

