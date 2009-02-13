package com.topcoder.web.codinginterface.longcontest.controller.request;

import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;

import com.topcoder.server.ejb.TestServices.LongTestQueueStatusItem;
import com.topcoder.server.ejb.TestServices.TestServices;
import com.topcoder.server.ejb.TestServices.TestServicesLocator;
import com.topcoder.shared.common.ServicesConstants;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.codinginterface.longcontest.Constants;
import com.topcoder.web.common.TCWebException;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Feb 17, 2006
 */
public class ViewQueue extends Base {
    protected static final Logger log = Logger.getLogger(ViewSubmissionHistory.class);

        protected void longContestProcessing() throws TCWebException {
            try {
                
                TestServices service = TestServicesLocator.getService();
                List longTestQueueStatus = service.getLongTestQueueStatus();
                List longSummaryList = new LinkedList();
                int systemTestCount = 0;
                for (Iterator it = longTestQueueStatus.iterator(); it.hasNext(); ) {
                    LongTestQueueStatusItem item = (LongTestQueueStatusItem) it.next();
                    if (item.getTestAction() == ServicesConstants.LONG_SYSTEM_TEST_ACTION) {
                        systemTestCount +=  item.getCount();
                    } else {
                        longSummaryList.add(item);
                    }
                }
                getRequest().setAttribute("result",  longSummaryList);
                getRequest().setAttribute("systemTestCount",  new Integer(systemTestCount));
/*
                if it become a problem, cache it. but things aren't going to line up between the
                standings page and the queue page
                CachedDataAccess dataAccess = (CachedDataAccess)getDataAccess(true);
                dataAccess.setExpireTime(1000*60*10);
*/
                
                setNextPage(Constants.PAGE_QUEUE_STATUS);
                setIsNextPageInContext(true);
            } catch (Exception e) {
                throw new TCWebException(e);
            }
        }
    }
