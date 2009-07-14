/*
 * Copyright (C) 2004 - 2009 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.tc.controller.request.development;

import java.rmi.RemoteException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.ejb.CreateException;
import javax.ejb.EJBException;
import javax.naming.NamingException;

import com.topcoder.shared.dataAccess.DataAccess;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.CachedDataAccess;
import com.topcoder.web.common.ShortHibernateProcessor;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.TCRequest;
import com.topcoder.web.common.TCWebException;
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
 *   </table>
 * </p>
 *
 * @author dok, isv, pulky
 * @version 1.4
 */
public abstract class Base extends ShortHibernateProcessor {
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
            || projectTypeId == Constants.RIA_COMPONENT_PROJECT_TYPE) {
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

        userTermsOfUse.createUserTermsOfUse(userId, termsOfUseId, DBMS.COMMON_OLTP_DATASOURCE_NAME);
    }

    /**
     * This helper method will go through all required terms of use and check whether the user has agreed to
     * them or not. If the user agreed to all required terms of use, the list of these terms of use will be
     * added to the request. If the user is missing a terms of use, that terms of use will be added to the request.
     *
     * @param projectId the project id the user is registering to
     * @param userId the user id that is requesting the registration
     * @throws NamingException if any errors occur during EJB lookup
     * @throws RemoteException if any errors occur during EJB remote invocation
     * @throws CreateException if any errors occur during EJB creation
     * @throws EJBException if any other errors occur while invoking EJB services
     *
     * @since 1.3
     */
    protected void processTermsOfUse(String projectId, long userId, int[] roleIds)
            throws NamingException, RemoteException, CreateException, EJBException {

        // check if the user agreed to all terms of use
        ProjectRoleTermsOfUse projectRoleTermsOfUse = ProjectRoleTermsOfUseLocator.getService();
        UserTermsOfUse userTermsOfUse = UserTermsOfUseLocator.getService();
        TermsOfUse termsOfUse = TermsOfUseLocator.getService();

        // validate that new resources have agreed to the necessary terms of use
        List<Long> necessaryTerms = projectRoleTermsOfUse.getTermsOfUse(Integer.parseInt(projectId),
                roleIds, DBMS.COMMON_OLTP_DATASOURCE_NAME);

        List<TermsOfUseEntity> termsAgreed = new ArrayList<TermsOfUseEntity>();

        boolean hasPendingTerms = false;
        for (int i = 0; i < necessaryTerms.size() && !hasPendingTerms; i++) {
            Long termsId = necessaryTerms.get(i);

            // get terms of use
            TermsOfUseEntity terms =  termsOfUse.getEntity(termsId, DBMS.COMMON_OLTP_DATASOURCE_NAME);

            // check if the user has this terms
            if (!userTermsOfUse.hasTermsOfUse(userId, termsId, DBMS.COMMON_OLTP_DATASOURCE_NAME)) {
                hasPendingTerms = true;
                getRequest().setAttribute(Constants.TERMS, terms);
            } else {
                termsAgreed.add(terms);
            }
        }

        if (!hasPendingTerms) {
            getRequest().setAttribute(Constants.TERMS_AGREED, termsAgreed);
        }
    }

    /**
     * This helper method will get resource role ids based on the review type id and primary flag
     *
     * @param reviewTypeId the review type id
     * @param primary if the position is a primary review position
     * @return <code>int[]</code> with the role ids
     */
    protected int[] getResourceRoleIds(int reviewTypeId, boolean primary) {
        int[] roleIds;
        int roleId = 0;

        if (primary) {
            roleIds = Base.PRIMARY_ROLE_IDS;
        } else {
            roleIds = new int[1];
        }
        switch (reviewTypeId) {
            case 1:
                roleId = 7;
            case 2:
                roleId = 6;
            case 3:
                roleId = 5;
            default:
                roleId = 4;
        }

        roleIds[0] = roleId;
        return roleIds;
    }
}
