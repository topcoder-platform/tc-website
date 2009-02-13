package com.topcoder.web.codinginterface.longcontest.controller.request;

import com.topcoder.server.ejb.TestServices.LongContestServicesLocator;
import com.topcoder.server.ejb.TestServices.LongTestQueueStatusItem;
import com.topcoder.shared.common.ServicesConstants;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.codinginterface.longcontest.Constants;
import com.topcoder.web.common.TCWebException;

import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

/**
 * @author dok
 * @version $Revision: 65524 $ Date: 2005/01/01 00:00:00
 *          Create Date: Feb 17, 2006
 */
public class ViewQueue extends Base {
    protected static final Logger log = Logger.getLogger(ViewSubmissionHistory.class);

    protected void longContestProcessing() throws TCWebException {
        try {
            // maps for a round_id the type of round
            Map<Integer, Integer> roundTypes = new HashMap<Integer, Integer>();

            List longTestQueueStatus = LongContestServicesLocator.getService().getLongTestQueueStatus();
            List longSummaryList = new LinkedList();
            int systemTestCount = 0;
            for (Iterator it = longTestQueueStatus.iterator(); it.hasNext(); ) {
                LongTestQueueStatusItem item = (LongTestQueueStatusItem) it.next();
                if (item.getTestAction() == ServicesConstants.LONG_SYSTEM_TEST_ACTION) {
                    systemTestCount +=  item.getCount();
                } else {
                    longSummaryList.add(item);
                    if (!roundTypes.containsKey(item.getRoundId())) {
                        roundTypes.put(item.getRoundId(), getRoundType(item.getRoundId()));
                    }
                }
            }

            getRequest().setAttribute("roundTypes", roundTypes);
            getRequest().setAttribute("result",  longSummaryList);
            getRequest().setAttribute("systemTestCount",  new Integer(systemTestCount));

            setNextPage(Constants.PAGE_QUEUE_STATUS);
            setIsNextPageInContext(true);
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }

    private int getRoundType(int roundId) throws Exception {
        Request r = new Request();
        r.setContentHandle("get_round_type");
        r.setProperty(Constants.ROUND_ID, roundId + "");

        ResultSetContainer rsc = getDataAccess(true).getData(r).get("get_round_type");

        return rsc.size() > 0? rsc.getIntItem(0, 0) : 13;
    }

}
