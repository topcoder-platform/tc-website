package com.topcoder.web.winformula.controller.request.algorithm;

import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import com.topcoder.server.ejb.TestServices.LongContestServicesLocator;
import com.topcoder.server.ejb.TestServices.LongTestQueueStatusItem;
import com.topcoder.shared.common.ServicesConstants;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.winformula.algorithm.CodingConstants;
import com.topcoder.web.winformula.controller.request.AlgorithmBase;

/**
 * @author dok
 * @version $Revision: 80243 $ Date: 2005/01/01 00:00:00
 *          Create Date: Feb 17, 2006
 */
public class ViewQueue extends AlgorithmBase {
    protected static final Logger log = Logger.getLogger(ViewQueue.class);

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
                    Integer roundId = item.getRoundId();
                    if (!roundTypes.containsKey(roundId)) {
                        roundTypes.put(roundId, new Integer(19));
                    }
                }
            }

            getRequest().setAttribute("roundTypes", roundTypes);
            getRequest().setAttribute("result",  longSummaryList);
            getRequest().setAttribute("systemTestCount",  new Integer(systemTestCount));

            setNextPage(CodingConstants.PAGE_QUEUE_STATUS);
            setIsNextPageInContext(true);
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }
}
