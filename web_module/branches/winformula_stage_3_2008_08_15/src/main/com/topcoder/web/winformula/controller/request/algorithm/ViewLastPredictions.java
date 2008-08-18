/*
 * ViewLastPredictions
 * 
 * Created Aug 8, 2008
 */
package com.topcoder.web.winformula.controller.request.algorithm;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import com.topcoder.server.ejb.TestServices.LongTestResult;
import com.topcoder.shared.dataAccess.DataAccessConstants;
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
import com.topcoder.web.common.model.SortInfo;
import com.topcoder.web.common.tag.ListSelectTag;
import com.topcoder.web.winformula.Constants;
import com.topcoder.web.winformula.controller.PredictionsHelper;
import com.topcoder.web.winformula.controller.request.AlgorithmBase;
import com.topcoder.web.winformula.model.GameResult;
import com.topcoder.web.winformula.model.Prediction;
import com.topcoder.web.winformula.model.PredictionItem;
import com.topcoder.web.winformula.model.PredictionStat;

/**
 * @autor Diego Belfer (Mural), Pablo Wolfus (pulky)
 * @version $Id$
 */
public class ViewLastPredictions extends AlgorithmBase {
    protected static final Logger log = Logger.getLogger(ViewLastPredictions.class);

    public static final String FULL_LIST = "full";
    
    private int weekId = -1;

    protected void longContestProcessing() throws Exception {
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
            ResultSetContainer rsc = getData();
    
            // make it a list of beans
            LongTestResult result = processResult(rsc, weekId);

            // sort
            PredictionsHelper.sortResult(request, (Prediction) result.getResultObject());
    
            // crop
            PredictionsHelper.cropResult(request, (Prediction) result.getResultObject());
    
            request.setAttribute("result", result);

            setNextPage(Constants.PAGE_LAST_PREDICTIONS);
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
                weekId = rscWeeks.get(0).getIntItem("week_id");
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
                
                PredictionItem pi = new PredictionItem(rsr.getStringItem("home"), rsr.getStringItem("visitor"), 
                        new GameResult(getNullableItem(rsr, "home_pred"), getNullableItem(rsr, "visitor_pred")),
                        new GameResult(getNullableItem(rsr, "home_score"), getNullableItem(rsr, "visitor_score")),
                        getNullableItem(rsr, "prediction_points"));

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
        r.setContentHandle("latest_user_prediction");
        r.setProperty(Constants.USER_ID, String.valueOf(getUser().getId()));
        r.setProperty(Constants.WEEK_ID, String.valueOf(weekId));

        DataAccessInt dai = new CachedDataAccess(DBMS.WINFORMULA_DATASOURCE_NAME);
        return dai.getData(r).get("latest_user_prediction");
    }

    private ResultSetContainer getWeeksData() throws Exception {
        Request r = new Request();
        r.setContentHandle("user_prediction_weeks");
        r.setProperty(Constants.USER_ID, String.valueOf(getUser().getId()));

        DataAccessInt dai = new CachedDataAccess(DBMS.WINFORMULA_DATASOURCE_NAME);
        return dai.getData(r).get("user_prediction_weeks");
    }

    /**
     * Sorts the result as specified
     * 
     * @param rsc the resultsetcontainter to sort
     */
    private void sortResult(ResultSetContainer rsc) {
        String sortDir = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.SORT_DIRECTION));
        String sortCol = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.SORT_COLUMN));
        if (sortCol.equals("")) {
            sortCol = "5";
            sortDir = "asc";
        }
        if (rsc != null) {
            rsc.sortByColumn(Integer.parseInt(sortCol), !"desc".equals(sortDir));
        }
        setDefault(DataAccessConstants.SORT_COLUMN, sortCol);
        setDefault(DataAccessConstants.SORT_DIRECTION, sortDir);
        setSortInfo(rsc);
    }

    /**
     * Sets sort information
     * 
     * @param rsc
     */
    private void setSortInfo(ResultSetContainer rsc) {
        SortInfo s = new SortInfo();
        s.addDefault(rsc.getColumnIndex("home"), "asc");
        s.addDefault(rsc.getColumnIndex("visitor"), "asc");
        getRequest().setAttribute(SortInfo.REQUEST_KEY, s);
   }
}
