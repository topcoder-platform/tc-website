/*
 * ViewStandings
 * 
 * Created Aug 8, 2008
 */
package com.topcoder.web.winformula.controller.request;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer.ResultSetRow;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.CachedDataAccess;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.TCRequest;
import com.topcoder.web.common.TCResponse;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.cache.MaxAge;
import com.topcoder.web.common.tag.ListSelectTag;
import com.topcoder.web.winformula.Constants;
import com.topcoder.web.winformula.controller.StatsHelper;
import com.topcoder.web.winformula.model.StandingsItem;

/**
 * @autor Pablo Wolfus (pulky)
 * @version $Id$
 */
public class ViewStandings extends AlgorithmBase {
    protected static final Logger log = Logger.getLogger(ViewStandings.class);

    protected Integer weekId = null;
    protected Integer miniSeasonId = null;

    protected void longContestProcessing() throws Exception {
        try {
            TCRequest request = getRequest();
            TCResponse response = getResponse();

            String selectedWeek = StringUtils.checkNull(request.getParameter("week"));
            String selectedMiniSeason = StringUtils.checkNull(request.getParameter("msi"));

            try {
                weekId = Integer.parseInt(selectedWeek);
            } catch (Exception e) {
            }

            try {
                miniSeasonId = Integer.parseInt(selectedMiniSeason);
            } catch (Exception e) {
            }

            // get data from DB
            request.setAttribute("periods", getPeriods());

            // then the stats
            ResultSetContainer rsc = StatsHelper.getStats(weekId, miniSeasonId);

            // make it a list of beans
            List<StandingsItem> result = StatsHelper.processResult(rsc);

            // sort
            if (result != null) {
                StatsHelper.sortResult(request, result);
        
                // crop
                result = StatsHelper.cropResult(request, response, result);
            }

            if (weekId != null) {
                request.setAttribute("periodId", weekId);
            } else if (miniSeasonId != null) {
                request.setAttribute("periodId", miniSeasonId);
            }

            request.setAttribute("result", result);

            setNextPage(nextPage());
            setIsNextPageInContext(true);
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }
    
    protected String nextPage() {
        return Constants.PAGE_STANDINGS;
    }

    /**
     * @throws Exception
     */
    private List<ListSelectTag.Option> getPeriods() throws Exception {
        ResultSetContainer rsc = null; 
        String selectedDesc = null;
        int selectedId;

        if (weekId != null) {
            rsc = getPeriodData("weeks_data");
            selectedId = weekId;
            getRequest().setAttribute("periodKey", "week");
        } else if (miniSeasonId != null) {
            rsc = getPeriodData("mini_season_data");
            selectedId = miniSeasonId;
            getRequest().setAttribute("periodKey", "msi");
        } else {
            getRequest().setAttribute("periodDesc", "Overall");
            return null;
        }

        List<ListSelectTag.Option> periods;
        if (rsc.size() > 0) {
            periods = new ArrayList<ListSelectTag.Option>(rsc.size());
            boolean found = false;
            for (ResultSetRow rsr : rsc) {
                int periodId = rsr.getIntItem("period_id");
                String periodDesc = rsr.getStringItem("period_desc");
                periods.add(new ListSelectTag.Option(String.valueOf(periodId), periodDesc, periodId == selectedId));
                if (periodId == selectedId) {
                    found = true;
                    selectedDesc = periodDesc;
                }
            }
            if (!found && rsc.size() > 0) {
                if (weekId != null) {
                    weekId = rsc.get(0).getIntItem("period_id");
                } else {
                    miniSeasonId = rsc.get(0).getIntItem("period_id");
                }
                selectedDesc = rsc.get(0).getStringItem("period_desc");
            }
            if (rsc.size() > 0) {
                getRequest().setAttribute("maxPeriod", rsc.get(rsc.size()-1).getIntItem("period_id"));
            }
        } else { 
            log.info("period is null or empty");
            periods = Collections.emptyList();
        }
        getRequest().setAttribute("periodDesc", selectedDesc);
        return periods;
    }
    

    private ResultSetContainer getPeriodData(String commandName) throws Exception {
        Request r = new Request();
        r.setContentHandle(commandName);
        DataAccessInt dai = new CachedDataAccess(MaxAge.FIVE_MINUTES, DBMS.WINFORMULA_DATASOURCE_NAME);
        return dai.getData(r).get(commandName);
    }
}
