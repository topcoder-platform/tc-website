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
    	setNextPage(Constants.PAGE_VIEW_REG);
    	setIsNextPageInContext(true);
    }
    
}
