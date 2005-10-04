package com.topcoder.web.tc.controller.request.development;

import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.security.ClassResource;
import com.topcoder.web.common.BaseServlet;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.SessionInfo;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.tc.Constants;

import java.util.Map;

/**
 * @author mktong
 * Date: Oct 3, 2005
 */
public class TCSSurveyResults extends Base {


    protected void developmentProcessing() throws TCWebException {

        if (((SessionInfo) getRequest().getAttribute(BaseServlet.SESSION_INFO_KEY)).isAdmin()) {

            try {
                Request r = new Request();
                r.setContentHandle("survey_results");
                String projectID = StringUtils.checkNull(getRequest().getParameter(Constants.PROJECT_ID));
                r.setProperty(Constants.PROJECT_ID, projectID);

                Map resultMap = getDataAccess().getData(r);
                ResultSetContainer results = null;
                ResultSetContainer resultsFreeform = null;
                
                if (projectID.equals("")) {
                    results = (ResultSetContainer)resultMap.get("survey_results_all");
                    resultsFreeform = (ResultSetContainer)resultMap.get("survey_results_all_freeform");
                } else {
                    results = (ResultSetContainer)resultMap.get("survey_results");
                    resultsFreeform = (ResultSetContainer)resultMap.get("survey_results_freeform");               
                    getRequest().setAttribute("componentName", results.getStringItem(1, "component_name"));
                }
                getRequest().setAttribute("results", results);
                getRequest().setAttribute("resultsFreeform", resultsFreeform);
                
                if (results.isEmpty()) {
                    throw new NavigationException("No survey information available for this project.");
                } else {
                    setNextPage(Constants.TCS_SURVEY_RESULTS);
                }
                setIsNextPageInContext(true);

            } catch (TCWebException e) {
                throw e;
            } catch (Exception e) {
                throw new TCWebException(e);
            }

        } else {
            throw new PermissionException(getUser(), new ClassResource(this.getClass()));
        }
    }
}
