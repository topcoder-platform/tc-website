package com.topcoder.web.tc.controller.request.problemRating;

import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.tc.controller.request.Base;
import com.topcoder.web.tc.model.ProblemRatingQuestion;
import com.topcoder.web.tc.model.ProblemRatingResult;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

abstract public class PRBase extends Base {


    protected void processResults() throws Exception{
        Request r = new Request();
        String pid = getRequest().getParameter(Constants.PROBLEM_ID);
        if(pid==null) 
            throw new Exception("pid was null");
        r.setContentHandle("Problem Rating Results");
        r.setProperty("pm", pid);
        //response data has to be live, no cache
        DataAccessInt dataAccess = getDataAccess();
        Map qMap = dataAccess.getData(r);
        ResultSetContainer questions = (ResultSetContainer) qMap.get("problem rating results");
        ResultSetContainer problemName = (ResultSetContainer) qMap.get("problem name");
        if(problemName.size()==0){
            throw new Exception("Problem not yet used, or non-existent.");
        }
        getRequest().setAttribute("problemRatingResults",questions);
        getRequest().setAttribute("problemName",problemName.getRow(0).getStringItem("name"));

        //get the info for the distribution graphs
        List overall = getDistributionList(getDataAccess().getData(r), "overall_problem_rating_distribution");
        List competitor = getDistributionList(getDataAccess().getData(r), "compeitor_problem_rating_distribution");
        ProblemRatingResult overallAvg = avg(overall);
        ProblemRatingResult competitorAvg = avg(competitor);
        overallAvg.setName("overall");
        competitorAvg.setName("overallComp");
        overall.add(overallAvg);
        competitor.add(competitorAvg);
        getRequest().setAttribute("overallDistribution", overall);
        getRequest().setAttribute("competitorDistribution", competitor);

        setNextPage(Constants.PROBLEM_RATING_RESULTS);
        setIsNextPageInContext(true);
    }

    protected void processQuestions() throws Exception{
        long userID = getUser().getId();
        Request r = new Request();
        r.setContentHandle("Problem Rating Questions");
        String pid = getRequest().getParameter(Constants.PROBLEM_ID);
        if(pid==null) 
            throw new Exception("pid was null");
        r.setProperty("pm", pid);
        r.setProperty("cr", String.valueOf(userID));
        //response data has to be live, no cache
        DataAccessInt dataAccess = getDataAccess();
        Map qMap = dataAccess.getData(r);
        ResultSetContainer ratings = (ResultSetContainer) qMap.get("problem rated");
        if(ratings.getRow(0).getIntItem("count")!=0){
            processResults();
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
        if(problemName.size()==0){
            throw new Exception("Problem not yet used, or non-existent.");
        }
        getRequest().setAttribute("problemName",problemName.getRow(0).getStringItem("name"));
        setNextPage(Constants.PROBLEM_RATING_QUESTIONS);
        setIsNextPageInContext(true);
    }


    protected static List getDistributionList(Map m, String key) throws Exception {

        ResultSetContainer rsc = (ResultSetContainer)m.get(key);
        ResultSetContainer.ResultSetRow row = null;

        List ret = new ArrayList(rsc.size());
        ProblemRatingResult result = null;
        for (Iterator it = rsc.iterator(); it.hasNext();) {
            row = (ResultSetContainer.ResultSetRow)it.next();
            result = new ProblemRatingResult();
            result.setName(row.getStringItem("name"));
            ArrayList frequencies = new ArrayList(10);
            for (int i=1; i<11; i++) {
                frequencies.add(row.getItem("rating_"+i).getResultData());
            }
            result.setFrequencies(frequencies);
            ret.add(result);
        }
        return ret;
    }


    protected static ProblemRatingResult avg(List list) {
        int[] sums;
        if (!list.isEmpty())
            sums =  new int[((ProblemRatingResult)list.get(0)).getFrequencies().size()];
        else sums = new int[0];
        ProblemRatingResult pr = null;
        //go through each question
        for (int k=list.size(); --k>=0;) {
            pr = (ProblemRatingResult) list.get(k);
            //go through each question's distribution of responses
            for (int i=pr.getFrequencies().size(); --i>=0;) {
                sums[i]+=((Number)pr.getFrequencies().get(i)).intValue();
            }
        }
        ProblemRatingResult ret = new ProblemRatingResult();
        List freqs = new ArrayList(sums.length);
        //generate an average of the distributions
        for (int i=0; i<sums.length; i++) {
            freqs.add(new Float((float)sums[i]/list.size()));
        }
        ret.setFrequencies(freqs);
        return ret;
    }


}
