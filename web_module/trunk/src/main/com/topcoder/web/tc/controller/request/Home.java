package com.topcoder.web.tc.controller.request;

import com.topcoder.web.common.TCWebException;
import com.topcoder.web.tc.Constants;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.dataAccess.DataAccessInt;
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
            CachedDataAccess countDai = new CachedDataAccess(DBMS.OLTP_DATASOURCE_NAME);
            countDai.setExpireTime(15*60*1000);
            Request countReq = new Request();
            countReq.setContentHandle("member_count");
            getRequest().setAttribute("member_count", countDai.getData(countReq).get("member_count"));

            CachedDataAccess nextRoundDai = new CachedDataAccess(DBMS.OLTP_DATASOURCE_NAME);
            nextRoundDai.setExpireTime(30*60*1000);
            Request nextRoundReq = new Request();
            nextRoundReq.setContentHandle("next_round");
            getRequest().setAttribute("next_round", nextRoundDai.getData(countReq).get("next_round"));

            CachedDataAccess dwDai = new CachedDataAccess(DBMS.DW_DATASOURCE_NAME);
            Request dataRequest = new Request();
            dataRequest.setContentHandle("public_home_data");
            dataRequest.setProperty("sr", "1");
            dataRequest.setProperty("er", "10");   // just get the top 10
//            getRequest().setAttribute("Top_Ranked_Div_1",
//                    dwDai.getData(dataRequest).get("Top_Ranked_Div_1"));
            getRequest().setAttribute("School_Avg_Rating",
                    dwDai.getData(dataRequest).get("School_Avg_Rating"));
            getRequest().setAttribute("Country_Avg_Rating",
                    dwDai.getData(dataRequest).get("Country_Avg_Rating"));
            getRequest().setAttribute("recent_srm_survey_question",
                    dwDai.getData(dataRequest).get("recent_srm_survey_question"));



/*
    dataRequest = new Request();
    dataRequest.setContentHandle("school_avg_rating");
    dataRequest.setProperty("sr", "1");
    dataRequest.setProperty("er", "10");   // just get the top 10
    resultMap = dai.getData(dataRequest);
    rsc = (ResultSetContainer) resultMap.get("School_Avg_Rating");
    homeTag.addTag(rsc.getTag("TopRankedSchools", "School"));

    dataRequest = new Request();
    dataRequest.setContentHandle("project_totals");
    resultMap = tcsDai.getData(dataRequest);
    rsc = (ResultSetContainer) resultMap.get("total_component_prices");
    homeTag.addTag(rsc.getTag("Project", "Total"));

    dataRequest = new Request();
    dataRequest.setContentHandle("country_avg_rating");
    dataRequest.setProperty("sr", "1");
    dataRequest.setProperty("er", "10");   // just get the top 10
    resultMap = dai.getData(dataRequest);
    rsc = (ResultSetContainer) resultMap.get("Country_Avg_Rating");
    homeTag.addTag(rsc.getTag("TopRankedCountries", "Country"));

    dataRequest = new Request();
    dataRequest.setContentHandle("top_rating_gainer_loser");
    resultMap = dai.getData(dataRequest);
    rsc = (ResultSetContainer) resultMap.get("Top_Rating_Gainers_And_Losers");
    homeTag.addTag(rsc.getTag("GainersAndLosers", "Coder"));

    dataRequest = new Request();
    dataRequest.setContentHandle("recent_srm_survey_question");
    resultMap = cTransDai.getData(dataRequest);
    rsc = (ResultSetContainer) resultMap.get("recent_srm_survey_question");
    homeTag.addTag(rsc.getTag("SurveyInfo", "QuestionInfo"));

*/




        } catch (TCWebException e) {
            throw e;
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }

    protected void loadMemberData() {

    }


    //**********************************************
    //* member stuff
    //**********************************************

/*
                    ctx = TCContext.getInitial();
                dai = new CachedDataAccess((javax.sql.DataSource) ctx.lookup(DBMS.DW_DATASOURCE_NAME));
//                transDai = new DataAccess((javax.sql.DataSource) ctx.lookup(DBMS.OLTP_DATASOURCE_NAME));
                cTransDai = new CachedDataAccess((javax.sql.DataSource) ctx.lookup(DBMS.OLTP_DATASOURCE_NAME));
                tcsDai = new CachedDataAccess((javax.sql.DataSource) ctx.lookup(Query.TCS_CATALOG));
                if (nav.isIdentified()) {

                    dataRequest = new Request();
                    dataRequest.setContentHandle("member_profile");
                    dataRequest.setProperty("cr", String.valueOf(nav.getUserId()));
                    resultMap = dai.getData(dataRequest);
                    rsc = (ResultSetContainer) resultMap.get("Coder_Data");
                    homeTag.addTag(rsc.getTag("Coder", "Coder"));


                    dataRequest = new Request();
                    dataRequest.setContentHandle("most_recent_coder_comps");
                    dataRequest.setProperty("cr", String.valueOf(nav.getUserId()));
                    resultMap = dai.getData(dataRequest);
                    rsc = (ResultSetContainer) resultMap.get("Most_Recent_Coder_Comps");
                    homeTag.addTag(rsc.getTag("Last3Comps", "RoomResult"));

                    dataRequest = new Request();
                    dataRequest.setContentHandle("member_profile");
                    dataRequest.setProperty("cr", "" + nav.getUserId());
                    resultMap = dai.getData(dataRequest);
                    rsc = (ResultSetContainer) resultMap.get("Coder_Data");
                    homeTag.addTag(rsc.getTag("CoderData", "Data"));

                    dataRequest = new Request();
                    dataRequest.setContentHandle("top_scorers");
                    dataRequest.setProperty("dn", "1");
                    resultMap = dai.getData(dataRequest);
                    rsc = (ResultSetContainer) resultMap.get("Top_Scorers");
                    homeTag.addTag(rsc.getTag("Div1TopScorers", "Coder"));

                    dataRequest = new Request();
                    dataRequest.setContentHandle("top_scorers");
                    dataRequest.setProperty("dn", "2");
                    resultMap = dai.getData(dataRequest);
                    rsc = (ResultSetContainer) resultMap.get("Top_Scorers");
                    homeTag.addTag(rsc.getTag("Div2TopScorers", "Coder"));

//                    homeTag.addTag(getTourneyInfo(transDai, nav.getUserId()));

                }*/

}
