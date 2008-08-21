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
import com.topcoder.web.winformula.model.MemberData;
import com.topcoder.web.winformula.model.Prediction;

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

            int coderId = getUserID();

            log.debug("coder: " + coderId + " user " + getUser().getId());

            String selectedWeek = StringUtils.checkNull(request.getParameter("week"));

            try {
                weekId = Integer.parseInt(selectedWeek);
            } catch (Exception e) {
            }

            // get data from DB
            // first the weeks
            request.setAttribute("weeks", getWeeks(coderId));

            // then the predictions
            MemberData md = getMemberData(coderId);

            // then the predictions
            ResultSetContainer rsc = PredictionsHelper.getPredictionsData(coderId, weekId);

            // make it a list of beans
            LongTestResult result = PredictionsHelper.processResult(rsc, weekId);

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
    private List<ListSelectTag.Option> getWeeks(int coderId) throws Exception {
        ResultSetContainer rscWeeks = getWeeksData(coderId);
        List<ListSelectTag.Option> weeks;
        if (rscWeeks.size() > 0) {
            weeks = new ArrayList<ListSelectTag.Option>(rscWeeks.size());
            boolean found = false;
            for (ResultSetRow rsr : rscWeeks) {
                weeks.add(new ListSelectTag.Option(String.valueOf(rsr.getIntItem("week_id")), rsr.getStringItem("week_desc"), rsr.getIntItem("week_id") == weekId));
                if (rsr.getIntItem("week_id") == weekId) {
                    found = true;
                }
            }
            if (!found && rscWeeks.size() > 0) {
                weekId = rscWeeks.get(0).getIntItem("week_id");
                log.debug("using week: " + weekId);
            }
        } else { 
            log.info("weeks is null or empty");
            weeks = Collections.emptyList();
        }
        return weeks;
    }
        
    private MemberData getMemberData(int coderId) throws Exception {
        Request r = new Request();
        r.setContentHandle("member_data");
        r.setProperty(Constants.USER_ID, String.valueOf(coderId));

        DataAccessInt dai = new CachedDataAccess(DBMS.WINFORMULA_DATASOURCE_NAME);
        ResultSetContainer rsc = dai.getData(r).get("member_data");
        
        if (rsc.size() > 0) {
            ResultSetRow rsr = rsc.get(0);
            String handle = rsr.getStringItem("handle");
            Integer highestOverallRank = PredictionsHelper.getNullableIntItem(rsr, "highest_overall_rank");
            String highestOverallRankWeek = rsr.getStringItem("highest_overall_rank_week");
            Integer highestWeeklyRank = PredictionsHelper.getNullableIntItem(rsr, "highest_weekly_rank");
            Integer highestWeeklyRankPoints = PredictionsHelper.getNullableIntItem(rsr, "highest_weekly_rank_points");
            String highestWeeklyRankWeek = rsr.getStringItem("highest_weekly_rank_week");
            Integer overallRank = PredictionsHelper.getNullableIntItem(rsr, "overall_rank");
            Integer totalRankedMembers = PredictionsHelper.getNullableIntItem(rsr, "total_ranked_members");
            Integer userId = PredictionsHelper.getNullableIntItem(rsr, "user_id");
            Double winPercent = rsr.getDoubleItem("win_percent");

            return new MemberData(handle, highestOverallRank, highestOverallRankWeek,
                    highestWeeklyRank, highestWeeklyRankPoints, highestWeeklyRankWeek,
                    overallRank, totalRankedMembers, userId, winPercent);
        } else {
            return null;
        }
    }

    private ResultSetContainer getWeeksData(int coderId) throws Exception {
        Request r = new Request();
        r.setContentHandle("user_prediction_weeks");
        r.setProperty(Constants.USER_ID, String.valueOf(coderId));

        DataAccessInt dai = new CachedDataAccess(DBMS.WINFORMULA_DATASOURCE_NAME);
        return dai.getData(r).get("user_prediction_weeks");
    }
    
    
}
