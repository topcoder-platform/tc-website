/*
 * Copyright (C) 2004 - 2010 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.tc.controller.request.development;

import java.rmi.RemoteException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.ejb.CreateException;
import javax.ejb.EJBException;
import javax.naming.NamingException;

import com.topcoder.service.contest.eligibilityvalidation.ContestEligibilityValidatorException;
import com.topcoder.shared.dataAccess.DataAccess;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.security.Resource;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.CachedDataAccess;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.ShortHibernateProcessor;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.TCRequest;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.eligibility.ContestEligibilityServiceLocator;
import com.topcoder.web.common.model.SoftwareComponent;
import com.topcoder.web.ejb.project.Project;
import com.topcoder.web.ejb.project.ProjectLocal;
import com.topcoder.web.ejb.project.ProjectRoleTermsOfUse;
import com.topcoder.web.ejb.project.ProjectRoleTermsOfUseLocator;
import com.topcoder.web.ejb.termsofuse.TermsOfUse;
import com.topcoder.web.ejb.termsofuse.TermsOfUseEntity;
import com.topcoder.web.ejb.termsofuse.TermsOfUseLocator;
import com.topcoder.web.ejb.user.UserTermsOfUse;
import com.topcoder.web.ejb.user.UserTermsOfUseLocator;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.tc.controller.request.ReviewBoardHelper;

/**
 * <p>Added some code to make project related controllers more generic.</p>
 *
 * <p><b>Change Log:</b></p>
 *
 * <p>
 *   <table>
 *     <tr>
 *         <td>Version 1.1 (TCS Release 2.2.2)</td>
 *         <td>
 *           <ul>
 *             <li>Added support for Conceptualization, Specification and Application Testing project types.</li>
 *           </ul>
 *         </td>
 *     </tr>
 *     <tr>
 *         <td>Version 1.2 (Studio Coding In Online Review)</td>
 *         <td>
 *           <ul>
 *             <li>Added support for new UI Prototype, RIA Build and RIA Component competitions.</li>
 *           </ul>
 *         </td>
 *     </tr>
 *     <tr>
 *         <td>Version 1.3 (Testing Competition Split Release Assembly 1.0)</td>
 *         <td>
 *           <ul>
 *               <li>Updated Application Testing to Test Suites.</li>
 *               <li>Added support for new Test Scenarios competitions.</li>
 *           </ul>
 *         </td>
 *     </tr>
 *     <tr>
 *         <td>Version 1.4 (Configurable Contest Terms Release Assembly v1.0)</td>
 *         <td>
 *           <ul>
 *             <li>Added new functionality that asks for several terms of use and show those the user already agreed to.</li>
 *           </ul>
 *         </td>
 *     </tr>
 *     <tr>
 *         <td>Version 1.5 (Specification Review Integration 1.0)</td>
 *         <td>
 *           <ul>
 *             <li>Updated <code>isProjectTypeSupported</code> to support specification review projects.</li>
 *           </ul>
 *         </td>
 *     </tr>
 *     <tr>
 *         <td>Version 1.6 (Configurable Contest Terms Release Assembly v2.0)</td>
 *         <td>
 *           <ul>
 *             <li>Updated <code>processTermsOfUse</code> to set both agreed and pending terms in the request.</li>
 *              <li>Added sort order to displayed terms of use.</li>
 *           </ul>
 *         </td>
 *     </tr>
         <tr>
 *         <td>Version 1.6 (BUGR-2749)</td>
 *         <td>
 *           <ul>
 *             <li>Added constant to support reliability bonus column in active contests page.</li>
 *           </ul>
 *         </td>
 *     </tr>
         <tr>
 *         <td>Version 1.7 (Competition Registration Eligibility v1.0)</td>
 *         <td>
 *           <ul>
 *             <li>Added method to check for eligibility constraints.</li>
 *           </ul>
 *         </td>
 *     </tr>
          <tr>
 *         <td>Version 1.8 </td>
 *         <td>
 *           <ul>
 *             <li>Phase ID -> Resource Role ID mapping is now done via a query instead of hardcoding the values.</li>
 *           </ul>
 *         </td>
 *     </tr>
 *      <tr>
 *         <td>Version 1.9 (Copilot Selection Contest Online Review and TC Site Integration Assembly v1.0)</td>
 *         <td>
 *           <ul>
 *             <li>Added support for copilot posting.</li>
 *           </ul>
 *         </td>
 *     </tr>
 *      <tr>
 *         <td>Version 1.10 (Content Creation Contest Online Review and TC Site Integration Assembly 1.0)</td>
 *         <td>
 *           <ul>
 *             <li>Updated {@link #getProjectDetailPage(int)} method.</li>
 *             <li>Updated {@link #getRegistrantsCommandName(int)} method.</li>
 *             <li>Updated {@link #getProjectTypeId(com.topcoder.web.common.TCRequest)} method.</li>
 *           </ul>
 *         </td>
 *     </tr>
 *      <tr>
 *         <td>Version 1.11</td>
 *         <td>
 *           <ul>
 *             <li>Added checks for users being banned from having certain terms of use.</li>
 *           </ul>
 *         </td>
 *     </tr>
 *   </table>
 * </p>
 *
 * @author dok, isv, pulky, VolodymyrK, Blues, FireIce
 * @version 1.11
 */
public abstract class Base extends ShortHibernateProcessor {

    /**
     * Constant containing reliability bonus column index
     *
     * @since 1.6
     */
    protected static final String RELIABILITY_BONUS_COLUMN_INDEX = "99";

    /**
     * Constant containing submitter role id
     *
     * @since 1.3
     */
    protected static final int[] SUBMITTER_ROLE_IDS = new int[] {1};

    /**
     * Constant containing primary reviewer role ids
     *
     * Note: first item is just a placeholder. It will be filled with the corresponding review role id.
     * Note2: there is "similar" logic in RBoardApplicationBean. It is recommended to rewrite that method to be
     * able to extract the logic. Then, it should be possible to reuse it here.
     *
     * @since 1.3
     */
    protected static final int[] PRIMARY_ROLE_IDS = new int[] {0, 2, 8, 9};

    protected Logger log = Logger.getLogger(Base.class);

    protected int getProjectTypeId(long projectId) throws Exception {
        ProjectLocal pl = (ProjectLocal) createLocalEJB(getInitialContext(), Project.class);
        return pl.getProjectTypeId(projectId, DBMS.TCS_OLTP_DATASOURCE_NAME);
    }

    /**
     * <p>This method returns the page to show Project Details according to the project type.</p>
     *
     * @param projectTypeId an <code>int</code> referencing the requested project type.
     *
     * @return a <code>String</code> with the corresponding page path.
     */
    public static String getProjectDetailPage(int projectTypeId) {
        if (projectTypeId==Constants.DESIGN_PROJECT_TYPE) {
            return Constants.DESIGN_DETAIL;
        } else if (projectTypeId==Constants.DEVELOPMENT_PROJECT_TYPE) {
            return Constants.DEVELOPMENT_DETAIL;
        } else if (projectTypeId ==Constants.ASSEMBLY_PROJECT_TYPE) {
            return "/dev/assembly/projectDetail.jsp";
        } else if (projectTypeId==Constants.ARCHITECTURE_PROJECT_TYPE) {
            return "/architecture/projectDetail.jsp";
        } else if (projectTypeId==Constants.COMPONENT_TESTING_PROJECT_TYPE) {
            return "/dev/testing/projectDetail.jsp";
        } else if (projectTypeId==Constants.TEST_SUITES_PROJECT_TYPE) {
            return "/testsuites/projectDetail.jsp";
        } else if (projectTypeId==Constants.TEST_SCENARIOS_PROJECT_TYPE) {
            return "/testscenarios/projectDetail.jsp";
        } else if (projectTypeId==Constants.CONCEPTUALIZATION_PROJECT_TYPE) {
            return "/conceptualization/projectDetail.jsp";
        } else if (projectTypeId==Constants.SPECIFICATION_PROJECT_TYPE) {
            return "/specification/projectDetail.jsp";
        } else if (projectTypeId==Constants.UI_PROTOTYPE_PROJECT_TYPE) {
            return "/uiprototype/projectDetail.jsp";
        } else if (projectTypeId==Constants.RIA_BUILD_PROJECT_TYPE) {
            return "/riabuild/projectDetail.jsp";
        } else if (projectTypeId==Constants.RIA_COMPONENT_PROJECT_TYPE) {
            return "/riacomponent/projectDetail.jsp";
        } else if (projectTypeId==Constants.COPILOT_POSTING_PROJECT_TYPE) {
            return "/copilotposting/projectDetail.jsp";
        } else if (projectTypeId ==Constants.CONTENT_CREATION_PROJECT_TYPE) {
            return "/contentcreation/projectDetail.jsp";
        } else {
            return "";
        }
    }

    /**
     * <p>This method returns registrants command name according to the project type.</p>
     *
     * @param projectTypeId an <code>int</code> referencing the requested project type.
     *
     * @return a <code>String</code> with the corresponding command name.
     */
    public static String getRegistrantsCommandName(int projectTypeId) {
        if (projectTypeId == Constants.DESIGN_PROJECT_TYPE
            || projectTypeId == Constants.DEVELOPMENT_PROJECT_TYPE
            || projectTypeId == Constants.CONCEPTUALIZATION_PROJECT_TYPE
            || projectTypeId == Constants.SPECIFICATION_PROJECT_TYPE
            || projectTypeId == Constants.ARCHITECTURE_PROJECT_TYPE
            || projectTypeId == Constants.ASSEMBLY_PROJECT_TYPE
            || projectTypeId == Constants.TEST_SUITES_PROJECT_TYPE
            || projectTypeId == Constants.TEST_SCENARIOS_PROJECT_TYPE
            || projectTypeId == Constants.UI_PROTOTYPE_PROJECT_TYPE
            || projectTypeId == Constants.RIA_BUILD_PROJECT_TYPE
            || projectTypeId == Constants.RIA_COMPONENT_PROJECT_TYPE
            || projectTypeId == Constants.COPILOT_POSTING_PROJECT_TYPE
            || projectTypeId == Constants.CONTENT_CREATION_PROJECT_TYPE) {
            return "registrants";
        } else {
            return "contest_registrants";
        }
    }

    protected void dbProcessing() throws TCWebException {
        developmentProcessing();
    }

    public static ResultSetContainer getOpenProjects() throws Exception {
        Request dataRequest = null;
        Map<String, ResultSetContainer> resultMap = null;
        dataRequest = new Request();
        dataRequest.setContentHandle("open_projects");

        DataAccessInt dai = new DataAccess(DBMS.TCS_OLTP_DATASOURCE_NAME);

        resultMap = dai.getData(dataRequest);
        return (ResultSetContainer) resultMap.get("Retrieve open projects");
    }

    abstract protected void developmentProcessing() throws TCWebException;

    public DataAccessInt getDataAccess() throws Exception {
        return getDataAccess(DBMS.TCS_OLTP_DATASOURCE_NAME, false);
    }

    public DataAccessInt getDataAccess(boolean cached) throws Exception {
        return getDataAccess(DBMS.TCS_OLTP_DATASOURCE_NAME, cached);
    }

    public DataAccessInt getDataAccess(String datasource, boolean cached) throws Exception {
        if (datasource == null) return null;
        DataAccessInt dAccess = null;
        if (cached)
            dAccess = new CachedDataAccess(datasource);
        else
            dAccess = new DataAccess(datasource);
        return dAccess;
    }


    /**
     * Get the project type id from the request.  If the request contains the phase id, then use that
     * to figure out the project type id.
     * @param r the http request
     * @return the project type id or 0 if we could not find the necessary information in the request
     * @throws TCWebException if non null non number is passed for project type
     */
    /**
     * <p>This method infers the project type id from the request.</p>
     * <p>It will get the project type id from the request. If the request contains the phase id, then it will use
     *    that to figure out the project type id.</p>
     *
     * @param r an <code>TCRequest</code> containing the request.
     *
     * @return a <code>int</code> with the corresponding project type id. (a zero will be returned if it can't be found)
     * @throws TCWebException if the project type id parameter is not valid.
     */
    public static int getProjectTypeId(TCRequest r) throws TCWebException {
        int projectTypeId=0;
        if (!"".equals(StringUtils.checkNull(r.getParameter(Constants.PROJECT_TYPE_ID)))) {
            if (!StringUtils.isNumber(StringUtils.checkNull(r.getParameter(Constants.PROJECT_TYPE_ID)))) {
                throw new TCWebException("Invalid project_type_id (" + projectTypeId + ") parameter");
            } else {
                projectTypeId = Integer.parseInt(r.getParameter(Constants.PROJECT_TYPE_ID));
            }
        }
        if (projectTypeId == 0) {
            String phaseId = StringUtils.checkNull(r.getParameter(Constants.PHASE_ID));
            if (String.valueOf(SoftwareComponent.DESIGN_PHASE).equals(phaseId)) {
                projectTypeId = Constants.DESIGN_PROJECT_TYPE;
            } else if (String.valueOf(SoftwareComponent.DEV_PHASE).equals(phaseId)) {
                projectTypeId = Constants.DEVELOPMENT_PROJECT_TYPE;
            } else if (String.valueOf(SoftwareComponent.CONCEPTUALIZATION_PHASE).equals(phaseId)) {
                projectTypeId = Constants.CONCEPTUALIZATION_PROJECT_TYPE;
            } else if (String.valueOf(SoftwareComponent.SPECIFICATION_PHASE).equals(phaseId)) {
                projectTypeId = Constants.SPECIFICATION_PROJECT_TYPE;
            } else if (String.valueOf(SoftwareComponent.ARCHITECTURE_PHASE).equals(phaseId)) {
                projectTypeId = Constants.ARCHITECTURE_PROJECT_TYPE;
            } else if (String.valueOf(SoftwareComponent.ASSEMBLY_PHASE).equals(phaseId)) {
                projectTypeId = Constants.ASSEMBLY_PROJECT_TYPE;
            } else if (String.valueOf(SoftwareComponent.TEST_SUITES_PHASE).equals(phaseId)) {
                projectTypeId = Constants.TEST_SUITES_PROJECT_TYPE;
            } else if (String.valueOf(SoftwareComponent.TEST_SCENARIOS_PHASE).equals(phaseId)) {
                projectTypeId = Constants.TEST_SCENARIOS_PROJECT_TYPE;
            } else if (String.valueOf(SoftwareComponent.UI_PROTOTYPE_PHASE).equals(phaseId)) {
                projectTypeId = Constants.UI_PROTOTYPE_PROJECT_TYPE;
            } else if (String.valueOf(SoftwareComponent.RIA_BUILD_PHASE).equals(phaseId)) {
                projectTypeId = Constants.RIA_BUILD_PROJECT_TYPE;
            } else if (String.valueOf(SoftwareComponent.RIA_COMPONENT_PHASE).equals(phaseId)) {
                projectTypeId = Constants.RIA_COMPONENT_PROJECT_TYPE;
            } else if (String.valueOf(SoftwareComponent.COPILOT_POSTING_PHASE).equals(phaseId)) {
                projectTypeId = Constants.COPILOT_POSTING_PROJECT_TYPE;
            } else if (String.valueOf(SoftwareComponent.CONTENT_CREATION_PHASE).equals(phaseId)) {
                projectTypeId = Constants.CONTENT_CREATION_PROJECT_TYPE;
            }
        }
        return projectTypeId;

    }

    /**
     * <p>Checks whether the specified project type requested by client is currently supported by this controller
     * or not.</p>
     *
     * This method delegates to ReviewBoardHelper.isReviewBoardTypeSupported().
     *
     * @param projectType a <code>String</code> referencing the project type requested by client.
     * @return <code>true</code> if specified project type is supported; <code>false</code> otherwise.
     * @since TCS Release 2.2.0 (TCS-54), TCS Release 2.2.1 (TCS-57)
     */
    protected boolean isProjectTypeSupported(String projectType) {
        return ReviewBoardHelper.isReviewBoardTypeSupported(projectType);
    }

    /**
     * This helper method returns if the specified user is banned from accepting the specified terms of use.
     *
     * @param userId the user id that is requesting the registration
     * @param termsOfUseId the terms of use id the user agreed to
     * @throws NamingException if any errors occur during EJB lookup
     * @throws RemoteException if any errors occur during EJB remote invocation
     * @throws CreateException if any errors occur during EJB creation
     * @throws EJBException if any other errors occur while invoking EJB services
     *
     * @since 1.11
     */
    protected boolean hasTermsOfUseBan(long userId, long termsOfUseId)
            throws NamingException, RemoteException, CreateException, EJBException {

        UserTermsOfUse userTermsOfUse = UserTermsOfUseLocator.getService();
        return userTermsOfUse.hasTermsOfUseBan(userId, termsOfUseId, DBMS.COMMON_OLTP_DATASOURCE_NAME);
    }

    /**
     * This helper method will go create the user terms of use association for a given user id, terms of use id.
     *
     * @param userId the user id that is requesting the registration
     * @param termsOfUseId the terms of use id the user agreed to
     * @throws NamingException if any errors occur during EJB lookup
     * @throws RemoteException if any errors occur during EJB remote invocation
     * @throws CreateException if any errors occur during EJB creation
     * @throws EJBException if any other errors occur while invoking EJB services
     *
     * @since 1.3
     */
    protected void saveUserTermsOfUse(long userId, long termsOfUseId)
            throws NamingException, RemoteException, CreateException, EJBException {

        // check if the user agreed to all terms of use
        UserTermsOfUse userTermsOfUse = UserTermsOfUseLocator.getService();
        if (!userTermsOfUse.hasTermsOfUse(userId, termsOfUseId, DBMS.COMMON_OLTP_DATASOURCE_NAME)) {
            userTermsOfUse.createUserTermsOfUse(userId, termsOfUseId, DBMS.COMMON_OLTP_DATASOURCE_NAME);
        }
    }

    /**
     * This helper method will go through all required terms of use and check whether the user has agreed to
     * them or not. Both lists will be added to the request so that the user can review the terms he agreed to
     * and agree to those he has pending.
     *
     * @param projectId the project id the user is registering to
     * @param userId the user id that is requesting the registration
     *
     * @return true if the user has pending terms to agree to
     *
     * @throws NamingException if any errors occur during EJB lookup
     * @throws RemoteException if any errors occur during EJB remote invocation
     * @throws CreateException if any errors occur during EJB creation
     * @throws EJBException if any other errors occur while invoking EJB services
     *
     * @since 1.3
     */
    protected boolean processTermsOfUse(String projectId, long userId, int[] roleIds, long currentTermsId)
            throws NamingException, RemoteException, CreateException, EJBException {

        // check if the user agreed to all terms of use
        ProjectRoleTermsOfUse projectRoleTermsOfUse = ProjectRoleTermsOfUseLocator.getService();
        UserTermsOfUse userTermsOfUse = UserTermsOfUseLocator.getService();
        TermsOfUse termsOfUse = TermsOfUseLocator.getService();

        // validate that new resources have agreed to the necessary terms of use
        List<Long>[] necessaryTerms = projectRoleTermsOfUse.getTermsOfUse(Integer.parseInt(projectId),
                roleIds, DBMS.COMMON_OLTP_DATASOURCE_NAME);

        List<TermsOfUseEntity> termsAgreed = new ArrayList<TermsOfUseEntity>();
        List<TermsOfUseEntity> termsAgreedGlobal = new ArrayList<TermsOfUseEntity>();
        List<TermsOfUseEntity> termsPending = new ArrayList<TermsOfUseEntity>();


        TermsOfUseEntity currentTerms = null;
        boolean exit = false;
        for (int i = 0; i < necessaryTerms.length && !exit; i++) {
            if (necessaryTerms[i] != null) {
                for (int j = 0; j < necessaryTerms[i].size(); j++) {
                    Long termsId = necessaryTerms[i].get(j);

                    // get terms of use
                    TermsOfUseEntity terms =  termsOfUse.getEntity(termsId, DBMS.COMMON_OLTP_DATASOURCE_NAME);

                    // check if the user has this terms
                    if (!userTermsOfUse.hasTermsOfUse(userId, termsId, DBMS.COMMON_OLTP_DATASOURCE_NAME)) {
                        termsPending.add(terms);
                        if (termsId.equals(currentTermsId)) {
                            currentTerms = terms;
                        }
                    } else {
                        termsAgreed.add(terms);
                        termsAgreedGlobal.add(terms);
                    }

                }
                if (currentTerms != null) {
                    getRequest().setAttribute(Constants.TERMS, currentTerms);
                    return true;
                } else if (termsPending.size() > 0) {
                    getRequest().setAttribute(Constants.TERMS_AGREED, termsAgreed);
                    getRequest().setAttribute(Constants.TERMS_PENDING, termsPending);
                    return true;
                }
            }
        }

        // if everything is ok, show summary with captcha
        getRequest().setAttribute(Constants.TERMS_AGREED, termsAgreedGlobal);
        getRequest().setAttribute(Constants.TERMS_PENDING, new ArrayList<TermsOfUseEntity>());

        return false;
    }

    /**
     * This helper method will get resource role id based on the review type id.
     *
     * @param reviewTypeId the review type id
     * @return <code>int</code> with the role ids
     */
    protected int getResourceRoleId(int reviewRespId) throws TCWebException, Exception {

        Request r = new Request();
        ResultSetContainer detail=null;

        r.setContentHandle("resource_role_by_review_resp");
        r.setProperty(Constants.REVIEW_RESP_ID, String.valueOf(reviewRespId));
        Map results = getDataAccess().getData(r);
        if (results == null || results.size() == 0) {
            throw new TCWebException("Invalid review response ID.");
        }

        detail = (ResultSetContainer) results.get("resource_role_by_review_resp");

        if (detail != null && !detail.isEmpty()) {
            return detail.getIntItem(0, "resource_role_id");
        }
        throw new TCWebException("Invalid review response ID.");
    }

    /**
     * This helper method will get resource role ids based on the review type id and primary flag.
     *
     * @param reviewTypeId the review type id
     * @param primary if the position is a primary review position
     * @return <code>int[]</code> with the role ids
     */
    protected int[] getResourceRoleIds(int reviewTypeId, boolean primary) throws TCWebException, Exception {
        int[] roleIds;

        if (primary) {
            roleIds = Base.PRIMARY_ROLE_IDS;
        } else {
            roleIds = new int[1];
        }

        roleIds[0] = getResourceRoleId(reviewTypeId);
        return roleIds;
    }

    /**
     * <p>Checks whether the specified project type requested by client is currently supported by this controller
     * or not.</p>
     *
     * This method delegates to ReviewBoardHelper.isReviewBoardTypeSupported().
     *
     * @param projectType a <code>String</code> referencing the project type requested by client.
     * @param includeSpecificationReviews a <code>boolean</code> specifying if specification review projects should
     * be included in the supported types for the validation.
     *
     * @return <code>true</code> if specified project type is supported; <code>false</code> otherwise.
     * @since 1.4
     */
    protected boolean isProjectTypeSupported(String projectType, boolean includeSpecificationReviews) {
        return ReviewBoardHelper.isReviewBoardTypeSupported(projectType, includeSpecificationReviews);
    }

    /**
     * This method will check eligibility constraints for a particular project.
     * It will first test if the user is logged in, and in this case it will call directly the isEligible service.
     * If the user is not logged in, it will ask for login only if the project has an eligibility constraint.
     *
     * @param pid the project id (string representation) to check for
     * @param r the resource that is asking for login
     *
     * @return true if the user can see this project, false otherwise
     *
     * @throws TCWebException if any error occurs during service call or if parameters are invalid
     * @throws PermissionException if the user is not logged in and the project has eligibility constraints
     *
     * @since 1.7
     */
    protected int checkEligibilityConstraints(String projectId, Resource r) throws TCWebException, PermissionException {
        if (projectId == null) {
            throw new TCWebException("parameter " + Constants.PROJECT_ID + " invalid.");
        }

        long pid;
        try {
            pid = Long.parseLong(projectId);
        } catch (NumberFormatException nfe) {
            throw new TCWebException("parameter " + Constants.PROJECT_ID + " invalid.");
        }

        return checkEligibilityConstraints(pid, r);
    }

    /**
     * This method will check eligibility constraints for a particular project.
     * It will first test if the user is logged in, and in this case it will call directly the isEligible service.
     * If the user is not logged in, it will ask for login only if the project has an eligibility constraint.
     *
     * @param pid the project id to check for
     * @param r the resource that is asking for login
     *
     * @return 0 if eligible, otherwise return the group id (we only have group eligibility now) which the user is not in
     *
     * @throws TCWebException if any error occurs during service call or if parameters are invalid
     * @throws PermissionException if the user is not logged in and the project has eligibility constraints
     *
     * @since 1.7
     */
    protected int checkEligibilityConstraints(long pid, Resource r) throws TCWebException, PermissionException {
        if (r == null) {
            throw new TCWebException("Invalid resource checking eligibility.");
        }

        // if the user is logged in, check eligibility
        // We have issue with tc calling cockpit ejb due to jboss version, use query tool for now
        try {
            if (userLoggedIn()) {
                return isEligible(getLoggedInUser().getId(), pid);
            } else {
                // otherwise, if this project has any eligibility constraint, ask for login
                //if (ContestEligibilityServiceLocator.getServices().hasEligibility(pid, false)) {
                if (hasEligibility(pid)) {
                    throw new PermissionException(getUser(), r);
                }
            }
            return 0;
        } catch (PermissionException pe) {
            throw pe;
        } catch (Exception e) {
            throw new TCWebException("Failed to retrieve eligibility constraints information.", e);
        }
    }

    protected boolean hasEligibility(long pid) throws Exception
    {
        Request r = new Request();
        ResultSetContainer detail=null;

         r.setContentHandle("has_eligibility");
         r.setProperty(Constants.PROJECT_ID, String.valueOf(pid));
         Map results = getDataAccess().getData(r);
         if (results == null || results.size() == 0)
         {
             return false;
         }

         detail = (ResultSetContainer) results.get("has_eligibility");

         if (detail != null && !detail.isEmpty()
              && detail.getStringItem(0, "has_eligibility") != null
              && !detail.getStringItem(0, "has_eligibility").equals(""))
         {
             return true;
         }
         return false;
    }

    /**
     * This method will check if user is eligible for a contest
     *
     * @param pid the project id to check for
     * @param r the resource that is asking for login
     *
     * @return 0 if eligible, otherwise return the group id (we only have group eligibility now) which the user is not in
     *
     * @throws TCWebException if any error occurs during service call or if parameters are invalid
     * @throws PermissionException if the user is not logged in and the project has eligibility constraints
     *
     * @since 1.7
     */
    protected int isEligible(long userId, long pid) throws Exception
    {
        Request r = new Request();
        ResultSetContainer detail=null;

         r.setContentHandle("is_eligible");
         r.setProperty(Constants.PROJECT_ID, String.valueOf(pid));
         r.setProperty(Constants.USER_ID, String.valueOf(userId));
         Map results = getDataAccess().getData(r);

         detail = (ResultSetContainer) results.get("is_eligible");

        detail = (ResultSetContainer) results.get("is_eligible");

         // only happen if pid does not exist
         if (detail == null || detail.isEmpty())
         {
             return -1;
         }

         // if contest has not eligibility, return 0
         if (detail.getStringItem(0, "contest_eligibility_id") == null
                || detail.getStringItem(0, "contest_eligibility_id").equals(""))
         {
             return 0;
         }

         // if user in the group, return 0
         if (detail.getStringItem(0, "login_id") != null
                && !detail.getStringItem(0, "login_id").equals(""))
         {
             return 0;
         }


         return detail.getIntItem(0, "group_id");
    }
}
