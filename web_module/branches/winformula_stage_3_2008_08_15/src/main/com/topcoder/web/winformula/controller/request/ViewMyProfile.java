/*
 * ViewMyProfile
 * 
 * Created Aug 8, 2008
 */
package com.topcoder.web.winformula.controller.request;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import com.topcoder.server.ejb.TestServices.LongTestResult;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer.ResultSetRow;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.CachedDataAccess;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.TCRequest;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.tag.ListSelectTag;
import com.topcoder.web.winformula.Constants;
import com.topcoder.web.winformula.controller.PredictionsHelper;
import com.topcoder.web.winformula.model.GameResult;
import com.topcoder.web.winformula.model.MemberData;
import com.topcoder.web.winformula.model.Prediction;
import com.topcoder.web.winformula.model.PredictionItem;
import com.topcoder.web.winformula.model.PredictionStat;

/**
 * @autor Pablo Wolfus (pulky)
 * @version $Id$
 */
public class ViewMyProfile extends StatsBase {
    protected static final Logger log = Logger.getLogger(ViewMyProfile.class);
    
    private int weekId = -1;

    protected void statsProcessing() throws Exception {
        try {
            TCRequest request = getRequest();

            String selectedWeek = StringUtils.checkNull(request.getParameter("week"));

            try {
                weekId = Integer.parseInt(selectedWeek);
            } catch (Exception e) {
            }

            // get data from DB
            // first the weeks
            request.setAttribute("weeks", getWeeks());

            // then the predictions
            MemberData md = getMemberData();

            // then the predictions
            ResultSetContainer rsc = getData();

            // make it a list of beans
            LongTestResult result = processResult(rsc, weekId);

            // sort
            if (result != null) {
                PredictionsHelper.sortResult(request, (Prediction) result.getResultObject());
        
                // crop
                PredictionsHelper.cropResult(request, (Prediction) result.getResultObject());
            }
            
            request.setAttribute("member", md);
            request.setAttribute("result", result);

            setNextPage(Constants.PAGE_MY_PROFILE);
            setIsNextPageInContext(true);
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }

    /**
     * @param selectedWeek
     * @throws Exception
     */
    private List<ListSelectTag.Option> getWeeks() throws Exception {
        ResultSetContainer rscWeeks = getWeeksData();
        List<ListSelectTag.Option> weeks;
        if (rscWeeks.size() > 0) {
            weeks = new ArrayList<ListSelectTag.Option>(rscWeeks.size());
            boolean found = false;
            for (ResultSetRow rsr : rscWeeks) {
                weeks.add(new ListSelectTag.Option(String.valueOf(rsr.getIntItem("week_id")), rsr.getStringItem("week_desc"), String.valueOf(rsr.getIntItem("week_id")).equals(weekId)));
                if (String.valueOf(rsr.getIntItem("week_id")).equals(weekId)) {
                    found = true;
                }
            }
            if (!found && rscWeeks.size() > 0) {
                weekId = rscWeeks.get(rscWeeks.size() - 1).getIntItem("week_id");
                log.debug("using week: " + weekId);
            }
        } else { 
            log.info("weeks is null or empty");
            weeks = Collections.emptyList();
        }
        return weeks;
    }
    
    Integer getNullableItem(ResultSetRow rsr, String columnName) {
        if (rsr.getItem(columnName).getResultData() == null) {
            return null;
        } else {
            return rsr.getIntItem(columnName);
        }
    }
    
    private LongTestResult processResult(ResultSetContainer rsc, int week) {
        if (rsc.size() > 0) {
            int total = 0;
            int correct = 0;
            int score = 0;
            List<PredictionItem> lpi = new ArrayList<PredictionItem>(rsc.size()); 
            for (ResultSetRow rsr : rsc) {
                String home = rsr.getStringItem("home");
                String visitor = rsr.getStringItem("visitor");
                Integer homePred = getNullableItem(rsr, "home_pred");
                Integer visitorPred = getNullableItem(rsr, "visitor_pred");
                Integer homeScore = getNullableItem(rsr, "home_score");
                Integer visitorScore = getNullableItem(rsr, "visitor_score");
                Integer predictionPoints = getNullableItem(rsr, "prediction_points");
                
                PredictionItem pi = new PredictionItem(home, visitor, 
                        (homePred == null || visitorPred == null) ? null : new GameResult(homePred, visitorPred),
                        (homeScore == null || visitorScore == null) ? null : new GameResult(homeScore, visitorScore),
                        predictionPoints);

                lpi.add(pi);
                
                total++;
                correct += pi.getPickedWinner() ? 1 : 0;
                score += pi.getScore() == null ? 0 : pi.getScore();
            }
            
            Prediction p = new Prediction(week, lpi, score, new PredictionStat(total, correct));
    
            LongTestResult ltr = new LongTestResult(); 
            ltr.setResultObject(p);
            return ltr;
        } else {
            return null;
        }
    }

    private ResultSetContainer getData() throws Exception {
        Request r = new Request();
        r.setContentHandle("user_predictions");
        r.setProperty(Constants.USER_ID, String.valueOf(getUser().getId()));
        r.setProperty(Constants.WEEK_ID, String.valueOf(weekId));

        DataAccessInt dai = new CachedDataAccess(DBMS.WINFORMULA_DATASOURCE_NAME);
        return dai.getData(r).get("user_predictions");
    }

    private MemberData getMemberData() throws Exception {
        Request r = new Request();
        r.setContentHandle("member_data");
        r.setProperty(Constants.USER_ID, String.valueOf(getUser().getId()));

        DataAccessInt dai = new CachedDataAccess(DBMS.WINFORMULA_DATASOURCE_NAME);
        ResultSetContainer rsc = dai.getData(r).get("member_data");
        
        if (rsc.size() > 0) {
            ResultSetRow rsr = rsc.get(0);
            String handle = rsr.getStringItem("handle");
            Integer highestOverallRank = getNullableItem(rsr, "highest_overall_rank");
            String highestOverallRankWeek = rsr.getStringItem("highest_overall_rank_week");
            Integer highestWeeklyRank = getNullableItem(rsr, "highest_weekly_rank");
            Integer highestWeeklyRankPoints = getNullableItem(rsr, "highest_weekly_rank_points");
            String highestWeeklyRankWeek = rsr.getStringItem("highest_weekly_rank_week");
            Integer overallRank = getNullableItem(rsr, "overall_rank");
            Integer totalRankedMembers = getNullableItem(rsr, "total_ranked_members");
            Integer userId = getNullableItem(rsr, "user_id");
            Double winPercent = rsr.getDoubleItem("win_percent");

            return new MemberData(handle, highestOverallRank, highestOverallRankWeek,
                    highestWeeklyRank, highestWeeklyRankPoints, highestWeeklyRankWeek,
                    overallRank, totalRankedMembers, userId, winPercent);
        } else {
            return null;
        }
    }

    private ResultSetContainer getWeeksData() throws Exception {
        Request r = new Request();
        r.setContentHandle("user_prediction_weeks");
        r.setProperty(Constants.USER_ID, String.valueOf(getUser().getId()));

        DataAccessInt dai = new CachedDataAccess(DBMS.WINFORMULA_DATASOURCE_NAME);
        return dai.getData(r).get("user_prediction_weeks");
    }
    
    
}
