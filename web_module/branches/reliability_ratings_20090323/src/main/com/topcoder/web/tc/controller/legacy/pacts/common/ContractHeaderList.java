/**
 * this is a list of contract headers.  It is just an array that is created
 * becase all parsing of result sets should go in specific classes.
 *
 * DBP 3/20 - Change path to ResultSetContainer - now in com.topcoder.web.common
 *
 * @author Sam King
 * @see ContractHeader
 */

package com.topcoder.web.tc.controller.legacy.pacts.common;

import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.logging.Logger;

import java.util.Map;

public class ContractHeaderList implements PactsConstants {
    private static Logger log = Logger.getLogger(ContractHeaderList.class);

    private ContractHeader[] headerList = null;

    /**
     * will parse the result set container looking for several
     * rows of ContractHeader data.  In the event of an error
     * the array will of length 0, but will not be null.  It expects
     * the result set to be set indexed with the CONTRACT_HEADER contsant
     *
     * @param results the results of a db query
     */
    public ContractHeaderList(Map results) {
        ResultSetContainer rsc = (ResultSetContainer)
                results.get(CONTRACT_HEADER_LIST);

        //make sure we got the contract headers
        if (rsc == null) {
            log.error("There were no " + CONTRACT_HEADER_LIST + " entries in the" +
                    " result set map sent to the ContractHeaderList\n" +
                    "constructor.");
            headerList = new ContractHeader[0];
        }

        // see if there are any rows of data
        int numRows = rsc.getRowCount();
        if (numRows <= 0) {
            log.debug("there were no rows of data in the result set sent\n" +
                    "to the ContractHeaderList constructor");
            headerList = new ContractHeader[0];
        }

        //now form all of the contract headers
        headerList = new ContractHeader[numRows];
        for (int idx = 0; idx < numRows; idx++) {
            headerList[idx] = new ContractHeader(results, idx);
        }
    }

    public ContractHeader[] getHeaderList() {
        return headerList;
    }


}

