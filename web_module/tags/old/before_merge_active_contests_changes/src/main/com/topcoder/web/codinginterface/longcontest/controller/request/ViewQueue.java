package com.topcoder.web.codinginterface.longcontest.controller.request;

import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.codinginterface.longcontest.Constants;
import com.topcoder.web.common.TCRequest;
import com.topcoder.web.common.TCWebException;

import java.util.Map;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Feb 17, 2006
 */
public class ViewQueue extends Base {
    protected static final Logger log = Logger.getLogger(ViewSubmissionHistory.class);

        protected void longContestProcessing() throws TCWebException {
            try {
                TCRequest request = getRequest();

                Request r = new Request();

                r.setContentHandle("long_contest_queue_status");
/*
                if it become a problem, cache it. but things aren't going to line up between the
                standings page and the queue page
                CachedDataAccess dataAccess = (CachedDataAccess)getDataAccess(true);
                dataAccess.setExpireTime(1000*60*10);
*/
                DataAccessInt dataAccess = getDataAccess(false);

                Map result = dataAccess.getData(r);
                request.setAttribute("resultMap", result);


                setNextPage(Constants.PAGE_QUEUE_STATUS);
                setIsNextPageInContext(true);
            } catch (TCWebException e) {
                throw e;
            } catch (Exception e) {
                throw new TCWebException(e);
            }
        }
    }
