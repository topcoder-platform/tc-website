package com.topcoder.web.tc.controller.request.problemRating;

import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.CachedDataAccess;
import com.topcoder.shared.dataAccess.DataAccess;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.tc.model.ProblemRatingQuestion;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.web.tc.Constants;

import javax.naming.InitialContext;
import javax.sql.DataSource;
import javax.rmi.PortableRemoteObject;
import java.util.List;
import java.util.ArrayList;
import java.util.Map;
import java.util.Iterator;

abstract public class Base extends BaseProcessor {


    public DataAccessInt getDataAccess() throws Exception {
        return getDataAccess(DBMS.OLTP_DATASOURCE_NAME, false);
    }

    public DataAccessInt getDataAccess(boolean cached) throws Exception {
        return getDataAccess(DBMS.OLTP_DATASOURCE_NAME, cached);
    }

    public DataAccessInt getDataAccess(String datasource, boolean cached) throws Exception {
        if (datasource == null) return null;
        InitialContext context = new InitialContext();
        DataSource ds = (DataSource)
                PortableRemoteObject.narrow(context.lookup(datasource),
                        DataSource.class);
        close(context);
        DataAccessInt dAccess = null;
        if (cached)
            dAccess = new CachedDataAccess(ds);
        else
            dAccess = new DataAccess(ds);
        return dAccess;
    }
    protected void processResults() throws Exception{
        System.out.println("in processResults()");
        Request r = new Request();
        r.setContentHandle("Problem Rating Results");
        r.setProperty("pm", getRequest().getParameter(Constants.PROBLEM_ID));
        //response data has to be live, no cache
        DataAccessInt dataAccess = getDataAccess();
        Map qMap = dataAccess.getData(r);
        ResultSetContainer questions = (ResultSetContainer) qMap.get("problem rating results");
        ResultSetContainer problemName = (ResultSetContainer) qMap.get("problem name");
        getRequest().setAttribute("problemRatingResults",questions);
        getRequest().setAttribute("problemName",problemName.getRow(0).getStringItem("name"));
    }

    protected void processQuestions() throws Exception{
        System.out.println("in processQuestions()");
        long userID = getUser().getId();
        Request r = new Request();
        r.setContentHandle("Problem Rating Questions");
        r.setProperty("pm", getRequest().getParameter(Constants.PROBLEM_ID));
        r.setProperty("cr", String.valueOf(userID));
        //response data has to be live, no cache
        DataAccessInt dataAccess = getDataAccess();
        Map qMap = dataAccess.getData(r);
        ResultSetContainer ratings = (ResultSetContainer) qMap.get("problem rated");
        if(ratings.getRow(0).getIntItem("count")!=0){
            processResults();
            setNextPage(Constants.PROBLEM_RATING_RESULTS);
            setIsNextPageInContext(true);
            return;
        }
        ResultSetContainer questionRSC = (ResultSetContainer) qMap.get("problem rating questions");
        ResultSetContainer problemName = (ResultSetContainer) qMap.get("problem name");
        Iterator it = questionRSC.iterator();
        List questions = new ArrayList(10);
        while(it.hasNext()){
            ResultSetContainer.ResultSetRow row = (ResultSetContainer.ResultSetRow)it.next();
            ProblemRatingQuestion prq = new ProblemRatingQuestion();
            prq.setQuestion(row.getStringItem("question"));
            prq.setID(row.getIntItem("question_id"));
            questions.add(prq);
        }
        getRequest().setAttribute("problemRatingQuestions",questions);
        getRequest().setAttribute("problemName",problemName.getRow(0).getStringItem("name"));
    }
}
