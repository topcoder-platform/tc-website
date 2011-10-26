/*
 * ViewProfile
 * 
 * Created Aug 8, 2008
 */
package com.topcoder.web.winformula.controller.request;

import java.util.ArrayList;
import java.util.List;

import com.topcoder.server.ejb.TestServices.LongTestResult;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer.ResultSetRow;
import com.topcoder.shared.security.ClassResource;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.CachedDataAccess;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.TCRequest;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.cache.MaxAge;
import com.topcoder.web.winformula.Constants;
import com.topcoder.web.winformula.algorithm.CodingConstants;
import com.topcoder.web.winformula.algorithm.services.WeekInfo;
import com.topcoder.web.winformula.controller.PredictionsHelper;
import com.topcoder.web.winformula.controller.StatsHelper;
import com.topcoder.web.winformula.model.MemberData;
import com.topcoder.web.winformula.model.Prediction;
import com.topcoder.web.winformula.model.StandingsItem;
import com.topcoder.web.winformula.model.WeekStats;

/**
 * @autor Pablo Wolfus (pulky)
 * @version $Id: ViewProfile.java 80243 2011-10-21 09:50:13Z lmmortal $
 */
public class ViewProfile extends StatsBase {
    protected static final Logger log = Logger.getLogger(ViewProfile.class);
    
    private int weekId = -1;

    protected void statsProcessing() throws Exception {
        try {
            TCRequest request = getRequest();
            Boolean myProfile = Boolean.FALSE;

            int coderId = 0;
            String selectedCoder = StringUtils.checkNull(request.getParameter(CodingConstants.CODER_ID));
            try {
                coderId = Integer.parseInt(selectedCoder);
            } catch (Exception e) {
            }

            if (coderId == 0) {
                if (!userLoggedIn()) {
                    throw new PermissionException(getUser(), new ClassResource(this.getClass()));
                }
                myProfile = Boolean.TRUE;
                coderId = (int) getUser().getId();
            } else {
                request.setAttribute(CodingConstants.CODER_ID, coderId);
            }
            
            String selectedWeek = StringUtils.checkNull(request.getParameter("week"));

            try {
                weekId = Integer.parseInt(selectedWeek);
            } catch (Exception e) {
            }

            // get data from DB
            // first the weeks
            setWeeksData(coderId);

            // then member data
            MemberData md = getMemberData(coderId);

            // then the predictions
            ResultSetContainer rsc = PredictionsHelper.getPredictionsData(coderId, weekId);

            // make it a list of beans
            LongTestResult result = PredictionsHelper.processResult(rsc, weekId);

            // sort
            if (result != null) {
                PredictionsHelper.sortResult(request, (Prediction) result.getResultObject());
        
                // crop
//                PredictionsHelper.cropResult(request, (Prediction) result.getResultObject());
            }
            
            WeekStats ws = getWeekStats(coderId, weekId);

            // performance vs community 
            List<StandingsItem> performance = StatsHelper.processResult(getPerformanceData(coderId, weekId));
            request.setAttribute("performance", performance);

            request.setAttribute("week", weekId);
            request.setAttribute("weekStats", ws);
            request.setAttribute("member", md);
            request.setAttribute("result", result);
            request.setAttribute("myProfile", myProfile);

            setNextPage(Constants.PAGE_MY_PROFILE);
            setIsNextPageInContext(true);
        } catch (PermissionException pe) {
            throw pe;
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }

    /**
     * @param selectedWeek
     * @throws Exception
     */
    private void setWeeksData(int coderId) throws Exception {
        ResultSetContainer rscWeeks = getWeeksData(coderId);
        if (rscWeeks.size() > 0) {
            boolean found = false;
            Integer showWeekId = null;
            for (ResultSetRow rsr : rscWeeks) {
                if (rsr.getIntItem("week_id") == weekId) {
                    found = true;
                }
                Integer weekStatusId = rsr.getIntItem("week_status_id"); 
                if (weekStatusId.equals(WeekInfo.WEEK_WITH_FINAL_PREDICTIONS) || 
                        weekStatusId.equals(WeekInfo.WEEK_SCORED_AND_CLOSED)) {
                    showWeekId = rsr.getIntItem("week_id");
                }
            }
            if (!found && rscWeeks.size() > 0) {
                if (showWeekId != null) {
                    weekId = showWeekId;   
                } else {
                    weekId = rscWeeks.get(0).getIntItem("week_id");
                }
                log.debug("using week: " + weekId);
            }
            if (rscWeeks.size() > 0) {
                getRequest().setAttribute("maxWeek", rscWeeks.get(rscWeeks.size()-1).getIntItem("week_id"));
            }
        } else { 
            log.info("weeks is null or empty");
        }
    }
        
    private MemberData getMemberData(int coderId) throws Exception {
        Request r = new Request();
        r.setContentHandle("member_data");
        r.setProperty(Constants.USER_ID, String.valueOf(coderId));

        DataAccessInt dai = new CachedDataAccess(DBMS.WINFORMULA_DATASOURCE_NAME);
        ResultSetContainer rsc = dai.getData(r).get("member_data");
        
        MemberData md = null;
        
        if (rsc.size() > 0) {
            ResultSetRow rsr = rsc.get(0);
            String handle = rsr.getStringItem("handle");
            Integer highestOverallRank = PredictionsHelper.getNullableIntItem(rsr, "highest_overall_rank");
            String highestOverallRankWeek = rsr.getStringItem("highest_overall_rank_week");
            Integer overallPoints = PredictionsHelper.getNullableIntItem(rsr, "overall_points");
            Integer highestWeeklyRank = PredictionsHelper.getNullableIntItem(rsr, "highest_weekly_rank");
            Integer highestWeeklyRankPoints = PredictionsHelper.getNullableIntItem(rsr, "highest_weekly_rank_points");
            String highestWeeklyRankWeek = rsr.getStringItem("highest_weekly_rank_week");
            Integer overallRank = PredictionsHelper.getNullableIntItem(rsr, "overall_rank");
            Integer totalRankedMembers = PredictionsHelper.getNullableIntItem(rsr, "total_ranked_members");
            Integer userId = PredictionsHelper.getNullableIntItem(rsr, "user_id");
            Double winPercent = PredictionsHelper.getNullableDoubleItem(rsr, "win_percent");
            Double totalPrizes = PredictionsHelper.getNullableDoubleItem(rsr, "total_prizes");

            md = new MemberData(handle, highestOverallRank, highestOverallRankWeek, overallPoints,
                    highestWeeklyRank, highestWeeklyRankPoints, highestWeeklyRankWeek,
                    overallRank, totalRankedMembers, userId, winPercent, totalPrizes, null);
        }

        if (md == null) {
            return null;
        } else {
            // get achievements
            rsc = dai.getData(r).get("member_achievements");
            if (rsc.size() > 0) {
                List<String> achievements = new ArrayList<String>(rsc.size());
                for (ResultSetRow rsr : rsc) {
                    achievements.add(rsr.getStringItem("achievement_desc"));
                }
                md.setAchievements(achievements);
            }
            return md;
        }        
    }

    private WeekStats getWeekStats(int coderId, int weekId) throws Exception {
        Request r = new Request();
        r.setContentHandle("user_week_stats");
        r.setProperty(Constants.USER_ID, String.valueOf(coderId));
        r.setProperty(Constants.WEEK_ID, String.valueOf(weekId));

        DataAccessInt dai = new CachedDataAccess(DBMS.WINFORMULA_DATASOURCE_NAME);
        ResultSetContainer rsc = dai.getData(r).get("user_week_stats");
        
        if (rsc.size() > 0) {
            ResultSetRow rsr = rsc.get(0);
            String weekName = rsr.getStringItem("week_desc");
            Integer rank = PredictionsHelper.getNullableIntItem(rsr, "rank");
            Integer maxRank = PredictionsHelper.getNullableIntItem(rsr, "max_rank");
            Double winPercent = PredictionsHelper.getNullableDoubleItem(rsr, "avg_picked_winner");
            Integer points = PredictionsHelper.getNullableIntItem(rsr, "points");

            return new WeekStats(weekName, rank, maxRank, winPercent, points);
        } else {
            return null;
        }
    }

    private ResultSetContainer getWeeksData(int coderId) throws Exception {
        Request r = new Request();
        r.setContentHandle("user_prediction_weeks");
        r.setProperty(Constants.USER_ID, String.valueOf(coderId));

        DataAccessInt dai = new CachedDataAccess(MaxAge.QUARTER_HOUR, DBMS.WINFORMULA_DATASOURCE_NAME);
        return dai.getData(r).get("user_prediction_weeks");
    }
    
    private ResultSetContainer getPerformanceData(int coderId, int weekId) throws Exception {
        Request r = new Request();
        r.setContentHandle("performance_vs_community");
        r.setProperty(Constants.USER_ID, String.valueOf(coderId));
        r.setProperty(Constants.WEEK_ID, String.valueOf(weekId));

        DataAccessInt dai = new CachedDataAccess(DBMS.WINFORMULA_DATASOURCE_NAME);
        return dai.getData(r).get("performance_vs_community");
    }
}
