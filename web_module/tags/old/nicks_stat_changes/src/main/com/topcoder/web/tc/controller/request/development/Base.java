package com.topcoder.web.tc.controller.request.development;

import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.TCWebException;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.CachedDataAccess;
import com.topcoder.shared.dataAccess.DataAccess;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.common.web.data.report.Constants;
import com.topcoder.common.web.data.report.Query;

import java.util.Map;
import java.util.Iterator;

/**
 * @author dok
 * Date: Feb 10, 2004
 */
public abstract class Base extends BaseProcessor {

    final protected void businessProcessing() throws TCWebException {
        //get the data for the right side
        try {

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
            devSum*=1.75;
            designSum*=1.75;

            getRequest().setAttribute("DevSum", new Double(devSum));
            getRequest().setAttribute("DesignSum", new Double(designSum));
            getRequest().setAttribute("OpenProjects", openProjects);


        } catch (TCWebException e) {
            throw e;
        } catch (Exception e) {
            throw new TCWebException(e);
        }
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

    public static ResultSetContainer getProjectTotals() throws Exception {
        Request dataRequest = null;
        Map resultMap = null;
        DataAccessInt tcsDai = new CachedDataAccess(DBMS.TCS_OLTP_DATASOURCE_NAME);
        dataRequest = new Request();
        dataRequest.setContentHandle("project_totals");
        resultMap = tcsDai.getData(dataRequest);
        return (ResultSetContainer) resultMap.get("total_component_prices");
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
