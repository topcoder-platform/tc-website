/*
 * Copyright (C) 2004 - 2009 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.tc.controller.request.development;

import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.tc.Constants;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.security.ClassResource;

import java.util.Map;

/**
 * <p><strong>Purpose</strong>: This processor handle requests to show registrants for aspecific project.</p>
 *
 * <p>Added some code to permit other projects different from component competitions.</p>
 *
 * <p>
 *   Version 1.1 (Competition Registration Eligibility v1.0) Change notes:
 *   <ol>
 *     <li>Added eligibility constraints check.</li>
 *   </ol>
 * </p>
 *
 * @author dok, pulky
 * @version 1.1
 */
public class ViewRegistrants extends Base {
    protected void developmentProcessing() throws TCWebException {
        try {
            String projectId = StringUtils.checkNull(getRequest().getParameter(Constants.PROJECT_ID));

            if (projectId == "") {
                throw new TCWebException("parameter " + Constants.PROJECT_ID + " expected.");
            }

            // check eligibility constraints
            if (checkEligibilityConstraints(projectId, new ClassResource(this.getClass())) != 0) {
                throw new NavigationException("Could not find project information.");
            }

            int projectTypeId = getProjectTypeId(Long.parseLong(projectId));

            if (projectTypeId == -1) {
                throw new TCWebException("Could not find project information.");
            }

            getRequest().setAttribute(Constants.PROJECT_TYPE_ID, new Integer(projectTypeId));

            Request r = new Request();
            r.setContentHandle(getRegistrantsCommandName(projectTypeId));
            r.setProperty(Constants.PROJECT_ID, String.valueOf(projectId));
            Map<String, ResultSetContainer> resultMap = getDataAccess().getData(r);

            ResultSetContainer registrants = resultMap.get(getRegistrantsCommandName(projectTypeId));
            boolean canViewSubmissionTimestamps = getSessionInfo().isAdmin() || 
                userSubmitted(getUser().getId(), registrants);

            if (canViewSubmissionTimestamps) {
                registrants.sortByColumn("submission_date", "inquiry_date", false, false);
            } else {
                registrants.sortByColumn("inquiry_date", false);
            }

            getRequest().setAttribute("resultMap", resultMap);
            getRequest().setAttribute("canViewSubmissionTimestamps", canViewSubmissionTimestamps);

            setNextPage("/contest/registrants.jsp");
            setIsNextPageInContext(true);
        } catch (TCWebException e) {
            throw e;
          } catch (NumberFormatException nfe) {
            throw new TCWebException("Wrong parameter " + Constants.PROJECT_ID + ".");
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }

    private boolean userSubmitted(long userId, ResultSetContainer registrants) {
        for (int i=0;i<registrants.size();i++) {
            ResultSetContainer.ResultSetRow row = registrants.get(i);
            if (row.getLongItem("user_id") == userId && row.getItem("submission_date").getResultData() != null) {
                return true;
            }
        }
        return false;
    }
}
