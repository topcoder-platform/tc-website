package com.topcoder.web.servlet;

import com.topcoder.common.web.constant.TCServlet;
import com.topcoder.common.web.data.Navigation;
import com.topcoder.common.web.error.NavigationException;
import com.topcoder.common.web.util.Cache;
import com.topcoder.common.web.util.Conversion;
import com.topcoder.common.web.xml.HTMLRenderer;
import com.topcoder.ejb.AuthenticationServices.User;
import com.topcoder.ejb.CoderStatistics.CoderStatistics;
import com.topcoder.ejb.CoderStatistics.CoderStatisticsHome;
import com.topcoder.ejb.DataCache.DataCache;
import com.topcoder.shared.dataAccess.*;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.docGen.xml.*;
import com.topcoder.shared.util.ApplicationServer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.TCContext;
import com.topcoder.shared.util.logging.Logger;

import javax.naming.Context;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.*;

public final class TaskHome {

    private static final String XSL_DIR = "home/";
    private static final String XSL_DIR_SEARCH = "coder_list/";
    private static Logger log = Logger.getLogger(TaskHome.class);

    static String process(HttpServletRequest request, HttpServletResponse response,
                          HTMLRenderer HTMLmaker, Navigation nav, XMLDocument document)
            throws NavigationException {

        String result = null;
        User user = null;
        String rtUser = "";
        String rtPassword = "";
        Context ctx = null;
        DataAccessInt dai = null;
        DataAccessInt transDai = null;
        Request dataRequest = null;
        ResultSetContainer rsc = null;
        Map resultMap = null;

        try {
            RecordTag homeTag = new RecordTag("HOME");
            ArrayList contests = null;
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
            String cacheKey = null;
            document.addTag(homeTag);
            try {
                ctx = TCContext.getInitial();
                dai = new CachedDataAccess((javax.sql.DataSource)ctx.lookup(DBMS.DW_DATASOURCE_NAME));
                CoderStatisticsHome home = (CoderStatisticsHome) ctx.lookup(ApplicationServer.CODER_STATISTICS);
                CoderStatistics temp = home.create();
                if (nav.getLoggedIn()) {
                    com.topcoder.common.web.data.stat.coder.Coder c = temp.getCoderEarnings(nav.getUser().getUserId());
                    if (c != null)
                        homeTag.addTag(c.getXML());
                    else
                        homeTag.addTag(new com.topcoder.common.web.data.stat.coder.Coder().getXML());

                    ArrayList a = temp.getLastCoderComps(nav.getUser().getUserId(), 3);
                    RecordTag rt = new RecordTag("Last3Comps");
                    for (int i = 0; i < a.size(); i++) {
                        rt.addTag(((com.topcoder.common.web.data.stat.contest.RoomResult) a.get(i)).getXML());
                    }
                    homeTag.addTag(rt);

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

                    dataRequest = new Request();
                    dataRequest.setContentHandle("invitational_info");
                    dataRequest.setProperty("cr", ""+nav.getUserId());
                    dataRequest.setProperty("rd", "4320");
                    dataRequest.setProperty("cd", "4320");
                    transDai = new DataAccess((javax.sql.DataSource)ctx.lookup(DBMS.OLTP_DATASOURCE_NAME));
                    resultMap = transDai.getData(dataRequest);
                    RecordTag invitationalInfo = new RecordTag("InvitationalInfo");
                    rsc = (ResultSetContainer) resultMap.get("Invitational_Eligibility");
                    invitationalInfo.addTag(rsc.getTag("Invitational_Eligibility", "Info"));
                    rsc = (ResultSetContainer) resultMap.get("Is_Registered");
                    invitationalInfo.addTag(new ValueTag("IsRegistered", rsc.getItem(0, "is_registered").toString()));
                    homeTag.addTag(invitationalInfo);

/*
                    dataRequest = new Request();
                    dataRequest.setContentHandle("top_room_winners");
                    dataRequest.setProperty("dn", "1");
                    resultMap = dai.getData(dataRequest);
                    rsc = (ResultSetContainer) resultMap.get("Top_Room_Winners");
                    homeTag.addTag(rsc.getTag("Div1RoomWinners", "RoomWinner"));

                    dataRequest = new Request();
                    dataRequest.setContentHandle("top_room_winners");
                    dataRequest.setProperty("dn", "2");
                    resultMap = dai.getData(dataRequest);
                    rsc = (ResultSetContainer) resultMap.get("Top_Room_Winners");
                    homeTag.addTag(rsc.getTag("Div2RoomWinners", "RoomWinner"));
*/

                }

                dataRequest = new Request();
                dataRequest.setContentHandle("top_ranked_div_1");
                dataRequest.setProperty("sr", "1");
                dataRequest.setProperty("er", "10");   // just get the top 10
                resultMap = dai.getData(dataRequest);
                rsc = (ResultSetContainer) resultMap.get("Top_Ranked_Div_1");
                homeTag.addTag(rsc.getTag("TopDiv1RankedCoders", "Coder"));

                dataRequest = new Request();
                dataRequest.setContentHandle("top_ranked_div_2");
                dataRequest.setProperty("sr", "1");
                dataRequest.setProperty("er", "10");   // just get the top 10
                resultMap = dai.getData(dataRequest);
                rsc = (ResultSetContainer) resultMap.get("Top_Ranked_Div_2");
                homeTag.addTag(rsc.getTag("TopDiv2RankedCoders", "Coder"));

                dataRequest = new Request();
                dataRequest.setContentHandle("school_avg_rating");
                dataRequest.setProperty("sr", "1");
                dataRequest.setProperty("er", "10");   // just get the top 10
                resultMap = dai.getData(dataRequest);
                rsc = (ResultSetContainer) resultMap.get("School_Avg_Rating");
                homeTag.addTag(rsc.getTag("TopRankedSchools", "School"));

                dataRequest = new Request();
                dataRequest.setContentHandle("top_rating_gainer_loser");
                resultMap = dai.getData(dataRequest);
                rsc = (ResultSetContainer) resultMap.get("Top_Rating_Gainers_And_Losers");
                homeTag.addTag(rsc.getTag("GainersAndLosers", "Coder"));

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
            if (!nav.getLoggedIn()) {
                cacheKey = request.getServerName() + TCServlet.LOGGED_OUT_KEY;
            }
//            log.debug(document.getXML(2));
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


    static void getContestDates(RecordTag tag) {
        try {
            DataCache dcHome = Cache.get();
            tag.addTag(RecordTag.getListXML("Rounds", dcHome.getRounds()));
        } catch (Exception e) {
            e.printStackTrace();
        }
    }


}
