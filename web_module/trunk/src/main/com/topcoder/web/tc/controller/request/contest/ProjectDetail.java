/*
 * Copyright (C) 2004 - 2009 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.tc.controller.request.contest;

import java.util.Date;
import java.util.Map;

import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.tc.controller.request.development.Base;
import com.topcoder.web.tc.controller.request.util.ReliabilityBonusCalculator;

/**
 * <p>A controller to handle the requests for displaying the details of a given project.</p>
 *
 * <p>
 *   Version 1.1 Change notes:
 *   <ol>
 *     <li>Added detailed requirements retrieval.</li>
 *   </ol>
 * </p>
 *
 * @author dok, pulky
 * @version 1.1
 */
public class ProjectDetail extends Base {


    protected void developmentProcessing() throws TCWebException {

        try {
            String projectId = StringUtils.checkNull(getRequest().getParameter(Constants.PROJECT_ID));

            if (projectId.equals("")) {
                throw new TCWebException("parameter " + Constants.PROJECT_ID + " expected.");
            }

            int projectTypeId = getProjectTypeId(Long.parseLong(projectId));

            if (projectTypeId == -1) {
                throw new TCWebException("Could not find project information.");
            }

            Request r = new Request();
            r.setContentHandle("project_detail");
            r.setProperty(Constants.PROJECT_ID, StringUtils.checkNull(getRequest().getParameter(Constants.PROJECT_ID)));

            Map<String, ResultSetContainer> resultMap = getDataAccess().getData(r);

            ResultSetContainer details = (ResultSetContainer) resultMap.get("project_detail");
            getRequest().setAttribute("projectDetail", details);
            getRequest().setAttribute("technologies", resultMap.get("project_technologies"));
			getRequest().setAttribute("requirements", resultMap.get("project_requirements"));

            boolean full = false;  //projects are never full in our current rules
            getRequest().setAttribute("projectFull", String.valueOf(full));
            getRequest().setAttribute("projectId", StringUtils.checkNull(getRequest().getParameter(Constants.PROJECT_ID)));
            
            if (details.isEmpty()) {
                throw new NavigationException("Could not find project information.");
            }

            getRequest().setAttribute("paysRoyalties", !details.getBooleanItem(0, "is_custom") );
            
            ReliabilityBonusCalculator reliabilityBonus = ReliabilityBonusCalculator.getInstance();
            Double firstPlacePrize = details.getDoubleItem(0, "total_payment");
            Date postingDate = details.getTimestampItem(0, "posting_date");
            Long categoryId = details.getLongItem(0, "project_category_id");
            getRequest().setAttribute("maxReliabilityBonus",
                    reliabilityBonus.getReliabilityPercent(1.0, postingDate, categoryId) * firstPlacePrize);

            String projectDetailPage = getProjectDetailPage(projectTypeId);
            if (projectDetailPage.equals("")) {
                throw new TCWebException("Invalid phase found: " + (projectTypeId + 111));
            }

            setNextPage(projectDetailPage);
            setIsNextPageInContext(true);

        } catch (TCWebException e) {
            throw e;
        } catch (Exception e) {
            throw new TCWebException(e);
        }


    }
}
