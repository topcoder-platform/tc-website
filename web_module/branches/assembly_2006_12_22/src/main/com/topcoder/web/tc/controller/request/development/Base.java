package com.topcoder.web.tc.controller.request.development;

import com.topcoder.shared.dataAccess.CachedDataAccess;
import com.topcoder.shared.dataAccess.DataAccess;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.ejb.project.Project;
import com.topcoder.web.ejb.project.ProjectLocal;
import com.topcoder.web.tc.Constants;

import java.util.Map;

/**
 * Added some code to make project related controllers more generic.
 * 
 * @author dok, pulky
 *         Date: Feb 10, 2004
 */
public abstract class Base extends BaseProcessor {
    protected Logger log = Logger.getLogger(Base.class);

    protected int getProjectTypeId(long projectId) throws Exception {
        ProjectLocal pl = (ProjectLocal) createLocalEJB(getInitialContext(), Project.class);
        return pl.getProjectTypeId(projectId, DBMS.TCS_OLTP_DATASOURCE_NAME);
    }
    
/*    protected String getRegistrantsPage(int projectTypeId) {
        switch (projectTypeId) {
            case 1:
            case 2:
                return "/dev/registrants.jsp";
            case 14:
                return "/dev/assembly/registrants.jsp";
            default:
                return "";
        }
    }*/
    
    protected String getProjectDetailPage(int projectTypeId) {
        switch (projectTypeId) {
            case 1:
                return Constants.DESIGN_DETAIL;
            case 2:
                return Constants.DEVELOPMENT_DETAIL;
            case 14:
                return "/dev/assembly/assemblyProjectDetail.jsp";
            default:
                return "";
        }
    }
    
    protected String getRegistrantsCommandName(int projectTypeId) {
        switch (projectTypeId) {
            case 1:
            case 2:
                return "registrants";
            case 14:
                return "assembly_registrants";
            default:
                return "";
        }
    }
    
    final protected void businessProcessing() throws TCWebException {
        //get the data for the right side
        /*try {

            log.debug("ENTERING businessProcessing");

            //no longer using, removed - rfairfax 6-9-2004

             ResultSetContainer openProjects = getOpenProjects();

            double devSum = 0.0d;
            double designSum = 0.0d;
            ResultSetContainer.ResultSetRow row = null;
            for (Iterator it=openProjects.iterator(); it.hasNext();) {
                row = (ResultSetContainer.ResultSetRow)it.next();
                if (row.getLongItem("phase_id")==113) {
                    devSum+=row.getDoubleItem("price");
                } else if (row.getLongItem("phase_id")==112) {
                    designSum+=row.getDoubleItem("price");
                }
            }
            devSum*=1.5d;
            designSum*=1.5d;

            getRequest().setAttribute("DevSum", new Double(devSum));
            getRequest().setAttribute("DesignSum", new Double(designSum));
            getRequest().setAttribute("OpenProjects", openProjects);


            log.debug("LEAVING businessProcessing");

        } catch (TCWebException e) {
            throw e;
        } catch (Exception e) {
            throw new TCWebException(e);
        }*/
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
