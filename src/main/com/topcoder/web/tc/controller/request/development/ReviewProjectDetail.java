package com.topcoder.web.tc.controller.request.development;

import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.StringUtils;
import com.topcoder.shared.dataAccess.Request;

/**
 * @author dok
 * Date: Feb 11, 2004
 */
public class ReviewProjectDetail extends Base {

    protected void developmentProcessing() throws TCWebException {
        Request r = new Request();
        r.setContentHandle("review_project_detail");
        r.setProperty("pj", StringUtils.checkNull(getRequest().getParameter("pj")));
        r.setProperty("ph", StringUtils.checkNull(getRequest().getParameter("ph")));
        try {
            getRequest().setAttribute("projectDetail", getDataAccess().getData(r).get("review_project_detail"));
        } catch (TCWebException e) {
            throw e;
        } catch (Exception e) {
            throw new TCWebException(e);
        }
        setNextPage("/dev/reviewProjectDetail.jsp");
        setIsNextPageInContext(true);

    }
}
