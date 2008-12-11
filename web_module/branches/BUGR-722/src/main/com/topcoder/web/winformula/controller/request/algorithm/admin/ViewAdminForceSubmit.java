package com.topcoder.web.winformula.controller.request.algorithm.admin;

import com.topcoder.shared.dataAccess.DataAccessConstants;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.web.common.model.SortInfo;
import com.topcoder.web.winformula.algorithm.CodingConstants;
import com.topcoder.web.winformula.controller.request.AlgorithmBase;

/**
 * @author dok
 * @version $Revision: 72304 $ Date: 2005/01/01 00:00:00
 *          Create Date: Feb 2, 2006
 */
public class ViewAdminForceSubmit extends AlgorithmBase {

    protected void longContestProcessing() throws Exception {
        //get a list of the submissions and put them in the request for display
        Request r = new Request();
        r.setContentHandle("long_contest_submissions");
        r.setProperties(getRequest().getParameterMap());
        r.setProperty(DataAccessConstants.SORT_QUERY, "long_contest_submissions");
        getRequest().setAttribute("submissions", getDataAccess().getData(r).get("long_contest_submissions"));
        setDefault(CodingConstants.ROUND_ID, getRequest().getParameter(CodingConstants.ROUND_ID));
        SortInfo s = new SortInfo();
        getRequest().setAttribute(SortInfo.REQUEST_KEY, s);

        setNextPage("/algorithm/admin/viewSubmissions.jsp");
        setIsNextPageInContext(true);
    }
}