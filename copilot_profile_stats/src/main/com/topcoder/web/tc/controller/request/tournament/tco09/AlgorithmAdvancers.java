/*
 * Copyright (C) 2004 - 2009 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.tc.controller.request.tournament.tco09;

import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.model.SortInfo;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.tc.controller.request.tournament.AdvancersBase;

/**
 * <p>This class provides specific implementation for TCO09 Algorithm Advancers leaderboard.</p>
 *
 * @author TCSDEVELOPER
 * @version 1.0
 * @since 2009 TopCoder Open Site Integration 1.1
 */
public class AlgorithmAdvancers extends AdvancersBase {

    /**
     * <p>
     * This method returns TCO09 short description. 
     * </p>
     * 
     * @return <code>String</code> containing the TCO09 short description
     */
    @Override
    protected String getContestPrefix() {
        return Constants.TCO09_SHORT_DESC;
    }

    /**
     * <p>
     * This method returns TCO09 algorithm advancers Query Tool's command name. 
     * </p>
     * 
     * @return <code>String</code> containing the command name
     */
    @Override
    protected String getCommandName() {
        return "tco09_alg_adv_overview";
    }

    /**
     * <p>
     * This method returns the datasource to query for TCO09 algorithm advancers information. 
     * </p>
     * 
     * @return <code>String</code> containing the command name
     */
    @Override
    protected String getDataSourceName() {
        return DBMS.DW_DATASOURCE_NAME;
    }

    /**
     * <p>
     * This method returns the JSP path for the TCO09 algorithm advancers page 
     * </p>
     * 
     * @return <code>String</code> containing the JSP path
     */
    @Override
    protected String getPageName() {
        return "/tournaments/" + getContestPrefix() + "/algorithm/advancers/leaderboard.jsp";
    }
    
    /**
     * <p>
     * This method sets the sort information for the <code>ResultSetContainer</code>
     * </p>
     * 
     * @param rsc a <code>ResultSetContainer</code> with query results
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
        s.addDefault(rsc.getColumnIndex("semi_sort"), "asc");
        s.addDefault(rsc.getColumnIndex("wildcard_sort"), "asc");
        s.addDefault(rsc.getColumnIndex("finals_sort"), "asc");
        getRequest().setAttribute(SortInfo.REQUEST_KEY, s);
    }

}
