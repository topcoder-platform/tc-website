/*
 * Copyright (C) 2004 - 2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.tc.controller.request.development;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.cronos.termsofuse.dao.ProjectTermsOfUseDao;
import com.cronos.termsofuse.dao.TermsOfUseDao;
import com.cronos.termsofuse.dao.UserTermsOfUseDao;
import com.cronos.termsofuse.dao.impl.ProjectTermsOfUseDaoImpl;
import com.cronos.termsofuse.dao.impl.TermsOfUseDaoImpl;
import com.cronos.termsofuse.dao.impl.UserTermsOfUseDaoImpl;
import com.cronos.termsofuse.model.TermsOfUse;
import com.topcoder.configuration.ConfigurationObject;
import com.topcoder.configuration.persistence.ConfigurationFileManager;
import com.topcoder.shared.dataAccess.DataAccess;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.security.Resource;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.CachedDataAccess;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.ShortHibernateProcessor;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.TCRequest;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.model.SoftwareComponent;
import com.topcoder.web.ejb.project.Project;
import com.topcoder.web.ejb.project.ProjectLocal;
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
 *     <tr>
 *         <td>Version 1.12 (Add Reporting Contest Type)</td>
 *         <td>
 *           <ul>
 *             <li>Updated {@link #getProjectDetailPage(int)} method.</li>
 *             <li>Updated {@link #getRegistrantsCommandName(int)} method.</li>
 *             <li>Updated {@link #getProjectTypeId(com.topcoder.web.common.TCRequest)} method.</li>
 *           </ul>
 *         </td>
 *     </tr>
 *     <tr>
 *         <td>Version 1.13 (TopCoder Terms of Use Management Refactoring v1.0)</td>
 *         <td>
 *           <ul>
 *             <li>Added {@link #getTermsOfUseDao()} to the terms of use DAO instance.</li>
 *             <li>Added {@link #getUserTermsOfUseDao()} to the user terms of use DAO instance.</li>
 *             <li>Added {@link #getProjectTermsOfUseDao()} to the project terms of use DAO instance.</li>
 *             <li>Updated to use Terms of Use DAO component instead of Terms of Use EJB.</li>
 *             <li>Added {@link #hasPrePendingTerm(String)} method to check whether the user has pre-pending
 *             dependent term need to agree.</li>
 *             <li>Updated {@link #processTermsOfUse(String, long, int[], long)} method to handle the new logic to terms of user agreement.</li>
 *           </ul>
 *         </td>
 *     </tr>

 *   </table>
 * </p>
 *
 * @author dok, isv, pulky, VolodymyrK, Blues, FireIce, lmmortal, TCSASSEMBER
 * @version 1.13
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

    /**
     * The <code>TermsOfUseDao</code> instance.
     * 
     * @since 1.13
     */
    private TermsOfUseDao termsOfUseDao = null;
    
    /**
     * The <code>UserTermsOfUseDao</code> instance.
     * 
     * @since 1.13
     */
    private UserTermsOfUseDao userTermsOfUseDao = null;
    
    /**
     * The <code>ProjectTermsOfUseDao</code> instance.
     * 
     * @since 1.13
     */
    private ProjectTermsOfUseDao projectTermsOfUseDao = null;
    
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
        } else if (projectTypeId ==Constants.REPORTING_PROJECT_TYPE) {
            return "/reporting/projectDetail.jsp";
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
            || projectTypeId == Constants.CONTENT_CREATION_PROJECT_TYPE
            || projectTypeId == Constants.REPORTING_PROJECT_TYPE) {
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
            } else if (String.valueOf(SoftwareComponent.REPORTING_PHASE).equals(phaseId)) {
                projectTypeId = Constants.REPORTING_PROJECT_TYPE;
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
     * @throws Exception if any error occurs
     *
     * @since 1.11
     */
    protected boolean hasTermsOfUseBan(long userId, long termsOfUseId)
            throws Exception {

        UserTermsOfUseDao userTermsOfUseDao = getUserTermsOfUseDao();
        return userTermsOfUseDao.hasTermsOfUseBan(userId, termsOfUseId);
    }

    /**
     * This helper method will go create the user terms of use association for a given user id, terms of use id.
     *
     * @param userId the user id that is requesting the registration
     * @param termsOfUseId the terms of use id the user agreed to
     * @throws Exception if any error occurs
     *
     * @since 1.3
     */
    protected void saveUserTermsOfUse(long userId, long termsOfUseId)
            throws Exception {

        // check if the user agreed to all terms of use
        UserTermsOfUseDao userTermsOfUseDao = getUserTermsOfUseDao();
        TermsOfUseDao termsOfUseDao = getTermsOfUseDao();
        TermsOfUse nt = termsOfUseDao.getTermsOfUse(termsOfUseId);
        if (nt.getAgreeabilityType().getTermsOfUseAgreeabilityTypeId() != Constants.ELEC_AGREEABLE_TERMS_TYPE_ID) {
            throw new NavigationException("This terms of use is not electronically agreeable.");
        }
        if (!userTermsOfUseDao.hasTermsOfUse(userId, termsOfUseId)) {
            List<TermsOfUse> depTermsOfUses = termsOfUseDao.getDependencyTermsOfUse(termsOfUseId);
            for (TermsOfUse term : depTermsOfUses) {
                if (!userTermsOfUseDao.hasTermsOfUse(userId, term.getTermsOfUseId())) {
                    throw new NavigationException("You can not agree this terms of use because some dependency terms of use have not been agreed.");
                }
            }
            userTermsOfUseDao.createUserTermsOfUse(userId, termsOfUseId);
        }
    }
    
    /**
     * Checks whether a terms group is non-agreeable.
     * 
     * @param terms the terms group
     * @return true if the terms group is non-agreeable, false otherwise
     * @since 1.13
     */
    private static boolean isNonAgreeableTOUGroup(List<TermsOfUse> terms) {
        for (TermsOfUse term : terms) {
            if (term.getAgreeabilityType().getTermsOfUseAgreeabilityTypeId() == Constants.NON_AGREEABLE_TERMS_TYPE_ID) {
                return true;
            }
        }
        return false;
    }
    
    /**
     * Process a terms of use for a specified project and role.
     * 
     * @param termsGroup the terms groups of the specified project and role
     * @param userId the id of current user
     * @param termsStatus a map used to get the terms status, the key is the ID of the terms, the value is a flag
     *        indicates whether user has agreed on the terms
     * @param allTerms a map used to get all the terms in the group, the key is the ID of the terms, the value is
     *        the terms instance 
     * @param agreeableTOUGroup a <code>List</code> used to get all the agreeable terms group in the provided terms groups
     * @param groupTermsHasAgreed a <code>List<code> used to get the status that whether the user has agreed on the terms group
     * @return the terms group which user has agreed, if no terms group has been agreed, null will return
     * @throws Exception if any error occurs
     * @since 1.13
     */
    private List<TermsOfUse> processTermsOfUse(Map<Integer, List<TermsOfUse>> termsGroup, long userId, Map<Long, Boolean> termsStatus, Map<Long, TermsOfUse> allTerms,
            List<List<TermsOfUse>> agreeableTOUGroup, List<Boolean> groupTermsHasAgreed)
        throws Exception {
        
        UserTermsOfUseDao userTermsOfUseDao = getUserTermsOfUseDao();
        
        // the group which user has agreed
        List<TermsOfUse> allAgreedGroup = null;
        for (Map.Entry<Integer, List<TermsOfUse>> entry : termsGroup.entrySet()) {
            List<TermsOfUse> terms = entry.getValue();
            boolean allAgreed = true;
            boolean hasAgreed = false;
            for (TermsOfUse term : terms) {
                boolean status = userTermsOfUseDao.hasTermsOfUse(userId, term.getTermsOfUseId());
                termsStatus.put(term.getTermsOfUseId(), status);
                allTerms.put(term.getTermsOfUseId(), term);
                if (!status) {
                    allAgreed = false;
                } else {
                    hasAgreed = true;
                }
            }
            if (allAgreed) {
                allAgreedGroup = entry.getValue();
            }
            if (!isNonAgreeableTOUGroup(terms)) {
                // only display agreeable TOU group to user
                agreeableTOUGroup.add(terms);
                groupTermsHasAgreed.add(hasAgreed);
            }
        }
        return allAgreedGroup;
    }
    
    /**
     * Gets the string representation of the terms in a group.
     *  
     * @param group the terms group
     * @return the string representation of the terms in a group.
     * @since 1.13
     */
    private static String getGroupSortedTermsId(List<TermsOfUse> group) {
        long[] ids = new long[group.size()];
        for (int i = 0; i < group.size(); i++) {
            ids[i] = group.get(i).getTermsOfUseId(); 
        }
        Arrays.sort(ids);
        StringBuilder sb = new StringBuilder();
        for (long id : ids) {
            sb.append("_").append(id);
        }
        return sb.toString();
    }
    
    /**
     * Checks whether two terms group are equal.
     * 
     * @param group1 the first terms group
     * @param group2 the second terms group
     * @return true if the two terms groups are equal, false otherwise
     * @since 1.13
     */
    private static boolean termsGroupEqual(List<TermsOfUse> group1, List<TermsOfUse> group2) {
        return getGroupSortedTermsId(group1).equals(getGroupSortedTermsId(group2));
    }
    
    /**
     * Checks whether two group of terms group are equal.
     * 
     * @param group1 the first group of the terms group
     * @param group2 the second group of the terms group
     * @return true if the two group of terms group are equal, false otherwise
     * @since 1.13
     */
    private static boolean termsGroupEqual(Map<Integer, List<TermsOfUse>> group1, Map<Integer, List<TermsOfUse>> group2) {
        if (group1.size() != group2.size()) {
            return false;
        }
        List<String> group1Terms = new ArrayList<String>();
        List<String> group2Terms = new ArrayList<String>();
        for (Map.Entry<Integer, List<TermsOfUse>> entry : group1.entrySet()) {
            group1Terms.add(getGroupSortedTermsId(entry.getValue()));
        }
        for (Map.Entry<Integer, List<TermsOfUse>> entry : group2.entrySet()) {
            group2Terms.add(getGroupSortedTermsId(entry.getValue()));
        }
        Collections.sort(group1Terms);
        Collections.sort(group2Terms);
        return group1Terms.equals(group2Terms);
    }
    
    /**
     * Gets the readable resource role names from a list of resource role IDs.
     * 
     * @param roleIds the resource role IDs
     * @return the readable resource role names
     * @throws Exception if any error occurs
     * @since 1.13
     */
    private String getResourceRoleNames(List<Integer> roleIds) throws Exception {
        Request r = new Request();
        ResultSetContainer detail = null;

         r.setContentHandle("resource_role_names");
         StringBuilder sb = new StringBuilder();
         for (int i = 0; i < roleIds.size(); i++) {
             if (i > 0) {
                 sb.append(",");
             }
             sb.append(roleIds.get(i));
         }
         r.setProperty(Constants.RESOURCE_ROLE_IDS, sb.toString());
         Map results = getDataAccess().getData(r);

         detail = (ResultSetContainer) results.get("resource_role_names");
         StringBuilder rn = new StringBuilder();
         for (int i = 0; i < detail.size(); i++) {
             if (i > 0) {
                 if (i == detail.size() - 1) {
                     rn.append(" and ");
                 } else {
                     rn.append(", ");
                 }
             }
             rn.append(detail.getStringItem(i, "name"));
         }
         return rn.toString();
    }
    
    /**
     * Checks whether the user has pre-pending dependent terms of use to agree. If so, the page will
     * be redirect to the dependent terms of use to let the user agree.
     * 
     * @param viewRegModule the module to let the user agree terms of use
     * @return true if the user has pre-pending dependent terms of use to agree
     * @since 1.13
     */
    protected boolean hasPrePendingTerm(String viewRegModule) {
        String prePendingTerms = getRequest().getParameter(Constants.PRE_PENDING_TERMS);
        if (prePendingTerms == null || prePendingTerms.trim().length() == 0) {
            // no pre-pending term
            return false;
        }
        
        String[] terms = prePendingTerms.split(",");
        if (terms.length == 0) {
            return false;
        }
        long term = Long.valueOf(terms[terms.length - 1]);
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < terms.length - 1; i++) {
            if (i > 0) {
                sb.append(",");
            }
            sb.append(terms[i]);
        }
        getRequest().setAttribute(Constants.PRE_PENDING_TERMS, sb.toString());
        
        // redirect to agree the pre-pending term
        StringBuilder url = new StringBuilder();
        url.append("/tc?").append(Constants.MODULE_KEY).append("=").append(viewRegModule);
        url.append("&").append(Constants.PROJECT_ID).append("=").append(getRequest().getParameter(Constants.PROJECT_ID));
        url.append("&").append(Constants.TERMS_OF_USE_ID).append("=").append(term);
        url.append("&").append(Constants.PRE_PENDING_TERMS).append("=").append(sb.toString());
        setNextPage(url.toString());
        setIsNextPageInContext(false);
        
        return true;
    }
    
    /**
     * This helper method will go through all required terms of use and check whether the user has agreed to
     * them or not. Both lists will be added to the request so that the user can review the terms he agreed to
     * and agree to those he has pending.
     *
     * @param projectId the project id the user is registering to
     * @param userId the user id that is requesting the registration
     * @param currentTermsId the id of current terms of use to agree
     *
     * @return true if the user has pending terms to agree to
     *
     * @throws Exception if any error occurs
     *
     * @since 1.3
     */
    protected boolean processTermsOfUse(String projectId, long userId, int[] roleIds, long currentTermsId)
            throws Exception {

        // check if the user agreed to all terms of use
        ProjectTermsOfUseDao projectTermsOfUseDao = getProjectTermsOfUseDao();
        UserTermsOfUseDao userTermsOfUseDao = getUserTermsOfUseDao();
        TermsOfUseDao termsOfUseDao = getTermsOfUseDao();

        List<Map<Integer, List<TermsOfUse>>> roleTOUs = new ArrayList<Map<Integer, List<TermsOfUse>>>();
        List<Integer> newRoleIds = new ArrayList<Integer>();
        
        // Get the terms of use group for all roles
        for (int roleId : roleIds) {
            Map<Integer, List<TermsOfUse>> tous = projectTermsOfUseDao.getTermsOfUse(Integer.parseInt(projectId), roleId,
                    new int[] {Constants.NON_AGREEABLE_TERMS_TYPE_ID, Constants.NON_ELEC_AGREEABLE_TERMS_TYPE_ID, Constants.ELEC_AGREEABLE_TERMS_TYPE_ID});
            if (tous.size() > 0) {
                newRoleIds.add(roleId);
                roleTOUs.add(tous);
            }
        }
        
        // the key is the id of the terms of use, the value is the flag indicates whether the user has agreed the terms of use
        Map<Long, Boolean> termsStatus = new HashMap<Long, Boolean>();
        // the terms of use groups for each role
        List<List<TermsOfUse>> penddingTermsGroup = null;
        List<Boolean> penddingTermsGroupHasAgreed = null;
        List<Integer> penddingTermsRoleIds = new ArrayList<Integer>();
        // the map from the id of the terms of use to the terms of use
        Map<Long, TermsOfUse> allTerms = new HashMap<Long, TermsOfUse>();
        
        List<List<TermsOfUse>> allAgreedGroups = new ArrayList<List<TermsOfUse>>();
        for (int i = 0; i < roleTOUs.size(); i++) {
            List<List<TermsOfUse>> agreeableTOUGroup = new ArrayList<List<TermsOfUse>>();
            List<Boolean> hasAgreed = new ArrayList<Boolean>();
            List<TermsOfUse> allAgreedGroup;
            if ((allAgreedGroup = processTermsOfUse(roleTOUs.get(i), userId, termsStatus, allTerms, agreeableTOUGroup, hasAgreed)) == null) {
                if (agreeableTOUGroup.size() == 0) {
                    throw new NavigationException("Cannot register for this project due to Terms of Use restrictions");
                }
                penddingTermsGroup = agreeableTOUGroup;
                penddingTermsGroupHasAgreed = hasAgreed;
                penddingTermsRoleIds.add(newRoleIds.get(i));
                // get the common groups
                for (int j = i + 1; j < roleTOUs.size(); j++) {
                    if (termsGroupEqual(roleTOUs.get(i), roleTOUs.get(j))) {
                        penddingTermsRoleIds.add(newRoleIds.get(j));
                    }
                }
                break;
            } else {
                allAgreedGroups.add(allAgreedGroup);
            }
        }
        
        getRequest().setAttribute(Constants.TERMS_STATUS, termsStatus);
        
        if (currentTermsId > 0 && !userTermsOfUseDao.hasTermsOfUse(userId, currentTermsId)) {
            TermsOfUse curTerm = termsOfUseDao.getTermsOfUse(currentTermsId);
            if (curTerm.getAgreeabilityType().getTermsOfUseAgreeabilityTypeId() == Constants.NON_AGREEABLE_TERMS_TYPE_ID) {
                throw new NavigationException("The term is not agreeable.");
            }
            List<TermsOfUse> dependenciesTerms = termsOfUseDao.getDependencyTermsOfUse(currentTermsId);
            List<TermsOfUse> dependenciesTermsAgreed = new ArrayList<TermsOfUse>();
            List<TermsOfUse> dependenciesTermsPendding = new ArrayList<TermsOfUse>();
            // pre-pending terms need to be agreed
            String prePendingTerms = getRequest().getParameter(Constants.PRE_PENDING_TERMS);
            
            for (TermsOfUse term : dependenciesTerms) {
                if (userTermsOfUseDao.hasTermsOfUse(userId, term.getTermsOfUseId())) {
                    dependenciesTermsAgreed.add(term);
                } else {
                    if (term.getAgreeabilityType().getTermsOfUseAgreeabilityTypeId() == Constants.NON_AGREEABLE_TERMS_TYPE_ID) {
                        // the dependency term is non-agreeable, redirect to error page
                        throw new NavigationException("Cannot register for this project due to Terms of Use restrictions");
                    }
                    dependenciesTermsPendding.add(term);
                }
            }
            if (dependenciesTermsPendding.size() > 0) {
                if (prePendingTerms == null || prePendingTerms.trim().length() == 0) {
                    prePendingTerms = String.valueOf(currentTermsId);
                } else {
                    prePendingTerms = prePendingTerms + "," + String.valueOf(currentTermsId);
                }
            }
            getRequest().setAttribute(Constants.PRE_PENDING_TERMS, prePendingTerms);
            getRequest().setAttribute(Constants.TERMS, termsOfUseDao.getTermsOfUse(currentTermsId));
            getRequest().setAttribute(Constants.DEPENDENCIES_TERMS_AGREED, dependenciesTermsAgreed);
            getRequest().setAttribute(Constants.DEPENDENCIES_TERMS_PENDING, dependenciesTermsPendding);
            return true;
        }
        
        if (penddingTermsGroup != null) {
            // there some pending terms of use group
            getRequest().setAttribute(Constants.TERMS_GROUP, penddingTermsGroup);
            getRequest().setAttribute(Constants.TERMS_GROUP_HAS_AGREED, penddingTermsGroupHasAgreed);
            getRequest().setAttribute(Constants.COMMON_RESOURCE_ROLES, getResourceRoleNames(penddingTermsRoleIds));
            return true;
        }
        
        List<List<TermsOfUse>> termsAgreedGlobal = new ArrayList<List<TermsOfUse>>();
        List<String> termsAgreedResourceRoles = new ArrayList<String>();
        boolean[] hasSelected = new boolean[allAgreedGroups.size()];
        for (int i = 0; i < allAgreedGroups.size(); i++) {
            if (hasSelected[i]) {
                continue;
            }
            hasSelected[i] = true;
            List<Integer> roles = new ArrayList<Integer>();
            roles.add(newRoleIds.get(i));
            for (int j = i + 1; j < allAgreedGroups.size(); j++) {
                if (termsGroupEqual(allAgreedGroups.get(i), allAgreedGroups.get(j))) {
                    hasSelected[j] = true;
                    roles.add(newRoleIds.get(j));
                }
            }
            termsAgreedGlobal.add(allAgreedGroups.get(i));
            termsAgreedResourceRoles.add(getResourceRoleNames(roles));
        }
        
        getRequest().setAttribute(Constants.TERMS_AGREED, termsAgreedGlobal);
        getRequest().setAttribute(Constants.TERMS_AGREED_ROLES, termsAgreedResourceRoles);
        
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
    
    /**
     * Gets the <code>TermsOfUseDao</code> instance.
     * 
     * @return the <code>TermsOfUseDao</code> instance.
     * @throws Exception if any error occurs
     * @since 1.13
     */
    protected TermsOfUseDao getTermsOfUseDao() throws Exception {
        if (termsOfUseDao == null) {
            termsOfUseDao = new TermsOfUseDaoImpl(getConfiguration(Constants.TERMS_OF_USE_DAO_NS));
        }
        return termsOfUseDao;
    }
    
    /**
     * Gets the <code>UserTermsOfUseDao</code> instance.
     * 
     * @return the <code>UserTermsOfUseDao</code> instance.
     * @throws Exception if any error occurs
     * @since 1.13
     */
    protected UserTermsOfUseDao getUserTermsOfUseDao() throws Exception {
        if (userTermsOfUseDao == null) {
            userTermsOfUseDao = new UserTermsOfUseDaoImpl(getConfiguration(Constants.USER_TERMS_OF_USE_DAO_NS));
        }
        return userTermsOfUseDao;
    }
    
    /**
     * Gets the <code>ProjectTermsOfUseDao</code> instance.
     * 
     * @return the <code>ProjectTermsOfUseDao</code> instance.
     * @throws Exception if any error occurs
     * @since 1.13
     */
    protected ProjectTermsOfUseDao getProjectTermsOfUseDao() throws Exception {
        if (projectTermsOfUseDao == null) {
            projectTermsOfUseDao = new ProjectTermsOfUseDaoImpl(getConfiguration(Constants.PROJECT_TERMS_OF_USE_DAO_NS));
        }
        return projectTermsOfUseDao;
    }
    
    /**
     * Gets the configuration object by the configuration namespace.
     * @param namespace the configuration namespace
     * @return the configuration object
     * @throws Exception if any error occurs
     * @since 1.13
     */
    private ConfigurationObject getConfiguration(String namespace) throws Exception {
        return new ConfigurationFileManager(
                Constants.CONFIGURATION_FILE).getConfiguration(namespace)
                .getChild(namespace);
    }
}
