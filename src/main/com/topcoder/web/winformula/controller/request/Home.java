package com.topcoder.web.winformula.controller.request;

import java.util.List;

import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.CachedDataAccess;
import com.topcoder.web.common.TCRequest;
import com.topcoder.web.winformula.Constants;
import com.topcoder.web.winformula.controller.StatsHelper;
import com.topcoder.web.winformula.model.StandingsItem;

/**
 * @author dok
 * @version $Revision: 72755 $ Date: 2005/01/01 00:00:00
 *          Create Date: Jun 22, 2006
 */
public class Home extends BaseProcessor {

    protected void businessProcessing() throws Exception {
        TCRequest request = getRequest();

        // get latest periods
        LatestPeriod lp = getLatestStatsPeriods();
        request.setAttribute("lp", lp);
        
        // get week standings
        List<StandingsItem> weekStandings = StatsHelper.processResult(getStandingsData("week_top_five", Constants.WEEK_ID, String.valueOf(lp.getWeekId())));
        request.setAttribute("weekStandings", weekStandings);
        
        // get mini season standings
        List<StandingsItem> miniSeasonStandings = StatsHelper.processResult(getStandingsData("mini_season_top_five", Constants.MINI_SEASON_ID, String.valueOf(lp.getMiniSeasonId())));
        request.setAttribute("miniSeasonStandings", miniSeasonStandings);
        
        // get overall standings
        List<StandingsItem> overallStandings = StatsHelper.processResult(getStandingsData("overall_top_ten", null, null));
        request.setAttribute("overallStandings", overallStandings);
        
        setNextPage("/home.jsp");
        setIsNextPageInContext(true);
    }
    
    private LatestPeriod getLatestStatsPeriods() throws Exception {
        ResultSetContainer rsc = getData("latest_periods");
        
        return new LatestPeriod(rsc.getIntItem(0, "mini_season_id"), rsc.getStringItem(0, "mini_season_desc"),
                rsc.getIntItem(0, "week_id"), rsc.getStringItem(0, "week_desc"));
    }

    private ResultSetContainer getStandingsData(String commandName, String propertyName, String propertyValue) throws Exception {
        Request r = new Request();
        r.setContentHandle(commandName);
        if (propertyName != null) {
            r.setProperty(propertyName, propertyValue);
        }
        if (userIdentified()) {
            r.setProperty(Constants.USER_ID, String.valueOf(getUser().getId()));
            getRequest().setAttribute("showUserId", getUser().getId());
        } else {
            r.setProperty(Constants.USER_ID, "0");
            getRequest().setAttribute("showUserId", 0);
        }
        DataAccessInt dai = new CachedDataAccess(DBMS.WINFORMULA_DATASOURCE_NAME);
        return dai.getData(r).get(commandName);
    }

    private ResultSetContainer getData(String commandName) throws Exception {
        Request r = new Request();
        r.setContentHandle(commandName);
        DataAccessInt dai = new CachedDataAccess(DBMS.WINFORMULA_DATASOURCE_NAME);
        return dai.getData(r).get(commandName);
    }

    public class LatestPeriod {
        private Integer miniSeasonId;
        private Integer weekId;
        private String miniSeasonDesc;
        private String weekDesc;

        public LatestPeriod(Integer miniSeasonId, String miniSeasonDesc,
                Integer weekId, String weekDesc) {
            super();
            this.miniSeasonDesc = miniSeasonDesc;
            this.miniSeasonId = miniSeasonId;
            this.weekDesc = weekDesc;
            this.weekId = weekId;
        }

        public Integer getMiniSeasonId() {
            return miniSeasonId;
        }
        public void setMiniSeasonId(Integer miniSeasonId) {
            this.miniSeasonId = miniSeasonId;
        }
        public Integer getWeekId() {
            return weekId;
        }
        public void setWeekId(Integer weekId) {
            this.weekId = weekId;
        }
        public String getMiniSeasonDesc() {
            return miniSeasonDesc;
        }
        public void setMiniSeasonDesc(String miniSeasonDesc) {
            this.miniSeasonDesc = miniSeasonDesc;
        }
        public String getWeekDesc() {
            return weekDesc;
        }
        public void setWeekDesc(String weekDesc) {
            this.weekDesc = weekDesc;
        }
    }
}