package com.topcoder.web.codinginterface.longcontest.controller.request;

import java.util.Map;

import com.topcoder.web.codinginterface.longcontest.Constants;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.web.common.TCRequest;
import com.topcoder.web.common.TCWebException;
import com.topcoder.shared.util.logging.Logger;


public class ViewTestCase extends Base{
    protected static final Logger log = Logger.getLogger(ViewTestCase.class);

    protected void businessProcessing() throws TCWebException {
        try{
            TCRequest request = getRequest();
            Request r = new Request();
            r.setContentHandle("long_test_case");
            r.setProperty(Constants.COMPONENT_ID,request.getParameter(Constants.COMPONENT_ID));
            r.setProperty(Constants.ROUND_ID,request.getParameter(Constants.ROUND_ID));
            r.setProperty(Constants.TEST_CASE_ID,request.getParameter(Constants.TEST_CASE_ID));
            DataAccessInt dataAccess = getDataAccess(false);
            Map m = dataAccess.getData(r);
            ResultSetContainer rsc = (ResultSetContainer)m.get("long_contest_over");
            boolean over = rsc.getBooleanItem(0,0);
            if(!over){
                throw new TCWebException("Long contest is not over yet.");
            }
            request.setAttribute(Constants.LONG_TEST_KEY, m);
            setNextPage(Constants.LONG_TEST_JSP);
            setIsNextPageInContext(true);
        }catch(TCWebException e){
            throw e;
        }catch(Exception e){
            e.printStackTrace();
            throw new TCWebException("Error retrieving page.");
        }
    }
}
