/*
 * Copyright (c) 2001-2008 TopCoder Inc.  All Rights Reserved.
 */
package com.topcoder.web.tc.controller.request.contest;

import java.util.Map;

import com.topcoder.shared.dataAccess.DataAccessConstants;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.model.SortInfo;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.tc.controller.request.development.Base;
import com.topcoder.web.tc.controller.request.development.ReliabilityBonusColumnCalculator;

/**
 * <p>Base class for generic active contests processing.</p>
 *
 * <p><b>Change Log:</b></p>
 * <p>
 *   <table>
 *     <tr>
 *         <td>Version 1.1 (BUGR-2749)</td>
 *         <td>
 *           <ul>
 *             <li>Added reliabiity bonus column calculation.</li>
 *           </ul>
 *         </td>
 *     </tr>
 *   </table>
 * </p>
 *
 * @author pulky
 * @version 1.1
 */
public abstract class ActiveContestsBase extends Base {

    private int projectTypeId = 0;
    
    protected void setProjectType(int  projectTypeId) {
        this.projectTypeId = projectTypeId;
    }

    protected int getProjectType() {
        return this.projectTypeId;
    }

    protected String getCommandName() {
        return "active_contests_list";
    }
    
    protected String getActiveContestsPage() {
        return "/contest/activeContests.jsp";
    }

    protected abstract Boolean hasDR();

    protected void developmentProcessing() throws TCWebException {
        try {
            // Gets sort parameters.
            String sortDir = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.SORT_DIRECTION));
            String sortCol = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.SORT_COLUMN));

            setDefault(DataAccessConstants.SORT_DIRECTION, getRequest().getParameter(DataAccessConstants.SORT_DIRECTION));
            setDefault(DataAccessConstants.SORT_COLUMN, getRequest().getParameter(DataAccessConstants.SORT_COLUMN));

            Request r = new Request();
            r.setContentHandle(getCommandName());
            if (!sortCol.equals("") && !sortDir.equals("") && !sortCol.equals(RELIABILITY_BONUS_COLUMN_INDEX)) {  
                r.setProperty(DataAccessConstants.SORT_DIRECTION, sortDir);
                r.setProperty(DataAccessConstants.SORT_COLUMN, sortCol);
            }

            r.setProperty(Constants.PROJECT_TYPE_ID, String.valueOf(getProjectType()));
            r.setProperty(DataAccessConstants.SORT_QUERY, getCommandName());
            Map<String, ResultSetContainer> result = getDataAccess().getData(r);
            ResultSetContainer rsc = new ResultSetContainer(result.get(getCommandName()), 
                    new ReliabilityBonusColumnCalculator());
            getRequest().setAttribute("contests", rsc);

            
            if (sortCol.equals(RELIABILITY_BONUS_COLUMN_INDEX) && !sortDir.equals("")) {
                rsc.sortByColumn(rsc.getColumnCount() - 1, sortDir.equals("asc"));
            }
            
            // defines column's default sort.
            SortInfo s = new SortInfo();
            s.addDefault(3, "asc");   // Catalog    
            s.addDefault(1, "asc");   // Contest
            s.addDefault(4, "desc");   // rated Registrants
            s.addDefault(6, "desc");   // unrated Registrants
            s.addDefault(5, "desc");   // total Registrants
            s.addDefault(2, "desc"); // Reg. End   
            s.addDefault(7, "desc");  // Submissions
            s.addDefault(10, "desc");  // Payment    
            s.addDefault(0, "desc");  // Submit by  
            s.addDefault(99, "desc");  // reliability bonus  
            getRequest().setAttribute(SortInfo.REQUEST_KEY, s);

            getRequest().setAttribute(Constants.PROJECT_TYPE_ID, getProjectType());
            getRequest().setAttribute("hasDR", hasDR());
            
            setNextPage(getActiveContestsPage());
            setIsNextPageInContext(true);
        } catch (TCWebException e) {
            throw e;
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }
}
