package com.topcoder.web.codinginterface.longcontest.controller.request;

import java.util.Map;

import com.topcoder.web.codinginterface.longcontest.Constants;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.web.common.TCRequest;
import com.topcoder.web.common.TCWebException;
import com.topcoder.shared.util.logging.Logger;


public class ViewActiveContests extends Base{
	
    protected static final Logger log = Logger.getLogger(ViewActiveContests.class);

    protected void businessProcessing() throws TCWebException {
//        try {
//            TCRequest request = getRequest();
//            
//        }catch(TCWebException e){
//            throw e;
//        }catch(Exception e){
//            e.printStackTrace();
//            throw new TCWebException("Error retrieving page.");
//        }
    	setNextPage(Constants.PAGE_ACTIVE_CONTESTS);
    	setIsNextPageInContext(true);
    }
}
