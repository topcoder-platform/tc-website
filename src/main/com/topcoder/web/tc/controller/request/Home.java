package com.topcoder.web.tc.controller.request;

import com.topcoder.web.common.TCWebException;
import com.topcoder.web.tc.Constants;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;

public class Home extends Base {

    protected void businessProcessing() throws TCWebException {
        if (getUser().isAnonymous()) {
            setNextPage(Constants.PUBLIC_HOME_PAGE);
        } else {
            setNextPage(Constants.MEMBER_HOME_PAGE);
        }
        setIsNextPageInContext(true);
    }


    // member count for both, cached for 15 minutes ( 15*60*1000 )
    //  SELECT COUNT(*)
    //  FROM coder c, rating cr
    //  WHERE c.status = 'A'
    //  AND c.coder_id = cr.coder_id


    // round info cached for 30 minutes
    // just get next round
    // SELECT r.round_id
    // ,r.contest_id
    // ,r.name
    // ,r.status
    // ,r.ran_ratings
    // ,r.paid_money
    // ,r.registration_limit
    // ,r.notes
    // ,r.link
    // FROM round r
    // WHERE r.status IN ('A','F')
    // AND r.round_type_id = 1
    // ORDER BY r.round_id


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

    //**********************************************
    //* public stuff
    //**********************************************
/*

    dataRequest = new Request();
    dataRequest.setContentHandle("top_ranked_div_1");
    dataRequest.setProperty("sr", "1");
    dataRequest.setProperty("er", "10");   // just get the top 10
    resultMap = dai.getData(dataRequest);
    rsc = (ResultSetContainer) resultMap.get("Top_Ranked_Div_1");
    homeTag.addTag(rsc.getTag("TopDiv1RankedCoders", "Coder"));

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


}
