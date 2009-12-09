/*
 * Copyright (C) 2004 - 2009 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.tc.controller.request.contest;

import java.util.Date;
import java.util.Map;

import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.security.ClassResource;
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
 * <p>
 *   Version 1.2 (Competition Registration Eligibility v1.0) Change notes:
 *   <ol>
 *     <li>Added eligibility constraints check.</li>
 *   </ol>
 * </p>
 *
 * <p>
 *   Version 1.3 (BUGR-2979) Change notes:
 *   <ol>
 *     <li>Added supporting doc query to request.</li>
 *   </ol>
 * </p>
 *
 * @author dok, pulky
 * @version 1.3
 */
public class ProjectDetail extends Base {


    /**
     * This method executes the actual logic for this processor.
     *
     * @throws TCWebException if any error occurs
     * @see com.topcoder.web.tc.controller.request.development.Base#developmentProcessing()
     */
    protected void developmentProcessing() throws TCWebException {

        try {
            String projectId = StringUtils.checkNull(getRequest().getParameter(Constants.PROJECT_ID));

            if (projectId.equals("")) {
                throw new TCWebException("parameter " + Constants.PROJECT_ID + " expected.");
            }

            // check eligibility constraints
            if (!checkEligibilityConstraints(projectId, new ClassResource(this.getClass()))) {
                throw new NavigationException("Could not find project information.");
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
            getRequest().setAttribute("supportingDocs", resultMap.get("project_docs"));

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
