/*
 * Copyright (C) 2004 - 2010 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.tc.controller.request.contest;

import java.util.Date;
import java.util.Map;

import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.security.ClassResource;
import com.topcoder.util.config.ConfigManager;
import com.topcoder.util.config.UnknownNamespaceException;
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
 * <p>
 *   Version 1.4 (Distribution Auto Generation Assembly v1.0) Change notes:
 *   <ol>
 *     <li>Loading instruction link from configuration file.</li>
 *   </ol>
 * </p>
 *
 * @author dok, pulky, romanoTC
 * @version 1.4
 */
public class ProjectDetail extends Base {

    /**
     * Configuration namespace.
     * @since 1.4
     */
    private static final String DEFAULT_NAMESPACE = "com.topcoder.web.tc.controller.request.contest.ProjectDetail";

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
            r.setProperty(Constants.PROJECT_ID, projectId);

            Map<String, ResultSetContainer> resultMap = getDataAccess().getData(r);

            ResultSetContainer details = resultMap.get("project_detail");
            ResultSetContainer docs = resultMap.get("project_docs");

            getRequest().setAttribute("projectDetail", details);
            getRequest().setAttribute("technologies", resultMap.get("project_technologies"));
            getRequest().setAttribute("requirements", resultMap.get("project_requirements"));
            getRequest().setAttribute("supportingDocs", docs);

            Long categoryId = details.getLongItem(0, "project_category_id");
            Long rootCategoryId = details.getLongItem(0, "root_category_id");

            getRequest().setAttribute("instructionsLinks", getInstructionLinks(docs, categoryId, rootCategoryId));

            boolean full = false;  //projects are never full in our current rules
            getRequest().setAttribute("projectFull", String.valueOf(full));
            getRequest().setAttribute("projectId", projectId);

            if (details.isEmpty()) {
                throw new NavigationException("Could not find project information.");
            }

            getRequest().setAttribute("paysRoyalties", !details.getBooleanItem(0, "is_custom") );

            ReliabilityBonusCalculator reliabilityBonus = ReliabilityBonusCalculator.getInstance();
            Double firstPlacePrize = details.getDoubleItem(0, "total_payment");
            Date postingDate = details.getTimestampItem(0, "posting_date");
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

    /**
     * <p>
     * Creates an array with instructions links for document types.
     * </p>
     *
     * @param docs the project documents list.
     * @param categoryId the category of the project (Design, Development, etc.)
     * @param rootCategoryId the root category (Java, .NET, etc).
     * @return an array with instructions links for document types.
     * @since 1.4
     */
    private String[] getInstructionLinks(ResultSetContainer docs, Long categoryId, Long rootCategoryId) {

        if ((docs == null) || (docs.size() == 0)) {
            return new String[0];
        }

        ConfigManager configManager = ConfigManager.getInstance();

        String[] links = new String[docs.size()];
        if (!configManager.existsNamespace(DEFAULT_NAMESPACE)) {
            return links;
        }

        int pos = 0;
        for (ResultSetContainer.ResultSetRow row : docs) {
            String key = categoryId + "." + row.getMap().get("document_type_id").toString();

            String link = null;
            try {
                // Tries to find for a specific root category
                link = (String) configManager.getProperty(DEFAULT_NAMESPACE, key + "." + rootCategoryId);

                if (link == null) {
                    // Tries the more specific
                    link = (String) configManager.getProperty(DEFAULT_NAMESPACE, key);
                }

            } catch (UnknownNamespaceException ex) {
                // ignores
            }

            links[pos++] = link;
        }

        return links;
    }
}
