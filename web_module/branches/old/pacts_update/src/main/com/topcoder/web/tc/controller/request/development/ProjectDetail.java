package com.topcoder.web.tc.controller.request.development;

import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.tc.controller.legacy.TaskDevelopment;
import com.topcoder.web.tc.model.SoftwareComponent;

import java.util.Map;

/**
 * @author dok
 * Date: Mar 1, 2004
 */
public class ProjectDetail extends Base {


    protected void developmentProcessing() throws TCWebException {

        try {
            Request r = new Request();
            r.setContentHandle("project_detail");
            r.setProperty(Constants.PROJECT_ID, StringUtils.checkNull(getRequest().getParameter(Constants.PROJECT_ID)));

            Map resultMap = getDataAccess().getData(r);

            ResultSetContainer details = (ResultSetContainer) resultMap.get("project_detail");
            getRequest().setAttribute("projectDetail", details);
            getRequest().setAttribute("technologies", resultMap.get("project_technologies"));

            boolean full = TaskDevelopment.isProjectLockedOut(details.getLongItem(0, "component_id"),
                    details.getLongItem(0, "version_id"), details.getLongItem(0, "phase_id"), getUser().getId());
            getRequest().setAttribute("projectFull", String.valueOf(full));

            //added rfairfax
            getRequest().setAttribute("projectId", StringUtils.checkNull(getRequest().getParameter(Constants.PROJECT_ID)));

            if (details.isEmpty()) {
                throw new NavigationException("Could not find project information.");
            } else {
                if (details.getLongItem(0, "phase_id") == SoftwareComponent.DESIGN_PHASE) {
                    setNextPage(Constants.DESIGN_DETAIL);
                } else if (details.getLongItem(0, "phase_id") == SoftwareComponent.DEV_PHASE) {
                    setNextPage(Constants.DEVELOPMENT_DETAIL);
                } else {
                    throw new TCWebException("Invalid phase found: " + details.getLongItem(0, "phase_id"));
                }
            }
            setIsNextPageInContext(true);

        } catch (TCWebException e) {
            throw e;
        } catch (Exception e) {
            throw new TCWebException(e);
        }


    }
}
