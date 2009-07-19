/*
 * Copyright (C) 2004 - 2009 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.tc.controller.request.development;

import java.util.Map;

import com.topcoder.shared.dataAccess.DataAccess;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.CachedDataAccess;
import com.topcoder.web.common.ShortHibernateProcessor;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.TCRequest;
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
 *         <td>Version 1.4 (Specification Review Integration 1.0)</td>
 *         <td>
 *           <ul>
 *             <li>Updated <code>isProjectTypeSupported</code> to support specification review projects.</li>
 *           </ul>
 *         </td>
 *     </tr> 
 *   </table>
 * </p>
 *
 * @author dok, isv, pulky, TCSASSEMBLER
 * @version 1.4
 */
public abstract class Base extends ShortHibernateProcessor {
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
}
