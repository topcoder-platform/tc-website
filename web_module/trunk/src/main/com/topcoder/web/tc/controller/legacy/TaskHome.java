package com.topcoder.web.tc.controller.legacy;

import com.topcoder.common.web.util.Cache;
import com.topcoder.ejb.DataCache.DataCache;
import com.topcoder.shared.docGen.xml.RecordTag;
import com.topcoder.shared.util.logging.Logger;

public final class TaskHome {

//    private static final String XSL_DIR = "home/";
    private static Logger log = Logger.getLogger(TaskHome.class);

/*
    static String process(HttpServletRequest request, HttpServletResponse response,
                          HTMLRenderer HTMLmaker, Navigation nav, XMLDocument document)
            throws NavigationException {

        String result = null;
        Context ctx = null;
        DataAccessInt dai = null;
//        DataAccessInt transDai = null;
        DataAccessInt cTransDai = null;
        DataAccessInt tcsDai = null;
        Request dataRequest = null;
        ResultSetContainer rsc = null;
        Map resultMap = null;

        try {
            RecordTag homeTag = new RecordTag("HOME");
            Calendar cal = Calendar.getInstance();
            String day = "sun";

            switch (cal.get(Calendar.DAY_OF_WEEK)) {
                case Calendar.MONDAY:
                    day = "mon";
                    break;
                case Calendar.TUESDAY:
                    day = "tue";
                    break;
                case Calendar.WEDNESDAY:
                    day = "wed";
                    break;
                case Calendar.THURSDAY:
                    day = "thu";
                    break;
                case Calendar.FRIDAY:
                    day = "fri";
                    break;
                case Calendar.SATURDAY:
                    day = "sat";
                    break;
            }
            homeTag.addTag(new ValueTag("Day", day));
            getContestDates(homeTag);
            String xsldocURLString = null;
            document.addTag(homeTag);
            try {
                ctx = TCContext.getInitial();
                dai = new CachedDataAccess(DBMS.DW_DATASOURCE_NAME);
//                transDai = new DataAccess((javax.sql.DataSource) ctx.lookup(DBMS.OLTP_DATASOURCE_NAME));
                cTransDai = new CachedDataAccess(DBMS.OLTP_DATASOURCE_NAME);
                tcsDai = new CachedDataAccess(Query.TCS_CATALOG);
                if (nav.isIdentified()) {

                    dataRequest = new Request();
                    dataRequest.setContentHandle("member_profile");
                    dataRequest.setProperty("cr", String.valueOf(nav.getUserId()));
                    resultMap = dai.getData(dataRequest);
                    rsc = (ResultSetContainer) resultMap.get("Coder_Data");
                    homeTag.addTag(rsc.getTag("Coder", "Coder"));


//                    com.topcoder.common.web.data.stat.coder.Coder c = temp.getCoderEarnings(nav.getUser().getUserId());
//                    if (c != null)
//                        homeTag.addTag(c.getXML());
//                    else
//                        homeTag.addTag(new com.topcoder.common.web.data.stat.coder.Coder().getXML());
//
//                    ArrayList a = temp.getLastCoderComps(nav.getUser().getUserId(), 3);
//                    RecordTag rt = new RecordTag("Last3Comps");
//                    for (int i = 0; i < a.size(); i++) {
//                        rt.addTag(((com.topcoder.common.web.data.stat.contest.RoomResult) a.get(i)).getXML());
//                    }


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

                }

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


//                dataRequest = new Request();
//                dataRequest.setContentHandle("state_avg_rating");
//                dataRequest.setProperty("sr", "1");
//                dataRequest.setProperty("er", "5");   // just get the top 10
//                resultMap = dai.getData(dataRequest);
//                rsc = (ResultSetContainer) resultMap.get("State_Avg_Rating");
//                homeTag.addTag(rsc.getTag("TopRankedStates", "State"));


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

                DataCache dcHome = Cache.get();
                homeTag.addTag(new ValueTag("MemberCount", dcHome.getMemberCount()));
            } catch (Exception e) {
                e.printStackTrace();
                throw new Exception("TaskHome:process:ERROR:getting top 10 list:\n" + e);
            }

            String command = Conversion.checkNull(request.getParameter("c"));
            if (command.equals("public_home")) {
                xsldocURLString = TCServlet.XSL_ROOT + "home/public_home.xsl";
            } else {
                xsldocURLString = TCServlet.XSL_ROOT + XSL_DIR + "home.xsl";
            }
            //log.debug(document.getXML(2));
            result = HTMLmaker.render(document, xsldocURLString);
        } catch (NavigationException ne) {
            log.error("TaskHome:ERROR:\n" + ne);
            throw ne;
        } catch (Exception e) {
            e.printStackTrace();
            StringBuffer msg = new StringBuffer(150);
            msg.append("TaskHome:process:");
            msg.append(":ERROR:\n");
            msg.append(e.getMessage());
            throw new NavigationException(msg.toString(), TCServlet.INTERNAL_ERROR_PAGE);
        }
        return result;
    }
*/

/*
    private static RecordTag getTourneyInfo(DataAccessInt dai, long userId) throws Exception {
        Request dataRequest = null;
        Map resultMap = null;

        dataRequest = new Request();

        dataRequest.setContentHandle("collegiate_info");
        dataRequest.setProperty("cr", "" + userId);
//        dataRequest.setProperty("rd", "4462");
        dataRequest.setProperty("cd", "4462");
        resultMap = dai.getData(dataRequest);

        RecordTag collegiateInfo = new RecordTag("CollegiateInfo");
        ResultSetContainer eRsc = (ResultSetContainer) resultMap.get("Collegiate_Eligibility");
//        collegiateInfo.addTag(eRsc.getTag("Collegiate_Eligibility", "Info"));
        ResultSetContainer rRsc = (ResultSetContainer) resultMap.get("Is_Registered");
//        collegiateInfo.addTag(new ValueTag("IsRegistered", rsc.getItem(0, "is_registered").toString()));

        boolean isRegistered = false;
        boolean isEligible = false;
        boolean hasEnoughRatings = false;
        boolean competedRecently = false;
        boolean isStudent = false;

        if (!eRsc.isEmpty()) {
            isEligible = eRsc.getItem(0, "is_eligible").getResultData().equals("T");
            hasEnoughRatings = eRsc.getItem(0, "has_enough_ratings").getResultData().equals("T");
            competedRecently = eRsc.getItem(0, "has_recent_competition").getResultData().equals("T");
            isStudent = eRsc.getItem(0, "is_student").getResultData().equals("T") &&
                        eRsc.getItem(0, "in_school").getResultData().equals("T");
        }

        if (!rRsc.isEmpty()) {
            isRegistered = rRsc.getItem(0, "is_registered").getResultData().equals(new Long(1));
        }

        RecordTag reasons = new RecordTag("reasons");
        RecordTag reason = null;
        if (isEligible) {
            if (isRegistered) {
                reason = new RecordTag("reason");
                reason.addTag(new ValueTag("reason_text", "You are currently signed up for the 2003 " +
                        "TopCoder Collegiate Challenge"));
                reasons.addTag(reason);
            } else {
                reason = new RecordTag("reason");
                reason.addTag(new ValueTag("reason_text", "Based on your profile information, you are eligible for the 2003 TopCoder " +
                    "Collegiate Challenge, but you have not yet signed up."));
                reasons.addTag(reason);
                collegiateInfo.addTag(new ValueTag("showLink", "true"));
            }
        } else {
            if (!hasEnoughRatings) {
                reason = new RecordTag("reason");
                reason.addTag(new ValueTag("reason_text", "You have not yet participated in at least two (2) rated events."));
                reasons.addTag(reason);
            }
            if (!competedRecently) {
                reason = new RecordTag("reason");
                reason.addTag(new ValueTag("reason_text", "You have not participated in a rated event in the last six (6) months."));
                reasons.addTag(reason);
            }
            if (!isStudent) {
                reason = new RecordTag("reason");
                reason.addTag(new ValueTag("reason_text", "Based on your profile information, you are not currently a student."));
                reasons.addTag(reason);
            }
        }
        collegiateInfo.addTag(reasons);

        return collegiateInfo;

//        dataRequest.setContentHandle("invitational_info");
//        RecordTag invitationalInfo = new RecordTag("CollegiateInfo");
//        RecordTag invitationalInfo = new RecordTag("InvitationalInfo");
//        rsc = (ResultSetContainer) resultMap.get("Invitational_Eligibility");
//        invitationalInfo.addTag(rsc.getTag("Invitational_Eligibility", "Info"));
    }
*/

    static void getContestDates(RecordTag tag) {
        try {
            DataCache dcHome = Cache.get();
            tag.addTag(RecordTag.getListXML("Rounds", dcHome.getRounds()));
        } catch (Exception e) {
            e.printStackTrace();
        }
    }


}
