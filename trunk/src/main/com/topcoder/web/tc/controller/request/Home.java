/*
 * Copyright (C) 2004 - 2010 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.tc.controller.request;

import java.util.Map;

import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.CachedDataAccess;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.cache.MaxAge;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.tc.controller.request.tournament.tccc06.ViewAlgoRegistration;
import com.topcoder.web.tc.controller.request.util.TCCC06ComponentTerms;

/**
 * <p>
 * This class is used to retreive home page information and present it.
 * </p>
 *
 * <p>
 *   Version 1.1 (Testing Competition Split Release Assembly 1.0) Change notes:
 *   <ol>
 *     <li>Updated Application Testing to Test Suites</li>
 *     <li>Added support for new Test Scenarios competitions</li>
 *   </ol>
 * </p>
 *
 * <p>
 *   Version 1.2 (BUGR-2331) Change notes:
 *   <ol>
 *     <li>Moved active contests code to a Helper class to be reused by TC homepage.</li>
 *   </ol>
 * </p>
 * <p>
 *   Version 1.3 (Copilot Selection Contest Online Review and TC Site Integration Assembly 1.0) Change notes:
 *   <ol>
 *     <li>Added support for new Copilot Posting.</li>
 *   </ol>
 * </p>
 * <p>
 *   Version 1.4 (Content Creation Contest Online Review and TC Site Integration Assembly 1.0) Change notes:
 *   <ol>
 *     <li>Added {@link #CONTENT_CREATION} constant.</li>
 *   </ol>
 * </p>
 * @author dok, pulky, Blues, FireIce
 * @version 1.4
 */
public class Home extends Base {
    public static final String DESIGN = "design";
    public static final String ASSEMBLY = "assembly";
    public static final String DEVELOPMENT = "dev";

    /**
     * <p>A <code>String</code> representing test suites key.</p>
     *
     * @since 1.1
     */
    public static final String TEST_SUITES = "testsuites";

    /**
     * <p>A <code>String</code> representing test scenarios key.</p>
     *
     * @since 1.1
     */
    public static final String TEST_SCENARIOS = "testscenarios";

    public static final String ARCHITECTURE= "arch";
    public static final String CONCEPTUALIZATION = "concept";
    public static final String SPECIFICATION = "spec";
    public static final String STUDIO = "studio";
    public static final String UI_PROTOTYPE = "uiprototype";
    public static final String RIA_BUILD = "riabuild";
    public static final String RIA_COMPONENT = "riacomponent";

    /**
     * <p>A <code>String</code> representing copilot posting key.</p>
     *
     * @since 1.3
     */
    public static final String COPILOT_POSTING = "copilotposting";

    /**
     * <p>A <code>String</code> representing content creation key.</p>
     *
     * @since 1.4
     */
    public static final String CONTENT_CREATION = "contentcreation";

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

            getRequest().setAttribute("activeContestsSummary", HomeHelper.getActiveContests());

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
