package com.topcoder.web.codinginterface.longcontest.controller.request;

import java.util.Map;

import com.topcoder.web.codinginterface.longcontest.Constants;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.web.common.TCRequest;
import com.topcoder.web.common.TCWebException;
import com.topcoder.shared.util.logging.Logger;


public class Index extends Base{
    protected static final Logger log = Logger.getLogger(Index.class);

    protected void businessProcessing() throws TCWebException {
        try{
            TCRequest request = getRequest();
            Request r = new Request();
            r.setContentHandle("long_problems");
            DataAccessInt dataAccess = getDataAccess(false);
            Map m = dataAccess.getData(r);
            request.setAttribute(Constants.LONG_CONTEST_INDEX_KEY, m);
            setNextPage(Constants.INDEX_JSP);
            setIsNextPageInContext(true);
        }catch(Exception e){
            e.printStackTrace();
            throw new TCWebException("Error retrieving page.");
        }
    }
}
