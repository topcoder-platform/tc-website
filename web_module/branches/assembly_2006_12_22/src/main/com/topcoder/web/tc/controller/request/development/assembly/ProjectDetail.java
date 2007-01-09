package com.topcoder.web.tc.controller.request.development.assembly;

import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.model.SoftwareComponent;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.tc.controller.request.development.Base;

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

            boolean full = false;  //projects are never full in our current rules
            getRequest().setAttribute("projectFull", String.valueOf(full));

            //added rfairfax
            getRequest().setAttribute("projectId", StringUtils.checkNull(getRequest().getParameter(Constants.PROJECT_ID)));
            
            if (details.isEmpty()) {
                throw new NavigationException("Could not find project information.");
            } else {
                setNextPage("/dev/assembly/assemblyProjectDetail.jsp");
            }
            setIsNextPageInContext(true);

        } catch (TCWebException e) {
            throw e;
        } catch (Exception e) {
            throw new TCWebException(e);
        }


    }
}
