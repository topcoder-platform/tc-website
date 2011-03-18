/*
 * Copyright (C) 2010 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.tc.controller.request.tournament.tco11;

import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.model.SortInfo;
import com.topcoder.web.tc.TCO11Constants;
import com.topcoder.web.tc.controller.request.tournament.AdvancersBase;

/**
 * <p>This class provides specific implementation for TCO11 Algorithm Qualification page.</p>
 *
 * @author TCSDEVELOPER
 * @version 1.0
 */
public class AlgorithmQualification extends AdvancersBase {

    /**
     * <p>
     * This method returns TCO11 short description. 
     * </p>
     * 
     * @return <code>String</code> containing the TCO11 short description
     */
    @Override
    protected String getContestPrefix() {
        return TCO11Constants.TCO11_SHORT_DESC;
    }

    /**
     * <p>
     * This method returns TCO11 algorithm qualification Query Tool's command name. 
     * </p>
     * 
     * @return <code>String</code> containing the command name
     */
    @Override
    protected String getCommandName() {
        return "tco10_alg_qual";
    }

    /**
     * <p>
     * This method returns the datasource to query for TCO11 algorithm qualification information. 
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
     * This method returns the JSP path for the TCO11 algorithm qualification page 
     * </p>
     * 
     * @return <code>String</code> containing the JSP path
     */
    @Override
    protected String getPageName() {
        return "/tournaments/" + getContestPrefix() + "/algorithm/qualification.jsp";
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
        s.addDefault(rsc.getColumnIndex("handle_sort"), "asc");
        s.addDefault(rsc.getColumnIndex("round_name"), "asc");
        s.addDefault(rsc.getColumnIndex("rating"), "desc");
        s.addDefault(rsc.getColumnIndex("points"), "desc");
        getRequest().setAttribute(SortInfo.REQUEST_KEY, s);
    }
}
