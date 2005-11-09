package com.topcoder.web.codinginterface.longcontest.controller.request;

import java.util.Map;

import com.topcoder.web.codinginterface.longcontest.Constants;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.web.common.TCRequest;
import com.topcoder.web.common.TCWebException;
import com.topcoder.shared.util.logging.Logger;


public class ViewProblemSolution extends Base{
    protected static final Logger log = Logger.getLogger(ViewProblemSolution.class);

    protected void businessProcessing() throws TCWebException {
        try{
            TCRequest request = getRequest();
            Request r = new Request();
            r.setContentHandle("long_contest_submission");
            r.setProperty(Constants.CODER_ID,request.getParameter(Constants.CODER_ID));
            r.setProperty(Constants.PROBLEM_ID,request.getParameter(Constants.PROBLEM_ID));
            r.setProperty(Constants.ROUND_ID,request.getParameter(Constants.ROUND_ID));
            r.setProperty(Constants.SUBMISSION_NUMBER,request.getParameter(Constants.SUBMISSION_NUMBER));
            DataAccessInt dataAccess = getDataAccess(DBMS.DW_DATASOURCE_NAME, true);
            Map m = dataAccess.getData(r);
 //           ResultSetContainer rsc = (ResultSetContainer)m.get("long_contest_over");
 //           boolean over = rsc.getBooleanItem(0,0);
 //           if(!over){
 //               throw new TCWebException("Long contest is not over yet.");
 //           }
            request.setAttribute("resultMap", m);
            setNextPage(Constants.PAGE_PROBLEM_SOLUTION);
            setIsNextPageInContext(true);
        }catch(TCWebException e){
            throw e;
        }catch(Exception e){
            e.printStackTrace();
            throw new TCWebException("Error retrieving page.");
        }
    }
}
