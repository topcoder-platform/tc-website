package com.topcoder.web.tc.controller.request.problemRating;

import com.topcoder.web.common.TCWebException;
import com.topcoder.web.tc.Constants;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.web.tc.model.ProblemRatingResult;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

public class Results extends Base {
    protected void businessProcessing() throws TCWebException {
        try{
            getRequest().setAttribute("problemRatingResults",getProblemResults(Integer.parseInt(getRequest().getParameter(Constants.PROBLEM_ID))));
            setNextPage(Constants.PROBLEM_RATING_RESULTS);
            setIsNextPageInContext(true);
        }catch(Exception e){
            e.printStackTrace();
        }
    }

    protected final List getProblemResults(int problemID)throws Exception {
        Request r = new Request();
        r.setContentHandle("Problem Rating Results");
        r.setProperty("pm", String.valueOf(problemID));
        //response data has to be live, no cache
        DataAccessInt dataAccess = getDataAccess();
        Map qMap = dataAccess.getData(r);
        ResultSetContainer questions = (ResultSetContainer) qMap.get("Problem Rating Results");

        ResultSetContainer.ResultSetRow question = null;
        List prList = new ArrayList(questions.size());
        for (Iterator it = questions.iterator(); it.hasNext();) {
            question = (ResultSetContainer.ResultSetRow) it.next();
            prList.add(new ProblemRatingResult(question.getStringItem("question"),Double.parseDouble(question.getItem("average").toString())));
        }
        return prList;
    }


}

