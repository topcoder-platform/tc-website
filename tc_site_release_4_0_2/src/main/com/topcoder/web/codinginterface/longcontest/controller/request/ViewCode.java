package com.topcoder.web.codinginterface.longcontest.controller.request;

import java.util.Map;

import com.topcoder.web.codinginterface.longcontest.Constants;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.web.common.TCRequest;
import com.topcoder.web.common.TCWebException;
import com.topcoder.shared.util.logging.Logger;


public class ViewCode extends Base{
    protected static final Logger log = Logger.getLogger(ViewCode.class);

    protected void businessProcessing() throws TCWebException {
        try{
            TCRequest request = getRequest();
            Request r = new Request();
            r.setContentHandle("long_code");
            r.setProperty(Constants.CODER_ID,request.getParameter(Constants.CODER_ID));
            r.setProperty(Constants.COMPONENT_ID,request.getParameter(Constants.COMPONENT_ID));
            r.setProperty(Constants.ROUND_ID,request.getParameter(Constants.ROUND_ID));
            r.setProperty(Constants.SUBMISSION_NUMBER,request.getParameter(Constants.SUBMISSION_NUMBER));
            DataAccessInt dataAccess = getDataAccess(false);
            Map m = dataAccess.getData(r);
            ResultSetContainer rsc = (ResultSetContainer)m.get("long_contest_over");
            boolean over = rsc.getBooleanItem(0,0);
            if(!over){
                throw new TCWebException("Long contest is not over yet.");
            }
            request.setAttribute(Constants.LONG_CODE_KEY, m);
            setNextPage(Constants.LONG_CODE_JSP);
            setIsNextPageInContext(true);
        }catch(TCWebException e){
            throw e;
        }catch(Exception e){
            e.printStackTrace();
            throw new TCWebException("Error retrieving page.");
        }
    }
}
