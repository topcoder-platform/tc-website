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

/**
 * Added some code to make project related controllers more generic.
 *
 * @author dok, pulky
 *         Date: Feb 10, 2004
 */
public abstract class Base extends ShortHibernateProcessor {
    protected Logger log = Logger.getLogger(Base.class);

    protected int getProjectTypeId(long projectId) throws Exception {
        ProjectLocal pl = (ProjectLocal) createLocalEJB(getInitialContext(), Project.class);
        return pl.getProjectTypeId(projectId, DBMS.TCS_OLTP_DATASOURCE_NAME);
    }

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
        } else if (projectTypeId==Constants.APPLICATION_TESTING_PROJECT_TYPE) {
            return "/testing/projectDetail.jsp";
        } else {
            return "";
        }
    }

    public static String getRegistrantsCommandName(int projectTypeId) {
        if (projectTypeId==Constants.DESIGN_PROJECT_TYPE ||
            projectTypeId==Constants.DEVELOPMENT_PROJECT_TYPE) {
            return "registrants";
        } else if (projectTypeId==Constants.ASSEMBLY_PROJECT_TYPE) {
            return "assembly_registrants";
        } else if (projectTypeId==Constants.ARCHITECTURE_PROJECT_TYPE) {
            return "architecture_registrants";
        } else {
            return "contest_registrants";
        }
    }

    protected void dbProcessing() throws TCWebException {
        developmentProcessing();
    }

    public static ResultSetContainer getOpenProjects() throws Exception {
        Request dataRequest = null;
        Map resultMap = null;
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
            }
        }
        return projectTypeId;

    }

}
