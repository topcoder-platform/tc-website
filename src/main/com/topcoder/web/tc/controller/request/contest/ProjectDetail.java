/*
 * Copyright (C) 2004 - 2013 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.tc.controller.request.contest;

import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.ArrayList;
import java.util.List;

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
import com.topcoder.web.ejb.ComponentRegistrationServices.ComponentRegistrationServices;
import com.topcoder.web.ejb.ComponentRegistrationServices.ComponentRegistrationServicesLocal;


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
 * <p>
 *   Version 1.6 (Release Assembly - TopCoder Software Contest Detail Page Update) Change notes:
 *   <ol>
 *     <li>Added {@link #getProjectOverview(String)}, {@link #getCheckpointInfo(String)}, and
 *     {@link #getProjectResult(String)} to retrieve information for different parts of the page.</li>
 *     <li>Modified {@link #developmentProcessing()} to invoke the new methods to populate data into page.</li>
 *   </ol>
 * </p>
 *
 * <p>
 *   Version 1.7 (Release Assembly - TopCoder Software Contest Detail Page Bug Fix Release) Change notes:
 *   <ol>
 *     <li>Added a new field regServices to check the user is registered for a project.</li>
 *     <li>Modified {@link #developmentProcessing()} to add tabIndex to the request parameter.</li>
 *     <li>Modified {@link #getProjectOverview()} to add submissionPhaseOpen to the request parameter.</li>
 *   </ol>
 * </p>
 * 
 * <p>
 * Version 1.8 (BUGR-8095 - New General Competition Rules section for Contest Detail Page) Change notes:
 *   <ol>
 *     <li>Modified {@link #getProjectOverview(String)} to add some new rules in contest detail page.</li>
 *   </ol>
 * </p>
 * 
 * @author dok, pulky, romanoTC, Blues, duxiaoyang, TCSASSEBMLER, notpad
 * @version 1.8
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

    private static final long BUDGET_EXTRA_INFO_TYPE_ID = 1L;
    
    private static final long OTHER_EXPERIENCE_EXTRA_INFO_TYPE_ID = 2L;
    /**
     * The service to check whether the user is registered or not.
     * @since 1.7
     */
    private ComponentRegistrationServicesLocal regServices = null;

    /**
     * This method executes the actual logic for this processor.
     * Changes in version 1.7: add tabIndex to the request parameter.
     *
     * @throws TCWebException if any error occurs
     * @see com.topcoder.web.tc.controller.request.development.Base#developmentProcessing()
     */
    protected void developmentProcessing() throws TCWebException {
        try {
            String projectId = StringUtils.checkNull(getRequest().getParameter(Constants.PROJECT_ID));
            getRequest().setAttribute("projectId", Long.parseLong(projectId));

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
            String tabIndex = getRequest().getParameter(Constants.TAB_INDEX);
            if((null == tabIndex) || (!tabIndex.equals("checkpoint") && !tabIndex.equals("results"))) {
                tabIndex = "overview";
            }
            getRequest().setAttribute("tabIndex", tabIndex);

            // get project overview
            getProjectOverview(projectId);

            // get checkpoint information
            getCheckpointInfo(projectId);

            // get project result information
            getProjectResult(projectId);

            setNextPage("/contest/projectDetail.jsp");
            setIsNextPageInContext(true);
        } catch (TCWebException e) {
            throw e;
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }

    /**
     * <p>
     * Gets project overview information and add it to request.
     * </p>
     * Changes in version 1.7: add submissionPhaseOpen to the request parameter.
     * @param projectId
     *            the id of the project.
     * @throws TCWebException
     *             if any error occurs.
     */
    private void getProjectOverview(String projectId) throws TCWebException {
        try {
            Request r = new Request();
            r.setContentHandle("project_detail_v2");
            r.setProperty(Constants.PROJECT_ID, projectId);

            Map<String, ResultSetContainer> resultMap = getDataAccess().getData(r);

            ResultSetContainer details = resultMap.get("project_detail_v2");
            ResultSetContainer docs = resultMap.get("project_docs");

            if (details.isEmpty()) {
                throw new NavigationException("Could not find project information.");
            }

            long projectTypeId = details.getLongItem(0, "project_category_id");
            long projectStatusId = details.getLongItem(0, "project_status_id");
            getRequest().setAttribute("leftNav", getLeftNav((int) projectTypeId, (int) projectStatusId));

            if (projectTypeId == -1) {
                throw new TCWebException("Could not find project information.");
            }

            if (projectTypeId == Constants.COPILOT_POSTING_PROJECT_TYPE) {
                try {
                    // check the permission to view project details for copilot posting
                    boolean[] permissions = getPermissionsToViewCopilotPosting(projectId);

                    // if user is anonymous, throw exception
                    if (getSessionInfo().isAnonymous()) {
                        throw new NavigationException(
                                "Anonymous User does not has permission to view copilot posting details");
                    }

                    // check permission to view private description
                    boolean registered = isUserCopilotPostingRegistered(projectId);

                    boolean hasPrivateDescriptionPermission = registered || permissions[0] || permissions[2]
                            || getSessionInfo().isAdmin();

                    List<String> copilotPostingTypes = retrieveCopilotPostingTypes(projectId);
                    boolean marathonMatchCopilotPosting = copilotPostingTypes.contains("Marathon Match");

                    boolean registerButton = hasPrivateDescriptionPermission || permissions[1]
                            || marathonMatchCopilotPosting;

                    getRequest().setAttribute("privateDescriptionPermission", hasPrivateDescriptionPermission);
                    getRequest().setAttribute("registerButton", registerButton);

                } catch (NavigationException navigationEx) {
                    throw navigationEx;
                } catch (Exception ex) {
                    throw new TCWebException("Exception raised when getting copilot posting permissions", ex);
                }
            }

            // determine the submission phase is open or not
            getRequest().setAttribute("submissionPhaseOpen", Boolean.TRUE);
            String submissionPhaseOpened= details.getStringItem(0, "submission_phase_opened");
            if("closed".equals(submissionPhaseOpened.trim())) {
                getRequest().setAttribute("submissionPhaseOpen", Boolean.FALSE);
            }
            String projectCategory = details.getStringItem(0, "project_category_name");
            if (projectCategory.contains("Competition")) {
                projectCategory = projectCategory.substring(0, projectCategory.indexOf("Competition") - 1);
            }
            getRequest().setAttribute("projectCategory", projectCategory);
            getRequest().setAttribute("projectTypeId", projectTypeId);
            getRequest().setAttribute("projectDetail", details);
            getRequest().setAttribute("technologies", resultMap.get("project_technologies"));
            getRequest().setAttribute("requirements", resultMap.get("project_requirements"));
            getRequest().setAttribute("supportingDocs", docs);

            Long categoryId = details.getLongItem(0, "project_category_id");
            Long rootCategoryId = details.getLongItem(0, "root_category_id");

            getRequest().setAttribute("instructionsLinks", getInstructionLinks(docs, categoryId, rootCategoryId));
            getRequest().setAttribute("canDownloadDocuments", canDownloadDocuments(docs, Long.parseLong(projectId)));

            boolean full = false; // projects are never full in our current rules
            getRequest().setAttribute("projectFull", String.valueOf(full));
            getRequest().setAttribute("projectId", projectId);

            getRequest().setAttribute("paysRoyalties", !details.getBooleanItem(0, "is_custom"));

            ReliabilityBonusCalculator reliabilityBonus = ReliabilityBonusCalculator.getInstance();
            Double firstPlacePrize = details.getDoubleItem(0, "total_payment");
            Date postingDate = details.getTimestampItem(0, "posting_date");
            Boolean reliabilityBonuseEligible = details.getBooleanItem(0, "reliability_bonus_eligible");
            getRequest().setAttribute("maxReliabilityBonus",
                    reliabilityBonuseEligible ?
                    reliabilityBonus.getReliabilityPercent(1.0, postingDate, categoryId) * firstPlacePrize : 
                    0.0);
            getRequest().setAttribute("hasDR",
                    details.getItem(0, "dr_points").getResultData() != null && details.getIntItem(0, "dr_points") > 0);
            getRequest().setAttribute("hasCheckpoint",
                    details.getItem(0, "milestone_submission_date").getResultData() != null);
            getRequest().setAttribute("hasFinalReview",
                    details.getItem(0, "final_review_start_date").getResultData() != null);
            getRequest().setAttribute("hasApproval",
                    details.getItem(0, "final_approval_start_date").getResultData() != null);
            getRequest().setAttribute("checkpointReviewFinished",
                    details.getItem(0, "milestone_review_status").getResultData() != null &&
                    details.getIntItem(0, "milestone_review_status") == 3);

            // set experiences and budget
            if (projectTypeId == Constants.COPILOT_POSTING_PROJECT_TYPE) {
                getRequest().setAttribute("isCopilotPosting", true);
                List<String> experiences = retrieveCopilotExperiences(projectId);

                String extraExp = retrieveCopilotExtraInfo(OTHER_EXPERIENCE_EXTRA_INFO_TYPE_ID, projectId);
                if (extraExp != null) {
                    experiences.add(extraExp);
                }
                getRequest().setAttribute("experiences", experiences);

                String budget = retrieveCopilotExtraInfo(BUDGET_EXTRA_INFO_TYPE_ID, projectId);
                if (budget == null) {
                    budget = "Don't have a budget yet.";
                } else {
                    budget = "$ " + budget;
                }
                getRequest().setAttribute("budgetText", budget);
            } else {
                getRequest().setAttribute("isCopilotPosting", false);
            }
            
            // New General Competition Rules section for Contest Detail Page
            boolean isCCARequired = details.getItem(0, "is_cca_required").getResultData() != null && details.getBooleanItem(0, "is_cca_required");
            getRequest().setAttribute("isCCARequired", isCCARequired);
            int supportDays = 30;  // default support days
            if (projectTypeId == Constants.ARCHITECTURE_PROJECT_TYPE) {
                supportDays = 90;
            }
            getRequest().setAttribute("supportDays", supportDays);
        } catch (TCWebException e) {
            throw e;
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }

    /**
     * <p>
     * Gets checkpoint information and add it to request.
     * </p>
     * @param projectId
     *            the id of the project.
     * @throws TCWebException
     *             if any error occurs.
     */
    private void getCheckpointInfo(String projectId) throws TCWebException {
        try {
            Request r = new Request();
            r.setContentHandle("milestone_info");
            r.setProperty(Constants.PROJECT_ID, projectId);
            DataAccessInt dai = getDataAccess();
            Map checkpointInfo = dai.getData(r);

            ResultSetContainer checkpoints = (ResultSetContainer) checkpointInfo.get("milestone_info");
            getRequest().setAttribute("checkpoints", checkpoints);
        } catch (TCWebException e) {
            throw e;
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }

    /**
     * <p>
     * Gets project result information and add it to request.
     * </p>
     * @param projectId
     *            the id of the project.
     * @throws TCWebException
     *             if any error occurs.
     */
    private void getProjectResult(String projectId) throws TCWebException {
        try {
            Request r = new Request();
            r.setContentHandle("comp_contest_details");
            r.setProperty(Constants.PROJECT_ID, projectId);
            DataAccessInt dai = getDataWarehouseDataAccess();
            Map contestResult = dai.getData(r);

            ResultSetContainer projectInfo = (ResultSetContainer) contestResult.get("project_info");
            if (projectInfo.size() == 0
                    || ((projectInfo.getIntItem(0, "status_id") != 4) && (projectInfo.getIntItem(0, "status_id") != 5) && (projectInfo
                            .getIntItem(0, "status_id") != 7))) {
                getRequest().setAttribute("resultAvailable", false);
                getRequest().setAttribute("resultMap", new HashMap());
                getRequest().setAttribute("isComplete", Boolean.FALSE);
            } else {
                getRequest().setAttribute("resultAvailable", true);
                getRequest().setAttribute("resultMap", contestResult);

                // check if there is a completed or suspended version of the component
                Request rp = new Request();
                rp.setContentHandle("find_projects");

                // Find all the projects that match with the component id, version and phase
                rp.setProperty("compid", projectInfo.getStringItem(0, "component_id"));
                rp.setProperty("vr", projectInfo.getStringItem(0, "version_id"));
                rp.setProperty(Constants.PHASE_ID, projectInfo.getStringItem(0, "phase_id"));

                Map result = dai.getData(rp);
                ResultSetContainer dates = (ResultSetContainer) result.get("find_projects");
                boolean isComplete = false;
                for (int i = 0; i < dates.size() && !isComplete; i++) {
                    if (dates.getIntItem(i, "status_id") == 7 || dates.getIntItem(i, "suspended_ind") == 1) {
                        isComplete = true;
                    }
                }
                getRequest().setAttribute("isComplete", new Boolean(isComplete));
            }
        } catch (TCWebException e) {
            throw e;
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }

    /**
     * <p>
     * Gets the node name for left navigation menu.
     * </p>
     * Changes in version 1.7: add projectStatusId parameter.
     * @param projectTypeId
     *            the project type id.
     * @param projectStatusId
     *            the project status id.
     * @return the node name for the specified project type.
     */
    private String getLeftNav(int projectTypeId, int projectStatusId) {
        boolean isPasProject = false;
        if((4 == projectStatusId) || (5 == projectStatusId) || (6 == projectStatusId) || (7 == projectStatusId)
            || (8 == projectStatusId) || (9 == projectStatusId) || (10 == projectStatusId) || (11 == projectStatusId)) {
            isPasProject = true;
        }
        switch (projectTypeId) {
        case 1:
            return isPasProject ? "des_past" : "des_compete";
        case 2:
            return isPasProject ? "dev_past" : "dev_compete";
        case 6:
            return isPasProject ? "specification_past" : "specification_compete";
        case 7:
            return isPasProject ? "architecture_past" : "architecture_compete";
        case 9:
            return isPasProject ? "bug_hunt_past" : "bug_hunt_compete";
        case 13:
            return isPasProject ? "test_suites_past" : "test_suites_compete";
        case 14:
            return isPasProject ? "assembly_past" : "assembly_compete";
        case 19:
            return isPasProject ? "ui_prototype_past" : "ui_prototype_compete";
        case 23:
            return isPasProject ? "conceptualization_past" : "conceptualization_compete";
        case 24:
            return isPasProject ? "ria_build_past" : "ria_build_compete";
        case 26:
            return isPasProject ? "test_scenarios_past" : "test_scenarios_compete";
        case 29:
            return isPasProject ? "copilot_past" : "copilots_compete";
        case 35:
            return isPasProject ? "content_creation_past" : "content_creation_compete";
        case 36:
            return isPasProject ? "reporting_past" : "reporting_compete";
        default:
            return "competition_home";
        }
    }

    /**
     * <p>
     * Returns true if the current user is authorized download the documents.
     * </p>
     * Changes in version 1.7: add a parameter projectId and return false if the user is not admin and not registered.
     *
     * @param docs the project documents list.
     * @param projectId the project id
     * @return true if the current user is authorized to download the documents and false otherwise.
     */
    private boolean canDownloadDocuments(ResultSetContainer docs, long projectId) throws Exception {
        if (regServices == null) {
            regServices = (ComponentRegistrationServicesLocal) createLocalEJB(getInitialContext(),
                    ComponentRegistrationServices.class);
        }
       
        // If there are no documents just return true.
        if ((docs == null) || (docs.size() == 0)) {
            return true;
        }

        // Check only the first document in the list since the answer would be the same fo all of them.
        for (ResultSetContainer.ResultSetRow row : docs) {
            String docId = row.getMap().get("document_id").toString();
            return canDownloadDocument(docId);
        }

        return false;
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
    
    private String retrieveCopilotExtraInfo(long extraId, String projectId) throws Exception {
        DataAccessInt dAccess = new DataAccess(DBMS.TCS_OLTP_DATASOURCE_NAME);
        Request r = new Request();
        r.setContentHandle("copilot_contest_extra_info");
        r.setProperty("extraId", String.valueOf(extraId));
        r.setProperty("pj", projectId);
        
        ResultSetContainer rsc = (ResultSetContainer) dAccess.getData(r).get("copilot_contest_extra_info");
        Iterator<ResultSetContainer.ResultSetRow> iterator = rsc.iterator();

        // check the result
        if (iterator.hasNext()) {
            ResultSetContainer.ResultSetRow row = iterator.next();
            return row.getStringItem("value");
        } else {
            // no records found, return null
            return null;
        }
    }

    private List<String> retrieveCopilotPostingTypes(String projectId) throws Exception {
        DataAccessInt dAccess = new DataAccess(DBMS.TCS_OLTP_DATASOURCE_NAME);
        Request r = new Request();
        r.setContentHandle("copilot_posting_type");
        r.setProperty("pj", projectId);
        
        ResultSetContainer rsc = (ResultSetContainer) dAccess.getData(r).get("copilot_posting_type");
        Iterator<ResultSetContainer.ResultSetRow> iterator = rsc.iterator();

        // check the result
        List<String> ret = new ArrayList<String>();
        while (iterator.hasNext()) {
            ResultSetContainer.ResultSetRow row = iterator.next();
            ret.add(row.getStringItem("value"));
        }
        return ret;
    }
    
    private List<String> retrieveCopilotExperiences(String projectId) throws Exception {
        List<String> ret = new ArrayList<String>();
        
        DataAccessInt dAccess = new DataAccess(DBMS.TCS_OLTP_DATASOURCE_NAME);
        Request r = new Request();
        r.setContentHandle("copilot_contest_experiences");
        r.setProperty("pj", projectId);
        
        ResultSetContainer rsc = (ResultSetContainer) dAccess.getData(r).get("copilot_contest_experiences");
        Iterator<ResultSetContainer.ResultSetRow> iterator = rsc.iterator();    
        
        while (iterator.hasNext()) {
            ResultSetContainer.ResultSetRow row = iterator.next();
            
            ret.add(row.getStringItem("name"));
        }
        
        return ret;
    }
}
