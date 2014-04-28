package com.topcoder.web.tc.controller.request.compstats;

import com.topcoder.shared.dataAccess.DataAccess;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.model.SoftwareComponent;
import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.CachedDataAccess;
import com.topcoder.web.common.tag.HandleTag;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.common.TCWebException;

import java.util.Map;

abstract public class Base extends BaseProcessor {

    protected static final Logger log = Logger.getLogger(Base.class);

    public DataAccessInt getDataAccess() throws Exception {
        return getDataAccess(DBMS.TCS_DW_DATASOURCE_NAME, false);
    }

    public DataAccessInt getDataAccess(boolean cached) throws Exception {
        return getDataAccess(DBMS.TCS_DW_DATASOURCE_NAME, cached);
    }

    public DataAccessInt getDataAccess(String datasource, boolean cached) throws Exception {
        if (log.isDebugEnabled()) {
            log.debug("Accessing to " + DBMS.TCS_DW_DATASOURCE_NAME);
        }
        if (datasource == null) return null;
        DataAccessInt dAccess = null;
        if (cached)
            dAccess = new CachedDataAccess(datasource);
        else
            dAccess = new DataAccess(datasource);
        return dAccess;
    }

    // returns a rsc from the database using the given command.  It is assumed that
    // the command contains a query with the same name.
    protected ResultSetContainer queryDB(String commandName) throws Exception {
        return queryDB(commandName, commandName);
    }

    // returns a rsc from the database using the given command and given query name.
    protected ResultSetContainer queryDB(String commandName, String queryName) throws Exception {
        Request r = new Request();
        r.setContentHandle(commandName);
        DataAccessInt dai = getDataAccess(true);
        Map result = dai.getData(r);
        return (ResultSetContainer) result.get(queryName);
    }
    
    // Helper method used to get project type ID from the request parameters
    int getProjectTypeId() throws Exception {
        if (hasParameter(Constants.PHASE_ID) &&
            !getRequest().getParameter(Constants.PHASE_ID).equals(String.valueOf(SoftwareComponent.DEV_PHASE)) &&
            !getRequest().getParameter(Constants.PHASE_ID).equals(String.valueOf(SoftwareComponent.DESIGN_PHASE)) &&
            !getRequest().getParameter(Constants.PHASE_ID).equals(String.valueOf(SoftwareComponent.CONCEPTUALIZATION_PHASE)) &&
            !getRequest().getParameter(Constants.PHASE_ID).equals(String.valueOf(SoftwareComponent.SPECIFICATION_PHASE)) &&
            !getRequest().getParameter(Constants.PHASE_ID).equals(String.valueOf(SoftwareComponent.ARCHITECTURE_PHASE)) &&
            !getRequest().getParameter(Constants.PHASE_ID).equals(String.valueOf(SoftwareComponent.ASSEMBLY_PHASE)) &&
            !getRequest().getParameter(Constants.PHASE_ID).equals(String.valueOf(SoftwareComponent.TEST_SUITES_PHASE)) &&
            !getRequest().getParameter(Constants.PHASE_ID).equals(String.valueOf(SoftwareComponent.TEST_SCENARIOS_PHASE)) &&
            !getRequest().getParameter(Constants.PHASE_ID).equals(String.valueOf(SoftwareComponent.UI_PROTOTYPE_PHASE)) &&
            !getRequest().getParameter(Constants.PHASE_ID).equals(String.valueOf(SoftwareComponent.RIA_BUILD_PHASE)) &&
            !getRequest().getParameter(Constants.PHASE_ID).equals(String.valueOf(SoftwareComponent.CONTENT_CREATION_PHASE)) &&
            !getRequest().getParameter(Constants.PHASE_ID).equals(String.valueOf(SoftwareComponent.REPORTING_PHASE))) {
            throw new TCWebException("invalid " + Constants.PHASE_ID + " parameter.");
        }

        if (!hasParameter(Constants.PHASE_ID)) {
            if (!getRequest().getParameter(Constants.PROJECT_TYPE_ID).equals(String.valueOf(Constants.DESIGN_PROJECT_TYPE)) &&
                    !getRequest().getParameter(Constants.PROJECT_TYPE_ID).equals(String.valueOf(Constants.DEVELOPMENT_PROJECT_TYPE)) &&
                    !getRequest().getParameter(Constants.PROJECT_TYPE_ID).equals(String.valueOf(Constants.ASSEMBLY_PROJECT_TYPE)) &&
                    !getRequest().getParameter(Constants.PROJECT_TYPE_ID).equals(String.valueOf(Constants.CONCEPTUALIZATION_PROJECT_TYPE)) &&
                    !getRequest().getParameter(Constants.PROJECT_TYPE_ID).equals(String.valueOf(Constants.SPECIFICATION_PROJECT_TYPE)) &&
                    !getRequest().getParameter(Constants.PROJECT_TYPE_ID).equals(String.valueOf(Constants.ARCHITECTURE_PROJECT_TYPE)) &&
                    !getRequest().getParameter(Constants.PROJECT_TYPE_ID).equals(String.valueOf(Constants.TEST_SUITES_PROJECT_TYPE)) &&
                    !getRequest().getParameter(Constants.PROJECT_TYPE_ID).equals(String.valueOf(Constants.TEST_SCENARIOS_PROJECT_TYPE)) &&
                    !getRequest().getParameter(Constants.PROJECT_TYPE_ID).equals(String.valueOf(Constants.UI_PROTOTYPE_PROJECT_TYPE)) &&
                    !getRequest().getParameter(Constants.PROJECT_TYPE_ID).equals(String.valueOf(Constants.RIA_BUILD_PROJECT_TYPE)) &&
                    !getRequest().getParameter(Constants.PROJECT_TYPE_ID).equals(String.valueOf(Constants.CONTENT_CREATION_PROJECT_TYPE)) &&
                    !getRequest().getParameter(Constants.PROJECT_TYPE_ID).equals(String.valueOf(Constants.REPORTING_PROJECT_TYPE))) {
                throw new TCWebException("invalid " + Constants.PROJECT_TYPE_ID + " parameter.");
            }

            return Integer.parseInt(getRequest().getParameter(Constants.PROJECT_TYPE_ID));
        } else {
            return Integer.parseInt(getRequest().getParameter(Constants.PHASE_ID)) - 111;
        }
    }

    // Helper method that maps project type ID to handle type.
    String getHandleType(int projectTypeId) {
        switch (projectTypeId) {
            case Constants.DESIGN_PROJECT_TYPE:
                return HandleTag.DESIGN;
            case Constants.DEVELOPMENT_PROJECT_TYPE:
                return HandleTag.DEVELOPMENT;
            case Constants.ASSEMBLY_PROJECT_TYPE:
                return HandleTag.ASSEMBLY;
            case Constants.CONCEPTUALIZATION_PROJECT_TYPE:
                return HandleTag.CONCEPTUALIZATION;
            case Constants.SPECIFICATION_PROJECT_TYPE:
                return HandleTag.SPECIFICATION;
            case Constants.ARCHITECTURE_PROJECT_TYPE:
                return HandleTag.ARCHITECTURE;
            case Constants.TEST_SUITES_PROJECT_TYPE:
                return HandleTag.TEST_SUITES;
            case Constants.TEST_SCENARIOS_PROJECT_TYPE:
                return HandleTag.TEST_SCENARIOS;
            case Constants.UI_PROTOTYPE_PROJECT_TYPE:
                return HandleTag.UI_PROTOTYPE;
            case Constants.RIA_BUILD_PROJECT_TYPE:
                return HandleTag.RIA_BUILD;
            case Constants.CONTENT_CREATION_PROJECT_TYPE:
                return HandleTag.CONTENT_CREATION;
            case Constants.REPORTING_PROJECT_TYPE:
                return HandleTag.REPORTING;
        }
        return "";
    }
}
