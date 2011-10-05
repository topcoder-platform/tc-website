/*
 * Copyright (C) 2004 - 2010 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.tc.controller.request.contest;

import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import com.topcoder.shared.dataAccess.DataAccess;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.security.ClassResource;
import com.topcoder.shared.util.DBMS;
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
 * <p>
 *   Version 1.5 (Copilot Selection Contest Online Review and TC Site Integration Assembly  v1.0) Change notes:
 *   <ol>
 *     <li>Add permission checking for viewing copilot posting project details.</li>
 *   </ol>
 * </p>
 *
 * @author dok, pulky, romanoTC, Blues
 * @version 1.5
 */
public class ProjectDetail extends Base {

    /**
     * Configuration namespace.
     * @since 1.4
     */
    private static final String DEFAULT_NAMESPACE = "com.topcoder.web.tc.controller.request.contest.ProjectDetail";

    private static final String LIQUID_MESSAGE = "In order for your account to get the correct permission to compete in Liquid Community events, "
                         + "you must register/validate your Handle via the Liquid Portal: http://liquidportal.boulder.ibm.com/liquidportal/ (then click on \"Register now\"). "
                         + "If you are unsure how to do this, please contact the Liquid PMO liquid@us.ibm.com for assistance and include your TopCoder handle. "
                         + "Since Liquid Portal is hosted on W3, TopCoder cannot provide support for this issue. ";

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
            int eligibility = checkEligibilityConstraints(projectId, new ClassResource(this.getClass()));
            if (eligibility != 0) {
                //TODO: hard code for now
                if (eligibility == 217)
                {
                    throw new NavigationException(LIQUID_MESSAGE);
                }
                throw new NavigationException("Could not find project information.");
            }

            int projectTypeId = getProjectTypeId(Long.parseLong(projectId));

            if (projectTypeId == -1) {
                throw new TCWebException("Could not find project information.");
            }

            if (projectTypeId == Constants.COPILOT_POSTING_PROJECT_TYPE) {
                try {
                    // check the permission to view project details for copilot posting
                    boolean[] permissions = getPermissionsToViewCopilotPosting(projectId);

                    // if user is anonymous, throw exception
                    if (getSessionInfo().isAnonymous()) {
                        throw new NavigationException("Anonymous User does not has permission to view copilot posting details");
                    }

                    // check permission to view private description
                    boolean registered = isUserCopilotPostingRegistered(projectId);

                    boolean hasPrivateDescriptionPermission = registered || permissions[0] || permissions[2] || getSessionInfo().isAdmin();

                    boolean noRegisterButton =  !hasPrivateDescriptionPermission  && !permissions[1];

                    getRequest().setAttribute("privateDescriptionPermission", hasPrivateDescriptionPermission);
                    getRequest().setAttribute("registerButton", !noRegisterButton);

                } catch (NavigationException navigationEx) {
                    throw navigationEx;
                } catch (Exception ex) {
                    throw new TCWebException("Exception raised when getting copilot posting permissions", ex);
                }
            }

            Request r = new Request();
            r.setContentHandle("project_detail");
            r.setProperty(Constants.PROJECT_ID, projectId);

            Map<String, ResultSetContainer> resultMap = getDataAccess().getData(r);

            ResultSetContainer details = resultMap.get("project_detail");
            ResultSetContainer docs = resultMap.get("project_docs");

            if (details.isEmpty()) {
                throw new NavigationException("Could not find project information.");
            }

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

    /**
     * Gets the permissions array to view the copilot project details page.
     *
     * @param projectId the id of the project.
     * @return the boolean array which contains 3 elements, the first one represents whether the user is resources of
     * copilot posting in online review, the second represents whether the user is in copilot pool, and the third one
     * represents whether the user has permission in direct project.
     * @throws Exception if there is any error
     *
     * @since 1.5
     */
    private boolean[] getPermissionsToViewCopilotPosting(String projectId) throws Exception {
        // initialize default result, all to false
        boolean[] result = new boolean[3];
        for (int i = 0; i < result.length; ++i) {
            result[i] = false;
        }

        // query
        DataAccessInt dAccess = new DataAccess(DBMS.TCS_OLTP_DATASOURCE_NAME);
        Request r = new Request();
        r.setContentHandle("copilot_posting_permission");
        r.setProperty("uid", String.valueOf(getUser().getId()));
        r.setProperty("pj", projectId);
        
        ResultSetContainer rsc = (ResultSetContainer) dAccess.getData(r).get("copilot_posting_permission");

         Iterator<ResultSetContainer.ResultSetRow> iterator = rsc.iterator();

        // check the result
        if (iterator.hasNext()) {
            ResultSetContainer.ResultSetRow row = iterator.next();
            int postingResources = row.getIntItem("copilot_posting_resources");
            int inCopilotPool = row.getIntItem("in_copilot_pool");
            int hasDirectProjectPermission = row.getIntItem("has_direct_project_permission");
            result[0] = postingResources > 0;
            result[1] = inCopilotPool > 0;
            result[2] = hasDirectProjectPermission > 0;

            return result;
        } else {
            // no records found, return all false
            return result;
        }
    }

    /**
     * Checks whether the user has registered the copilot posting.
     *
     * @param projectId the project id
     * @return true if user has registered, false otherwise
     * @throws Exception if there is any error
     *
     * @since version 1.5
     */
    private boolean isUserCopilotPostingRegistered(String projectId) throws Exception {
         // query
        DataAccessInt dAccess = new DataAccess(DBMS.TCS_OLTP_DATASOURCE_NAME);
        Request r = new Request();
        r.setContentHandle("is_copilot_posting_registered");
        r.setProperty("uid", String.valueOf(getUser().getId()));
        r.setProperty("pj", projectId);

        ResultSetContainer rsc = (ResultSetContainer) dAccess.getData(r).get("is_copilot_posting_registered");

        return !rsc.isEmpty();
    }
}
