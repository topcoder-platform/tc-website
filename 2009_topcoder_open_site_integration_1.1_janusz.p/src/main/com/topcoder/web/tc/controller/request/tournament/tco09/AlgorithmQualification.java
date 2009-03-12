/**
 * Copyright (C) 2004 - 2009 TopCoder Inc., All Rights Reserved.  
 */
package com.topcoder.web.tc.controller.request.tournament.tco09;

import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.model.SortInfo;
import com.topcoder.web.tc.controller.request.tournament.AdvancersBase;

/** 
 * Controller class for Algorithm Competition Qualification view. All business
 * logic is done by super class. This class provides concrete implementation
 * for AdvancersBase abstract methods needed to use this controller in TCO 09
 * context.
 * 
 * Author TCSDEVELOPER
 * Version 1.0
 * Since 2009 TopCoder Open Site Integration
 */
public class AlgorithmQualification extends AdvancersBase {

    /**
     * Contest prefix (dir name).
     */
    @Override
    protected String getContestPrefix() {
        return "tco09";
    }

    /**
     * Name of method from which algorithm qualification data should 
     * be retrieved.
     */
    @Override
    protected String getCommandName() {
        return "tco09_alg_qual";
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
        return "/tournaments/" + getContestPrefix() + "/algorithm/advancers/qualification.jsp";
    }
    
    /**
     * Sorting details.
     */
    @Override
    protected void setSortInfo(ResultSetContainer rsc) {
        SortInfo s = new SortInfo();
        s.addDefault(rsc.getColumnIndex("handle_sort"), "asc");
        s.addDefault(rsc.getColumnIndex("round_name"), "asc");
        s.addDefault(rsc.getColumnIndex("rating"), "desc");
        s.addDefault(rsc.getColumnIndex("points"), "desc");
        getRequest().setAttribute(SortInfo.REQUEST_KEY, s);
    }

}
