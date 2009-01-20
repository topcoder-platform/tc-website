package com.topcoder.web.tc.controller.request.contest;

import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.tc.controller.request.development.Base;

import java.util.Map;

/**
 * Added some code to permit other projects different from component competitions.
 *
 * @author dok, pulky
 *         Date: Mar 1, 2004
 */
public class ProjectDetail extends Base {


    protected void developmentProcessing() throws TCWebException {

        try {
            String projectId = StringUtils.checkNull(getRequest().getParameter(Constants.PROJECT_ID));

            if (projectId.equals("")) {
                throw new TCWebException("parameter " + Constants.PROJECT_ID + " expected.");
            }

            int projectTypeId = getProjectTypeId(Long.parseLong(projectId));

            if (projectTypeId == -1) {
                throw new TCWebException("Could not find project information.");
            }

            Request r = new Request();
            r.setContentHandle("project_detail");
            r.setProperty(Constants.PROJECT_ID, StringUtils.checkNull(getRequest().getParameter(Constants.PROJECT_ID)));

            Map resultMap = getDataAccess().getData(r);

            ResultSetContainer details = (ResultSetContainer) resultMap.get("project_detail");
            getRequest().setAttribute("projectDetail", details);
            getRequest().setAttribute("technologies", resultMap.get("project_technologies"));

            boolean full = false;  //projects are never full in our current rules
            getRequest().setAttribute("projectFull", String.valueOf(full));
            getRequest().setAttribute("projectId", StringUtils.checkNull(getRequest().getParameter(Constants.PROJECT_ID)));
            
            if (details.isEmpty()) {
                throw new NavigationException("Could not find project information.");
            }

            getRequest().setAttribute("paysRoyalties", !details.getBooleanItem(0, "is_custom") );

            String projectDetailPage = getProjectDetailPage(projectTypeId);
            if (projectDetailPage.equals("")) {
                throw new TCWebException("Invalid phase found: " + (projectTypeId + 111));
            }

            setNextPage(projectDetailPage);
            setIsNextPageInContext(true);

        } catch (TCWebException e) {
            throw e;
        } catch (Exception e) {
            throw new TCWebException(e);
        }


    }
}
