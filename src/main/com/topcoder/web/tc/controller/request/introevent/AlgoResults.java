package com.topcoder.web.tc.controller.request.introevent;

import com.topcoder.shared.dataAccess.DataAccess;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.CachedDataAccess;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.model.EventType;
import com.topcoder.web.common.model.IntroEventConfig;
import com.topcoder.web.tc.Constants;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Sep 17, 2007
 */
public class AlgoResults extends Base {

    @Override
    protected void introEventProcessing() throws Exception {
        if (!getEvent().getType().getId().equals(EventType.INTRO_EVENT_ALGO_ID)) {
            throw new NavigationException("Invalid event type.");
        }
        IntroEventConfig results = getMainEvent().getConfig(IntroEventConfig.SHOW_RESULTS_PROP_ID);
        if (results != null && String.valueOf(true).equals(results.getValue())) {
            getRequest().setAttribute("contestName", getMainEvent().getRoundName());


            Request r = new Request();
            r.setContentHandle("intro_event_algo_results");
            r.setProperty(Constants.EVENT_ID, String.valueOf(getEvent().getId()));
            DataAccess da = new CachedDataAccess(DBMS.OLTP_DATASOURCE_NAME);
            getRequest().setAttribute("results", da.getData(r).get("intro_event_algo_results"));

            setNextIntroEventPage("algoResults.jsp");
        } else {
            throw new NavigationException("Sorry, results are not available at this time.");
        }


    }
}
