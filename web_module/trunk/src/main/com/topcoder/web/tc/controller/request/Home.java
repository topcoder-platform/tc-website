package com.topcoder.web.tc.controller.request;

import com.topcoder.web.common.TCWebException;
import com.topcoder.web.tc.Constants;
import com.topcoder.shared.dataAccess.CachedDataAccess;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.util.DBMS;

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
            CachedDataAccess nextRoundDai = new CachedDataAccess(DBMS.OLTP_DATASOURCE_NAME);
            nextRoundDai.setExpireTime(30*60*1000);
            Request nextRoundReq = new Request();
            nextRoundReq.setContentHandle("next_srm");
            getRequest().setAttribute("Next_SRM", nextRoundDai.getData(nextRoundReq).get("Next_SRM"));

            CachedDataAccess dwDai = new CachedDataAccess(DBMS.DW_DATASOURCE_NAME);
            Request dataRequest = new Request();
            dataRequest.setContentHandle("public_home_data");
            dataRequest.setProperty("sr", "1");
            dataRequest.setProperty("er", "10");   // just get the top 10
            getRequest().setAttribute("top_coders",
                    dwDai.getData(dataRequest).get("Coder_Ratings"));
            getRequest().setAttribute("School_Avg_Rating",
                    dwDai.getData(dataRequest).get("School_Avg_Rating"));
            getRequest().setAttribute("Country_Avg_Rating",
                    dwDai.getData(dataRequest).get("Country_Avg_Rating"));
            getRequest().setAttribute("top_developers",
                    dwDai.getData(dataRequest).get("top_developers"));
            getRequest().setAttribute("top_designers",
                    dwDai.getData(dataRequest).get("top_designers"));

            CachedDataAccess surveyDai = new CachedDataAccess(DBMS.OLTP_DATASOURCE_NAME);
            Request surveyRequest = new Request();
            surveyRequest.setContentHandle("recent_srm_survey_question");
            getRequest().setAttribute("recent_srm_survey_question",
                    surveyDai.getData(surveyRequest).get("recent_srm_survey_question"));

            CachedDataAccess tcsDai = new CachedDataAccess(DBMS.TCS_OLTP_DATASOURCE_NAME);
            Request tcsRequest = new Request();
            tcsRequest.setContentHandle("project_totals");
            getRequest().setAttribute("total_component_prices",
                    tcsDai.getData(tcsRequest).get("total_component_prices"));


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
            getRequest().setAttribute("member_info",
                    dwDai.getData(dataRequest).get("Coder_Data"));


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
