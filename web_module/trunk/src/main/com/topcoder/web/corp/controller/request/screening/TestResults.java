package com.topcoder.web.corp.controller.request.screening;

import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.corp.common.Constants;
import com.topcoder.web.corp.common.PermissionDeniedException;
import com.topcoder.web.corp.common.ScreeningException;
import com.topcoder.web.corp.common.Util;
import com.topcoder.web.corp.model.*;

import javax.servlet.http.HttpUtils;
import java.util.*;

/**
 * Processing for the Test Results page.
 * @author Porgery
 */
public class TestResults extends BaseScreeningProcessor {
    private final static Logger log = Logger.getLogger(TestResults.class);

    protected CandidateInfo cinfo = new CandidateInfo();
    protected List problemSetAList = null;
    protected List problemSetBList = null;

    /** Implements the processing step.
     * @throws com.topcoder.web.common.TCWebException
     */
    protected void screeningProcessing() throws TCWebException {
        try {

            DataAccessInt dAccess = Util.getDataAccess();
            Request dr = new Request();
            dr.setProperties(HttpUtils.parseQueryString(getRequest().getQueryString()));
            dr.setContentHandle("testResults");
            dr.setProperty("uid", String.valueOf(getUser().getId()));
            Map map = dAccess.getData(dr);
            if (map == null)
                throw new ScreeningException("getData failed!");

            ResultSetContainer access = (ResultSetContainer) map.get("checkSessionAccess");
            if (access.isEmpty()) {
                throw new PermissionDeniedException(
                        "You are not authorized to view information about this session.");
            }
            ResultSetContainer result = (ResultSetContainer) map.get("sessionInfo");
            TestResultsInfo tinfo = new TestResultsInfo();
            tinfo.setSessionId(Long.parseLong(getRequest().getParameter(Constants.SESSION_ID)));
            ProfileInfo pinfo = new ProfileInfo();
            pinfo.setHasTestSetA(result.getItem(0, "session_round_id").getResultData() != null);
            problemSetAList = new ArrayList();
            pinfo.setTestSetAList(problemSetAList);
            if (pinfo.hasTestSetA()) {
                Map graphData = new HashMap();
                Map graphDataCompany = new HashMap();
                Map percents = new HashMap();
                
                String roundId = result.getItem(0, "contest_round_id").toString();
                String divisionId = result.getItem(0, "contest_division_id").toString();
                DataAccessInt dwAccess = Util.getDataAccess(Constants.DW_DATA_SOURCE, true);
                dr = new Request();
                dr.setContentHandle("roundProblemStats");
                dr.setProperty("rd", roundId);
                dr.setProperty("dn", divisionId);
                Map dwMap = dwAccess.getData(dr);
                if (map == null)
                    throw new ScreeningException("getData failed!");
                ResultSetContainer testAResults = (ResultSetContainer) map.get("testSetAResults");
                tinfo.setProblemSetAResults(testAResults);
                
                ResultSetContainer stats = (ResultSetContainer) dwMap.get("roundProblemStats");
                for(int i = 0; i < stats.size(); i++) {
                    dr = new Request();
                    dr.setContentHandle("set_a_histogram_data");
                    dr.setProperty("rd", roundId);
                    dr.setProperty("dn", divisionId);
                    dr.setProperty("pm", String.valueOf(stats.getLongItem(i, "problem_id")));
                    
                    Map graphStats = dwAccess.getData(dr);
                    ResultSetContainer histogramData = (ResultSetContainer)graphStats.get("set_a_histogram_data");
                    
                    GraphData gd = new GraphData();
                    
                    int c = 0;
                    c = histogramData.getColumnCount() / 2;
                    for(int j = 1; j <= c; j++) {
                        gd.addItem(histogramData.getStringItem(0, "bucket" + j + "color"), histogramData.getIntItem(0, "bucket" + j));
                    }
                    
                    //find the corresponding row in testSetAResults
                    int x = 0;
                    for(int j = 0; j < testAResults.size(); j++) {
                        if(stats.getLongItem(i, "problem_id") == testAResults.getLongItem(j, "problem_id")) {
                            x = j;
                            break;
                        }
                    }
                    
                    //get annotation
                    dr = new Request();
                    dr.setContentHandle("set_a_histogram_annotation");
                    dr.setProperty("sid", String.valueOf(tinfo.getSessionId()));
                    dr.setProperty("pid", String.valueOf(stats.getLongItem(i, "problem_id")));
                    
                    Map annotationMap = dAccess.getData(dr);
                    ResultSetContainer annotation = (ResultSetContainer)annotationMap.get("set_a_histogram_annotation");
                    if(annotation.size() != 0) {
                        gd.setAnnotation(annotation.getIntItem(0, "bucket"));
                    }
                                        
                    graphData.put(String.valueOf(stats.getLongItem(i, "problem_id")), gd);
                    
                    //get percentiles
                    dr = new Request();
                    dr.setContentHandle("candidate_percentile");
                    dr.setProperty("tm", String.valueOf(testAResults.getLongItem(x, "total_time")));
                    dr.setProperty("pm", String.valueOf(stats.getLongItem(i, "problem_id")));
                    
                    Map percentStats = dwAccess.getData(dr);
                    ResultSetContainer percentData = (ResultSetContainer)percentStats.get("candidate_percentile");
                    percents.put(String.valueOf(stats.getLongItem(i, "problem_id")), new Double(((ResultSetContainer) percentStats.get("candidate_percentile")).getDoubleItem(0, "percentile")));
                    
                    //company graph data
                    Request dr2 = new Request();
                    dr2.setContentHandle("set_b_histogram_data");
                    dr2.setProperty("sid", String.valueOf(tinfo.getSessionId()));
                    dr2.setProperty("pid", String.valueOf(stats.getLongItem(i, "problem_id")));
                    Map m2 = dAccess.getData(dr2);

                    histogramData = (ResultSetContainer)m2.get("set_b_histogram_data");

                    gd = new GraphData();

                    c = 0;
                    c = histogramData.getColumnCount() / 2;
                    for(int j = 1; j <= c; j++) {
                        gd.addItem(histogramData.getStringItem(0, "bucket" + j + "color"), histogramData.getIntItem(0, "bucket" + j));
                    }

                    gd.setAnnotation(histogramData.getIntItem(0, "annotation"));

                    graphDataCompany.put(String.valueOf(stats.getLongItem(i, "problem_id")), gd);
                }
                tinfo.setProblemSetATCStats(stats);
                tinfo.setProblemSetAGraphData(graphData);
                tinfo.setProblemSetAGraphDataCompany(graphDataCompany);
                tinfo.setProblemSetAPercentiles(percents);
                pinfo.setTestSetAName(result.getItem(0, "session_round_name").toString());

                ResultSetContainer dwResult = (ResultSetContainer) map.get("testSetAResults");
                for (int i = 0; i < dwResult.size(); i++) {
                    problemSetAList.add(
                            ProblemInfo.createProblemInfo(
                                    getUser(),
                                    Long.parseLong(dwResult.getItem(i, "session_round_id").toString()),
                                    Long.parseLong(dwResult.getItem(i, "problem_id").toString())));
                }
            }

            TestSessionInfo sessionInfo = new TestSessionInfo();
            sessionInfo.setBeginDate(((Date) result.getItem(0, "begin_time").getResultData()));
            sessionInfo.setEndDate(((Date) result.getItem(0, "end_time").getResultData()));
            getRequest().setAttribute("testSessionInfo", sessionInfo);

            cinfo = new CandidateInfo();
            cinfo.setUserName(result.getItem(0, "handle").toString());
            cinfo.setUserId(Long.valueOf(result.getItem(0, "user_id").toString()));
            cinfo.setPreference(result.getIntItem(0, "preference_level"));
            getRequest().setAttribute("candidateInfo", cinfo);

            Date curr = (Date) result.getItem(0, "current_time").getResultData();
            Date maxEnd = (Date) result.getItem(0, "max_end_time").getResultData();
            Date end = (Date) result.getItem(0, "end_time").getResultData();
            tinfo.setSessionComplete(Math.min(maxEnd.getTime(), end.getTime()) < curr.getTime());
            tinfo.setProblemSetBCount(Integer.parseInt(result.getItem(0, "num_set_b").toString()));
            tinfo.setProblemSetBResults((ResultSetContainer) map.get("testSetBResults"));

            ResultSetContainer rscB = (ResultSetContainer) map.get("testSetBResults");
            Map percents = new HashMap();
            Map graphData = new HashMap();
            for (int i = 0; i < tinfo.getProblemSetBCount(); i++) {
                dAccess = Util.getDataAccess();
                //get percentile info
                Request dr2 = new Request();
                dr2.setContentHandle("candidate_percentile");
                dr2.setProperty("sid", String.valueOf(tinfo.getSessionId()));
                dr2.setProperty("pid", String.valueOf(rscB.getLongItem(i, "problem_id")));
                dr2.setProperty("tm", String.valueOf(rscB.getLongItem(i, "total_time")));
                Map m2 = dAccess.getData(dr2);

                percents.put(String.valueOf(rscB.getLongItem(i, "problem_id")), new Double(((ResultSetContainer) m2.get("candidate_percentile")).getDoubleItem(0, "percentile")));

                dr2 = new Request();
                dr2.setContentHandle("set_b_histogram_data");
                dr2.setProperty("sid", String.valueOf(tinfo.getSessionId()));
                dr2.setProperty("pid", String.valueOf(rscB.getLongItem(i, "problem_id")));
                m2 = dAccess.getData(dr2);
                
                ResultSetContainer histogramData = (ResultSetContainer)m2.get("set_b_histogram_data");
                
                GraphData gd = new GraphData();
                
                int c = 0;
                c = histogramData.getColumnCount() / 2;
                for(int j = 1; j <= c; j++) {
                    gd.addItem(histogramData.getStringItem(0, "bucket" + j + "color"), histogramData.getIntItem(0, "bucket" + j));
                }
                
                gd.setAnnotation(histogramData.getIntItem(0, "annotation"));
                
                graphData.put(String.valueOf(rscB.getLongItem(i, "problem_id")), gd);
            }

            tinfo.setProblemSetBGraphData(graphData);
            tinfo.setProblemSetBPercentiles(percents);

            //lookup stats
            Request dr3 = new Request();
            dr3.setContentHandle("problem_statistics");
            dr3.setProperties(HttpUtils.parseQueryString(getRequest().getQueryString()));
            Map map3 = dAccess.getData(dr3);

            tinfo.setProblemSetBStats((ResultSetContainer) map3.get("problem_statistics"));

            getRequest().setAttribute("testResultsInfo", tinfo);

            pinfo.setProfileName(result.getItem(0, "session_profile_desc").toString());

            problemSetBList = new ArrayList();
            ResultSetContainer resultB = (ResultSetContainer) map.get("testSetBResults");
            for (int i = 0; i < resultB.size(); i++) {
                problemSetBList.add(
                        ProblemInfo.createProblemInfo(
                                getUser(),
                                Long.parseLong(resultB.getItem(i, "session_round_id").toString()),
                                Long.parseLong(resultB.getItem(i, "problem_id").toString())));
            }
            pinfo.setTestSetBList(problemSetBList);
            getRequest().setAttribute("profileInfo", pinfo);
            getRequest().setAttribute(Constants.USER_ID, String.valueOf(getUser().getId()));
        } catch (TCWebException e) {
            throw e;
        } catch (Exception e) {
            throw(new TCWebException(e));
        }

        setNextPage(Constants.TEST_RESULTS_PAGE);
        setIsNextPageInContext(true);
    }

}
