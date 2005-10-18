package com.topcoder.web.codinginterface.longcontest.controller.request;

import java.util.Map;

import com.topcoder.web.codinginterface.longcontest.Constants;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.web.common.TCRequest;
import com.topcoder.web.common.TCWebException;
import com.topcoder.shared.util.logging.Logger;


public class SubmissionHistory extends Base{
    protected static final Logger log = Logger.getLogger(SubmissionHistory.class);

    protected void businessProcessing() throws TCWebException {
        try{
            TCRequest request = getRequest();
            Request r = new Request();
            r.setContentHandle("long_coder_submissions");
            r.setProperty(Constants.CODER_ID,request.getParameter(Constants.CODER_ID));
            r.setProperty(Constants.COMPONENT_ID,request.getParameter(Constants.COMPONENT_ID));
            r.setProperty(Constants.ROUND_ID,request.getParameter(Constants.ROUND_ID));
            DataAccessInt dataAccess = getDataAccess(false);
            Map m = dataAccess.getData(r);
            request.setAttribute(Constants.LONG_CONTEST_CODER_SUBMISSIONS_KEY, m);
            setNextPage(Constants.CODER_SUBMISSIONS_JSP);
            setIsNextPageInContext(true);
        }catch(Exception e){
            e.printStackTrace();
            throw new TCWebException("Error retrieving page.");
        }
    }
}
