package com.topcoder.web.tc.controller.request;

import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.CachedDataAccess;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.cache.MaxAge;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.tc.model.ActiveContestsSummary;
import com.topcoder.web.tc.controller.request.tournament.tccc06.ViewAlgoRegistration;
import com.topcoder.web.tc.controller.request.util.TCCC06ComponentTerms;

import java.util.Map;
import java.util.HashMap;

public class Home extends Base {
    public static final String DESIGN = "design";
    public static final String ASSEMBLY = "assembly";
    public static final String DEVELOPMENT = "dev";
    public static final String APPLICATION_TESTING = "apptesting";
    public static final String ARCHITECTURE= "arch";
    public static final String CONCEPTUALIZATION = "concept";
    public static final String SPECIFICATION = "spec";
    public static final String STUDIO = "studio";
    public static final String BUGS = "bugs";
    public static final String DR = "dr";
    public static final String MM = "mm";
    public static final String NEXT_ALGO = "nextalgo";

    protected void businessProcessing() throws TCWebException {
        if (getUser().isAnonymous()) {
            loadPublicData();
            setNextPage(Constants.PUBLIC_HOME_PAGE);
        } else {
            loadPublicData();
            loadMemberData();
            setNextPage(Constants.MEMBER_HOME_PAGE);
        }
        setIsNextPageInContext(true);
    }

    protected void loadPublicData() throws TCWebException {
        try {
            CachedDataAccess nextRoundDai = new CachedDataAccess(MaxAge.HALF_HOUR, DBMS.OLTP_DATASOURCE_NAME);
            Request nextRoundReq = new Request();
            nextRoundReq.setContentHandle("next_srm");
            getRequest().setAttribute("Next_SRM", nextRoundDai.getData(nextRoundReq).get("Next_SRM"));

            CachedDataAccess dwDai = new CachedDataAccess(DBMS.DW_DATASOURCE_NAME);
            Request dataRequest = new Request();
            dataRequest.setContentHandle("public_home_data");
            dataRequest.setProperty("sr", "1");
            dataRequest.setProperty("er", "10");   // just get the top 10

            Map<String, ResultSetContainer> map = dwDai.getData(dataRequest);

            getRequest().setAttribute("top_coders", map.get("Coder_Ratings"));
            getRequest().setAttribute("top_mm_coders",map.get("marathon_coder_rank"));
            getRequest().setAttribute("School_Avg_Rating",map.get("School_Avg_Rating"));
            getRequest().setAttribute("Country_Avg_Rating",map.get("Country_Avg_Rating"));
            getRequest().setAttribute("top_developers",map.get("top_developers"));
            getRequest().setAttribute("top_designers",map.get("top_designers"));
            getRequest().setAttribute("top_conceptors", map.get("top_conceptors"));
            getRequest().setAttribute("top_specificators", map.get("top_specificators"));
            getRequest().setAttribute("top_architects", map.get("top_architects"));
            getRequest().setAttribute("top_assemblers", map.get("top_assemblers"));
            getRequest().setAttribute("top_testers", map.get("top_testers"));

            getRequest().setAttribute("activeContestsSummary", getActiveContests());

/*
            CachedDataAccess surveyDai = new CachedDataAccess(DBMS.OLTP_DATASOURCE_NAME);
            Request surveyRequest = new Request();
            surveyRequest.setContentHandle("recent_srm_survey_question");
            getRequest().setAttribute("recent_srm_survey_question",
                    surveyDai.getData(surveyRequest).get("recent_srm_survey_question"));
*/

/*
            CachedDataAccess tcsDai = new CachedDataAccess(DBMS.TCS_OLTP_DATASOURCE_NAME);
            Request tcsRequest = new Request();
            tcsRequest.setContentHandle("project_totals");
            getRequest().setAttribute("total_component_prices",
                    tcsDai.getData(tcsRequest).get("total_component_prices"));
*/


        } catch (TCWebException e) {
            throw e;
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }

    protected void loadMemberData() throws TCWebException {
        try {
            CachedDataAccess dwDai = new CachedDataAccess(DBMS.DW_DATASOURCE_NAME);
            Request dataRequest = new Request();
            //we'll sacrifice here a little by using the same command as statistics.
            //this gives us WAY more data than we need, but it means that we can
            //use the cache both for the home page and the member profile page
            dataRequest.setContentHandle("member_profile");
            dataRequest.setProperty("cr", String.valueOf(getUser().getId()));
            getRequest().setAttribute("member_info", dwDai.getData(dataRequest).get("Coder_Data"));


            TCCC06ComponentTerms compTerms = new TCCC06ComponentTerms();
            compTerms.setRequest(getRequest());
            compTerms.setResponse(getResponse());
            compTerms.setAuthentication(getAuthentication());

            ViewAlgoRegistration algoTerms = new ViewAlgoRegistration();
            algoTerms.setRequest(getRequest());
            algoTerms.setResponse(getResponse());
            algoTerms.setAuthentication(getAuthentication());

            getRequest().setAttribute("compTerms", compTerms);
            getRequest().setAttribute("algoTerms", algoTerms);

/*
tchs08 is over, don't need to do this anymore
            DataAccess tchs08Dai = new DataAccess(DBMS.OLTP_DATASOURCE_NAME);
            Request tchs08Request = new Request();
            tchs08Request.setProperty("cr", String.valueOf(getUser().getId()));

            tchs08Request.setContentHandle("tchs08_eligibility");
            getRequest().setAttribute("tchs08_info",
                    tchs08Dai.getData(tchs08Request).get("tchs08_eligibility"));
*/

/*            DataAccess tco07Dai = new DataAccess(DBMS.OLTP_DATASOURCE_NAME);
            Request tco07Request = new Request();
            tco07Request.setProperty("cr", String.valueOf(getUser().getId()));

            tco07Request.setContentHandle("tco07_info");
            getRequest().setAttribute("tco07_info",
                    tco07Dai.getData(tco07Request).get("tco07_info"));*/

/*  tco is over, don't need to do this anymore
            DataAccess tco08Dai = new DataAccess(DBMS.OLTP_DATASOURCE_NAME);
            Request tco08Request = new Request();
            tco08Request.setProperty("cr", String.valueOf(getUser().getId()));

            tco08Request.setContentHandle("tco08_info");
            getRequest().setAttribute("tco08_info",
                    tco08Dai.getData(tco08Request).get("tco08_info"));
*/


        } catch (TCWebException e) {
            throw e;
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }


    private Map<String, ActiveContestsSummary> getActiveContests() throws Exception {
        HashMap<String, ActiveContestsSummary> ret = new HashMap<String, ActiveContestsSummary>();
        ret.putAll(getOnlineReviewSummary());
        ret.put(STUDIO, getStudioSummary());
        ret.put(BUGS, getBugRaceSummary());
        ret.put(MM, getMMSummary());
        return ret;
    }

    private ActiveContestsSummary getStudioSummary() throws Exception {
        try {
            ActiveContestsSummary ret = new ActiveContestsSummary();
            CachedDataAccess dai = new CachedDataAccess(MaxAge.QUARTER_HOUR, DBMS.STUDIO_DATASOURCE_NAME);
            Request dataRequest = new Request();
            dataRequest.setContentHandle("active_contests_summary");

            ResultSetContainer rsc = dai.getData(dataRequest).get("active_contests_summary");
            if (!rsc.isEmpty()) {
                ret.setContestCount(rsc.get(0).getIntItem("total_contests"));
                ret.setName("Studio");
                if (rsc.get(0).getItem("total_prizes").getResultData()!=null) {
                    ret.setPrizeTotal(rsc.get(0).getFloatItem("total_prizes"));
                }
            }
            return ret;
        } catch (Exception e) {
            ActiveContestsSummary ret = new ActiveContestsSummary();
            ret.setContestCount(0);
            return ret;
        }
    }

    private Map<String, ActiveContestsSummary> getOnlineReviewSummary() throws Exception {
        HashMap<String, ActiveContestsSummary> ret = new HashMap<String, ActiveContestsSummary>();
        CachedDataAccess dai = new CachedDataAccess(MaxAge.QUARTER_HOUR, DBMS.TCS_OLTP_DATASOURCE_NAME);
        Request dataRequest = new Request();
        dataRequest.setContentHandle("homepage_active_contest_summary");

        Map<String, ResultSetContainer> dataMap = dai.getData(dataRequest);


        ActiveContestsSummary summary;

        ResultSetContainer dr = dataMap.get("dr_active_contests_summary");
        if (!dr.isEmpty()) {
            ResultSetContainer.ResultSetRow row = dr.get(0);
            summary = new ActiveContestsSummary();
            summary.setContestCount(row.getIntItem("total_contests"));
            if (log.isDebugEnabled()) {
                log.debug("dr contests " + summary.getContestCount() + " "+ row.getIntItem("total_contests"));
            }
            summary.setName("Digital Run");
            if (row.getItem("dr_points").getResultData()!=null) {
                summary.setPrizeTotal(row.getFloatItem("dr_points"));
            }
            ret.put(DR, summary);
        }

        //this is a special case because we need to query based on the contest indicator flag because
        //some architecture projects in OR are contests and some are not
        ResultSetContainer arch = dataMap.get("architecture_active_contests_summary");
        if (!arch.isEmpty()) {
            ResultSetContainer.ResultSetRow row = arch.get(0);
            summary = new ActiveContestsSummary();
            summary.setContestCount(row.getIntItem("total_contests"));
            summary.setName(row.getStringItem("category_name"));
            if (row.getItem("total_prizes").getResultData()!=null) {
                summary.setPrizeTotal(row.getFloatItem("total_prizes"));
            }
            ret.put(ARCHITECTURE, summary);
        }

        ResultSetContainer concept = dataMap.get("conceptualization_active_contests_summary");
        if (!concept.isEmpty()) {
            ResultSetContainer.ResultSetRow row = concept.get(0);
            summary = new ActiveContestsSummary();
            summary.setContestCount(row.getIntItem("total_contests"));
            summary.setName(row.getStringItem("category_name"));
            if (row.getItem("total_prizes").getResultData()!=null) {
                summary.setPrizeTotal(row.getFloatItem("total_prizes"));
            }
            ret.put(CONCEPTUALIZATION, summary);
        }

        ResultSetContainer spec = dataMap.get("specification_active_contests_summary");
        if (!spec.isEmpty()) {
            ResultSetContainer.ResultSetRow row = spec.get(0);
            summary = new ActiveContestsSummary();
            summary.setContestCount(row.getIntItem("total_contests"));
            summary.setName(row.getStringItem("category_name"));
            if (row.getItem("total_prizes").getResultData()!=null) {
                summary.setPrizeTotal(row.getFloatItem("total_prizes"));
            }
            ret.put(SPECIFICATION, summary);
        }


        for (ResultSetContainer.ResultSetRow row : dataMap.get("homepage_active_contest_summary")) {
            summary = new ActiveContestsSummary();
            summary.setContestCount(row.getIntItem("total_contests"));
            summary.setName(row.getStringItem("category_name"));
            if (row.getItem("total_prizes").getResultData()!=null) {
                summary.setPrizeTotal(row.getFloatItem("total_prizes"));
            }

            switch (row.getIntItem("project_category_id")) {

                case Constants.DESIGN_PROJECT_TYPE: {
                    ret.put(DESIGN, summary);
                    break;
                }
                case Constants.DEVELOPMENT_PROJECT_TYPE: {
                    ret.put(DEVELOPMENT, summary);
                    break;
                }
                case Constants.ASSEMBLY_PROJECT_TYPE: {
                    ret.put(ASSEMBLY, summary);
                    break;
                }
                case Constants.APPLICATION_TESTING_PROJECT_TYPE: {
                    ret.put(APPLICATION_TESTING, summary);
                    break;
                }
            }

        }

        return ret;
    }

    private ActiveContestsSummary getMMSummary() throws Exception {
        ActiveContestsSummary ret = new ActiveContestsSummary();
        CachedDataAccess dai = new CachedDataAccess(MaxAge.QUARTER_HOUR, DBMS.OLTP_DATASOURCE_NAME);
        Request dataRequest = new Request();
        dataRequest.setContentHandle("long_contest_active_contests");

        ResultSetContainer rsc = dai.getData(dataRequest).get("long_contest_active_contests");
        //we don't store MM prizes in the db, so we can't query them
        ret.setContestCount(rsc.size());
        ret.setName("Marathon Matches");
        return ret;

    }

    private ActiveContestsSummary getBugRaceSummary() throws Exception {
        try {
            ActiveContestsSummary ret = new ActiveContestsSummary();
            CachedDataAccess dai = new CachedDataAccess(MaxAge.QUARTER_HOUR, DBMS.JIRA_DATASOURCE_NAME);
            Request dataRequest = new Request();
            dataRequest.setContentHandle("bug_race_active_contests_summary");

            ResultSetContainer rsc = dai.getData(dataRequest).get("bug_race_active_contests_summary");
            if (!rsc.isEmpty()) {
                ret.setContestCount(rsc.get(0).getIntItem("total_contests"));
                ret.setName("Bug Races");
                if (rsc.get(0).getItem("total_prizes").getResultData()!=null) {
                    ret.setPrizeTotal(rsc.get(0).getFloatItem("total_prizes"));
                }
            }
            return ret;
        } catch (Exception e) {
            ActiveContestsSummary ret = new ActiveContestsSummary();
            ret.setContestCount(0);
            return ret;
        }
    }







    //**********************************************
    //* member stuff
    //**********************************************

/*

                    dataRequest = new Request();
                    dataRequest.setContentHandle("member_profile");
                    dataRequest.setProperty("cr", String.valueOf(nav.getUserId()));
                    resultMap = dai.getData(dataRequest);
                    rsc = (ResultSetContainer) resultMap.get("Coder_Data");
                    homeTag.addTag(rsc.getTag("Coder", "Coder"));

                    dataRequest = new Request();
                    dataRequest.setContentHandle("member_profile");
                    dataRequest.setProperty("cr", "" + nav.getUserId());
                    resultMap = dai.getData(dataRequest);
                    rsc = (ResultSetContainer) resultMap.get("Coder_Data");
                    homeTag.addTag(rsc.getTag("CoderData", "Data"));


                }*/

}
