package com.topcoder.web.tc.controller.request.development;

import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.tc.Constants;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;

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
            r.setProperty("pj", StringUtils.checkNull(getRequest().getParameter("pj")));

            Map resultMap = getDataAccess().getData(r);

            ResultSetContainer details = (ResultSetContainer)resultMap.get("project_detail");
            getRequest().setAttribute("projectDetail", details);

            setNextPage(Constants.DESIGN_DETAIL);
            setIsNextPageInContext(true);

        } catch (TCWebException e) {
            throw e;
        } catch (Exception e) {
            throw new TCWebException(e);
        }


    }
}
