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

    public static final String getProjectDetailPage(int projectTypeId) {
        if (String.valueOf(projectTypeId).equals(Constants.DESIGN_PROJECT_TYPE)) {
            return Constants.DESIGN_DETAIL;
        } else if (String.valueOf(projectTypeId).equals(Constants.DEVELOPMENT_PROJECT_TYPE)) {
            return Constants.DEVELOPMENT_DETAIL;
        } else if (String.valueOf(projectTypeId).equals(Constants.ASSEMBLY_PROJECT_TYPE)) {
            return "/dev/assembly/projectDetail.jsp";
        } else if (String.valueOf(projectTypeId).equals(Constants.ARCHITECTURE_PROJECT_TYPE)) {
            return "/architecture/projectDetail.jsp";
        } else if (String.valueOf(projectTypeId).equals(Constants.COMPONENT_TESTING_PROJECT_TYPE)) { 
            return "/dev/testing/projectDetail.jsp";
        } else if (String.valueOf(projectTypeId).equals(Constants.APPLICATION_TESTING_PROJECT_TYPE)) { 
            return "/testing/projectDetail.jsp";
        } else {
            return "";
        }
    }

    public static final String getRegistrantsCommandName(int projectTypeId) {
        if (String.valueOf(projectTypeId).equals(Constants.DESIGN_PROJECT_TYPE) ||
            String.valueOf(projectTypeId).equals(Constants.DEVELOPMENT_PROJECT_TYPE)) {
            return "registrants";
        } else if (String.valueOf(projectTypeId).equals(Constants.ASSEMBLY_PROJECT_TYPE)) {
            return "assembly_registrants";
        } else if (String.valueOf(projectTypeId).equals(Constants.ARCHITECTURE_PROJECT_TYPE)) {
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

}
