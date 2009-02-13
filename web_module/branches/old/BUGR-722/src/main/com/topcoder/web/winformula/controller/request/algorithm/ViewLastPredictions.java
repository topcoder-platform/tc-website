/*
 * ViewLastPredictions
 * 
 * Created Aug 8, 2008
 */
package com.topcoder.web.winformula.controller.request.algorithm;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.List;

import com.topcoder.server.ejb.TestServices.LongTestResult;
import com.topcoder.shared.dataAccess.DataAccess;
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
import com.topcoder.web.common.cache.MaxAge;
import com.topcoder.web.common.tag.ListSelectTag;
import com.topcoder.web.winformula.Constants;
import com.topcoder.web.winformula.controller.PredictionsHelper;
import com.topcoder.web.winformula.controller.request.AlgorithmBase;
import com.topcoder.web.winformula.model.Prediction;

/**
 * @autor Diego Belfer (Mural), Pablo Wolfus (pulky)
 * @version $Id: ViewLastPredictions.java 72590 2008-08-26 20:11:53Z pwolfus $
 */
public class ViewLastPredictions extends AlgorithmBase {
    protected static final Logger log = Logger.getLogger(ViewLastPredictions.class);

    protected int weekId = -1;
    protected Integer roundId = null;

    protected void longContestProcessing() throws Exception {
        try {
            TCRequest request = getRequest();

            int coderId = getUserID();
            if (!isUserRegisteredInContest(getContestID(), coderId)) {
                registrationNeeded("You need to be registered in order to view your results.");
                return;
            }

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
            ResultSetContainer rsc = PredictionsHelper.getPredictionsData(coderId, weekId);

            // Set algo date
            request.setAttribute("algoDate", getSubmissionDate(coderId));
            
            // make it a list of beans
            LongTestResult result = PredictionsHelper.processResult(rsc, weekId);

            // sort
            if (result != null) {
                PredictionsHelper.sortResult(request, (Prediction) result.getResultObject());
        
                // crop
                PredictionsHelper.cropResult(request, (Prediction) result.getResultObject());
            }
            
            request.setAttribute("result", result);
            request.setAttribute("round", roundId);

            setNextPage(nextPage());
            setIsNextPageInContext(true);
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }
    
    protected String nextPage() {
        return Constants.PAGE_LAST_PREDICTIONS;
    }

    /**
     * @param selectedWeek
     * @throws Exception
     */
    private List<ListSelectTag.Option> getWeeks(long coderId) throws Exception {
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
            }
        } else { 
            log.info("weeks is null or empty");
            weeks = Collections.emptyList();
        }
        return weeks;
    }
    

    private Date getSubmissionDate(long coderId) throws Exception {
        Request r = new Request();
        String commandName = "user_prediction_latest_submission";
        if (roundId != null) {
            commandName = "user_prediction_round_submission";
        }
        r.setContentHandle(commandName);

        r.setProperty(Constants.USER_ID, String.valueOf(coderId));
        if (roundId != null) {
            r.setProperty(Constants.ROUND_ID, String.valueOf(roundId));
        }

        DataAccessInt dai = new DataAccess(DBMS.WINFORMULA_DATASOURCE_NAME);
        ResultSetContainer rsc = dai.getData(r).get(commandName);
        
        if (rsc.size() > 0) {
            return new Date(rsc.get(0).getLongItem("submit_time"));
        } else {
            return null;
        }
    }

    private ResultSetContainer getWeeksData(long coderId) throws Exception {
        Request r = new Request();
        String commandName = "user_prediction_latest_weeks";
        if (roundId != null) {
            commandName = "user_prediction_round_weeks";
        }
        r.setContentHandle(commandName);
        r.setProperty(Constants.USER_ID, String.valueOf(coderId));
        if (roundId != null) {
            r.setProperty(Constants.ROUND_ID, String.valueOf(roundId));
        }
        DataAccessInt dai = new CachedDataAccess(MaxAge.QUARTER_HOUR, DBMS.WINFORMULA_DATASOURCE_NAME);
        return dai.getData(r).get(commandName);
    }
}
