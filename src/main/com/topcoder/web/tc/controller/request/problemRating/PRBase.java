package com.topcoder.web.tc.controller.request.problemRating;

import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.tc.controller.request.Base;
import com.topcoder.web.tc.model.ProblemRatingQuestion;
import com.topcoder.web.tc.model.ProblemRatingDistribution;
import com.topcoder.web.tc.model.ProblemRatingResult;

import java.util.*;

abstract public class PRBase extends Base {

    protected static int NUM_RATINGS = 10;

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
        getRequest().setAttribute("problemRatingResults",buildResultList(questions));
        getRequest().setAttribute("problemName",problemName.getRow(0).getStringItem("name"));

        //get the info for the distribution graphs
        List overall = getDistributionList(
                (ResultSetContainer)qMap.get("overall_votes"),
                (ResultSetContainer)qMap.get("div1_overall_votes"),
                (ResultSetContainer)qMap.get("div2_overall_votes"));
        List div1 = getDistributionList(qMap, "div1_problem_rating_distribution");
        List div2 = getDistributionList(qMap, "div2_problem_rating_distribution");

        ProblemRatingDistribution overallAvg = avg(overall);
        ProblemRatingDistribution div1Avg = avg(div1);
        ProblemRatingDistribution div2Avg = avg(div2);

        overallAvg.setName("overallAll");
        div1Avg.setName("overallDiv1");
        div2Avg.setName("overallDiv2");

        overall.add(overallAvg);
        div1.add(div1Avg);
        div2.add(div2Avg);

        getRequest().setAttribute("overallDistribution", overall);
        getRequest().setAttribute("div1Distribution", div1);
        getRequest().setAttribute("div2Distribution", div2);

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
            prq.setQuestionDesc(row.getStringItem("question_desc"));
            questions.add(prq);
        }
        getRequest().setAttribute("problemRatingQuestions",questions);

        if(problemName.size()==0){
            throw new Exception("Problem not yet used, or non-existent.");
        }
        getRequest().setAttribute("problemName",problemName.getRow(0).getStringItem("name"));

        ResultSetContainer ratedCount = (ResultSetContainer) qMap.get("rated count");
        getRequest().setAttribute("showResults", ratedCount.getIntItem(0, "count")>0?"true":"false");

        setNextPage(Constants.PROBLEM_RATING_QUESTIONS);
        setIsNextPageInContext(true);
    }

    protected static List getDistributionList(Map m, String key) throws Exception {

        ResultSetContainer rsc = (ResultSetContainer)m.get(key);
        ResultSetContainer.ResultSetRow row = null;

        List ret = new ArrayList(rsc.size());
        ProblemRatingDistribution result = null;
        for (Iterator it = rsc.iterator(); it.hasNext();) {
            row = (ResultSetContainer.ResultSetRow)it.next();
            result = new ProblemRatingDistribution();
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

    protected static List getDistributionList(ResultSetContainer rsc1,
                                              ResultSetContainer rsc2,
                                              ResultSetContainer rsc3) throws Exception {
        ArrayList ret = new ArrayList(3);

        ProblemRatingDistribution overall = buildDistribution(rsc1);
        overall.setName("overallAll");
        ret.add(overall);

        ProblemRatingDistribution div1 = buildDistribution(rsc2);
        div1.setName("overalllDiv1");
        ret.add(div1);

        ProblemRatingDistribution div2 = buildDistribution(rsc3);
        div2.setName("overallDiv2");
        ret.add(div2);
        return ret;
    }


    /**
     * figure out the average distribution given a list
     * @param list
     * @return
     */
    protected static ProblemRatingDistribution avg(List list) {
        int[] sums;
        if (!list.isEmpty())
            sums =  new int[((ProblemRatingDistribution)list.get(0)).getFrequencies().size()];
        else sums = new int[0];
        ProblemRatingDistribution pr = null;
        //go through each question
        for (int k=list.size(); --k>=0;) {
            pr = (ProblemRatingDistribution) list.get(k);
            //go through each question's distribution of responses
            for (int i=pr.getFrequencies().size(); --i>=0;) {
                sums[i]+=((Number)pr.getFrequencies().get(i)).intValue();
            }
        }
        ProblemRatingDistribution ret = new ProblemRatingDistribution();
        List freqs = new ArrayList(sums.length);
        //generate an average of the distributions
        for (int i=0; i<sums.length; i++) {
            freqs.add(new Float((float)sums[i]/list.size()));
        }
        ret.setFrequencies(freqs);
        return ret;
    }

    protected static ProblemRatingDistribution buildDistribution(ResultSetContainer list) {
        int[] sums = new int[NUM_RATINGS+1];
        //generate the distribution of responses
        for (int k=list.size(); --k>=0;) {
            sums[list.getIntItem(k, "avg")]++;
        }
        ProblemRatingDistribution ret = new ProblemRatingDistribution();
        List freqs = new ArrayList(NUM_RATINGS);
        for (int i=1; i<sums.length; i++) {
            freqs.add(new Integer(sums[i]));
        }
        ret.setFrequencies(freqs);
        return ret;
    }

    protected static List buildResultList(ResultSetContainer rsc) {
        ResultSetContainer.ResultSetRow row = null;
        ArrayList ret = new ArrayList(rsc.size()+1);
        int[] counts = new int[rsc.size()];
        float[] avgs = new float[rsc.size()];
        Arrays.fill(counts, 0);
        Arrays.fill(avgs, 0.0f);
        ProblemRatingResult prr = null;
        //build the data up to take a weighted average of the ratings
        //weighted by number of responses per question
        for (Iterator it = rsc.iterator(); it.hasNext();) {
            row = (ResultSetContainer.ResultSetRow)it.next();
            prr = makeResult(row);
            ret.add(prr);
            counts[0]+=prr.getOverallCount().intValue();
            counts[1]+=prr.getDiv1Count().intValue();
            counts[2]+=prr.getDiv2Count().intValue();
            avgs[0]+=prr.getOverallAverage().floatValue()*prr.getOverallCount().intValue();
            avgs[1]+=prr.getDiv1Average().floatValue()*prr.getDiv1Count().intValue();
            avgs[2]+=prr.getDiv2Average().floatValue()*prr.getDiv2Count().intValue();
        }
        ProblemRatingResult overall = new ProblemRatingResult();
        overall.setOverallCount(counts[0]);
        overall.setDiv1Count(counts[1]);
        overall.setDiv2Count(counts[2]);
        //comparing to a float value, gasp!
        overall.setOverallAverage(avgs[0]==0.0f?0.0f:avgs[0]/counts[0]);
        overall.setDiv1Average(avgs[1]==0.0f?0.0f:avgs[1]/counts[1]);
        overall.setDiv2Average(avgs[2]==0.0f?0.0f:avgs[2]/counts[2]);
        overall.setQuestion("Overall");
        ret.add(overall);
        return ret;
    }

    protected static ProblemRatingResult makeResult(ResultSetContainer.ResultSetRow row) {
        ProblemRatingResult ret = new ProblemRatingResult();
        try {
            ret.setDiv1Average(row.getFloatItem("div1_average"));
            ret.setDiv1Count(row.getIntItem("div1_count"));
        } catch (NullPointerException e) {
            ret.setDiv1Average(0.0f);
            ret.setDiv1Count(0);
        }
        try {
            ret.setDiv2Average(row.getFloatItem("div2_average"));
            ret.setDiv2Count(row.getIntItem("div2_count"));
        } catch (NullPointerException e) {
            ret.setDiv2Average(0.0f);
            ret.setDiv2Count(0);
        }
        try {
            ret.setOverallCount(row.getIntItem("count"));
            ret.setOverallAverage(row.getFloatItem("average"));
        } catch (NullPointerException e) {
            //this should never happen
            ret.setOverallCount(0);
            ret.setOverallAverage(0.0f);
        }
        ret.setQuestion(row.getStringItem("question"));
        return ret;
    }

}
