package com.topcoder.web.codinginterface.longcontest.controller.request;

import java.util.Map;

import com.topcoder.web.codinginterface.longcontest.Constants;
import com.topcoder.common.web.data.Navigation;
import com.topcoder.security.TCSubject;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.web.common.SecurityHelper;
import com.topcoder.web.common.TCRequest;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.model.CoderSessionInfo;
import com.topcoder.shared.util.logging.Logger;

public class Logout extends Base {

	protected static final Logger log = Logger.getLogger(Logout.class);

	protected void businessProcessing() throws TCWebException {

		TCRequest request = getRequest();
		getAuthentication().logout();
		try {
			doLegacyWork(getRequest());
		} catch(Exception e) {
			throw new TCWebException(e);
		}
		getRequest().getSession().invalidate();
		request.setAttribute("module", Constants.RP_ACTIVE_CONTESTS);
		System.out.println("RP_ACTIVE_CONTESTS="+Constants.RP_ACTIVE_CONTESTS);
		setNextPage(Constants.JSP_ADDR);
		System.out.println("JSP_ADDR="+Constants.JSP_ADDR);
		setIsNextPageInContext(true);		
	}

	private void doLegacyWork(TCRequest request) throws Exception {
		TCSubject user = SecurityHelper.getUserSubject(getAuthentication()
				.getActiveUser().getId());
		CoderSessionInfo ret = new CoderSessionInfo(request,
				getAuthentication(), user.getPrincipals());
		Navigation nav = new Navigation(request, ret);
		request.getSession(true).setAttribute("navigation", nav);
	}
}
