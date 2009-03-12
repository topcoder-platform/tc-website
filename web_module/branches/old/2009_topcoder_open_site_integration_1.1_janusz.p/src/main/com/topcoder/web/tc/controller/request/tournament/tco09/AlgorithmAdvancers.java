/**
 * Copyright (C) 2004 - 2009 TopCoder Inc., All Rights Reserved.  
 */
package com.topcoder.web.tc.controller.request.tournament.tco09;

import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.model.SortInfo;
import com.topcoder.web.tc.controller.request.tournament.AdvancersBase;

/** 
 * Controller class for Algorithm Competition Leaderboard view. All business
 * logic is done by super class. This class provides concrete implementation
 * for AdvancersBase abstract methods needed to use this controller in TCO 09
 * context.
 * 
 * Author TCSDEVELOPER
 * Version 1.0
 * Since 2009 TopCoder Open Site Integration
 */
public class AlgorithmAdvancers extends AdvancersBase {

    /**
     * Contest prefix (dir name).
     */
    @Override
    protected String getContestPrefix() {
        return "tco09";
    }

    /**
     * Name of method from which algorithm leaderboard data should 
     * be retrieved.
     */
    @Override
    protected String getCommandName() {
        return "tco09_alg_adv_overview";
    }

    /**
     * Database source.
     */
    protected String getDataSourceName() {
        return DBMS.DW_DATASOURCE_NAME;
    }

    /**
     * View which should be used for data presentation.
     */
    @Override
    protected String getPageName() {
        return "/tournaments/" + getContestPrefix() + "/algorithm/advancers/leaderboard.jsp";
    }
    
    /**
     * Sorting details.
     */
    @Override
    protected void setSortInfo(ResultSetContainer rsc) {
        SortInfo s = new SortInfo();
        s.addDefault(rsc.getColumnIndex("seed"), "asc");
        s.addDefault(rsc.getColumnIndex("handle_sort"), "asc");
        s.addDefault(rsc.getColumnIndex("rating"), "desc");
        s.addDefault(rsc.getColumnIndex("round1_sort"), "asc");
        s.addDefault(rsc.getColumnIndex("round2_sort"), "asc");
        s.addDefault(rsc.getColumnIndex("round3_sort"), "asc");
        s.addDefault(rsc.getColumnIndex("round4_sort"), "asc");
        s.addDefault(rsc.getColumnIndex("round5_sort"), "asc");
        s.addDefault(rsc.getColumnIndex("semi_sort"), "asc");
        s.addDefault(rsc.getColumnIndex("finals_sort"), "asc");
        getRequest().setAttribute(SortInfo.REQUEST_KEY, s);
    }

}
