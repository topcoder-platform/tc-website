package com.topcoder.web.codinginterface.longcontest.controller.request;

import java.util.Map;
import java.util.Vector;

import com.topcoder.shared.dataAccess.CachedDataAccess;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.security.User;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.codinginterface.longcontest.Constants;
import com.topcoder.web.codinginterface.longcontest.model.LongContestModel;
import com.topcoder.web.common.TCRequest;
import com.topcoder.web.common.TCWebException;

public class ViewStandings extends Base {

	protected static final Logger log = Logger.getLogger(ViewStandings.class);

	protected void businessProcessing() throws TCWebException {
		TCRequest request = getRequest();
		String roundID = request.getParameter("roundID");

		try {
			DataAccessInt dai = new CachedDataAccess(DBMS.OLTP_DATASOURCE_NAME);

			Request r = new Request();
			r.setContentHandle("long_contest_round_standings");
			r.setProperty("rd", "" + roundID);
			
			Map m = dai.getData(r);
			ResultSetContainer rsc = (ResultSetContainer) m.get("long_contest_round_standings");
			
			request.setAttribute(Constants.ROUND_STANDINGS_LIST_KEY, rsc);			
		} catch (Exception e) {
			e.printStackTrace();
			throw new TCWebException("Error retrieving page.");
		}
    	setNextPage(Constants.PAGE_STANDINGS);
    	setIsNextPageInContext(true);
	}
}