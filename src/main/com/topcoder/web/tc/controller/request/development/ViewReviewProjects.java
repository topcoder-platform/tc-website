package com.topcoder.web.tc.controller.request.development;

import com.topcoder.web.common.TCWebException;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;

/**
 * @author dok
 * Date: Feb 10, 2004
 */
public class ViewReviewProjects extends Base {

    protected void developmentProcessing() throws TCWebException {
        Request r = new Request();
        r.setContentHandle("review_projects");
        try {
            getRequest().setAttribute("projectList", getDataAccess().getData(r).get("review_projects"));
        } catch (TCWebException e) {
            throw e;
        } catch (Exception e) {
            throw new TCWebException(e);
        }
        setNextPage("/dev/reviewProjects.jsp");
        setIsNextPageInContext(true);
    }


}
