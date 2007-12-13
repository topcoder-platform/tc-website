package com.topcoder.web.tc.controller.request;

import com.topcoder.shared.dataAccess.DataAccess;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.CachedDataAccess;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.tc.controller.request.tournament.tccc06.ViewAlgoRegistration;
import com.topcoder.web.tc.controller.request.util.TCCC06ComponentTerms;

import java.util.Map;

public class Home extends Base {

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
/*
            CachedDataAccess nextRoundDai = new CachedDataAccess(DBMS.OLTP_DATASOURCE_NAME);
            nextRoundDai.setExpireTime(30 * 60 * 1000);
            Request nextRoundReq = new Request();
            nextRoundReq.setContentHandle("next_srm");
            getRequest().setAttribute("Next_SRM", nextRoundDai.getData(nextRoundReq).get("Next_SRM"));
*/

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

            DataAccess tchs08Dai = new DataAccess(DBMS.OLTP_DATASOURCE_NAME);
            Request tchs08Request = new Request();
            tchs08Request.setProperty("cr", String.valueOf(getUser().getId()));
            
            tchs08Request.setContentHandle("tchs08_eligibility");
            getRequest().setAttribute("tchs08_info",
                    tchs08Dai.getData(tchs08Request).get("tchs08_eligibility"));
            
/*            DataAccess tco07Dai = new DataAccess(DBMS.OLTP_DATASOURCE_NAME);
            Request tco07Request = new Request();
            tco07Request.setProperty("cr", String.valueOf(getUser().getId()));
            
            tco07Request.setContentHandle("tco07_info");
            getRequest().setAttribute("tco07_info",
                    tco07Dai.getData(tco07Request).get("tco07_info"));*/

/*
            DataAccess tccc07Dai = new DataAccess(DBMS.OLTP_DATASOURCE_NAME);
            Request tccc07Request = new Request();
            tccc07Request.setProperty("cr", String.valueOf(getUser().getId()));
            
            tccc07Request.setContentHandle("tccc07_info");
            getRequest().setAttribute("tccc07_info",
                    tccc07Dai.getData(tccc07Request).get("tccc07_info"));
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
