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
import com.topcoder.web.common.TCWebException;

public class ViewReg extends Base{

    protected static final Logger log = Logger.getLogger(ViewReg.class);

    protected void businessProcessing() throws TCWebException {
    	
    	String roundID = getRequest().getParameter(Constants.ROUND_ID);
    	
    	try {
	    	DataAccessInt dai = new CachedDataAccess(DBMS.OLTP_DATASOURCE_NAME);
	    	Request r = new Request();
	    	r.setContentHandle("long_contest_round_terms");
	    	
	    	Map m = dai.getData(r);
	    	ResultSetContainer rsc = (ResultSetContainer)m.get("long_contest_round_terms");
	    	
	    	if(rsc.isEmpty()) {
	    		log.error("Could not find round terms for: " + roundID);
	    		throw new TCWebException("Error retrieving page.");
	    	} else {
	    		getRequest().setAttribute(Constants.ROUND_TERMS_KEY, rsc.getStringItem(0, "terms_content "));
	    	}

    	} catch(Exception e) {
    		e.printStackTrace();
    		throw new TCWebException("Error retrieving page.");
    	}
    	setNextPage(Constants.PAGE_VIEW_REG);
    	setIsNextPageInContext(true);
    }
    
}
