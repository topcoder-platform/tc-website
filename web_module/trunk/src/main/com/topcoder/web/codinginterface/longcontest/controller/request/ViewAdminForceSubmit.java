package com.topcoder.web.codinginterface.longcontest.controller.request;

import com.topcoder.shared.dataAccess.DataAccessConstants;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.security.ClassResource;
import com.topcoder.web.codinginterface.longcontest.Constants;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.SecurityHelper;
import com.topcoder.web.common.model.SortInfo;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Feb 2, 2006
 */
public class ViewAdminForceSubmit extends Base {

    protected void longContestProcessing() throws Exception {
        //get a list of the submissions and put them in the request for display
        if (!SecurityHelper.hasPermission(getUser(), new ClassResource(this.getClass()))) {
            throw new PermissionException(getUser(), new ClassResource(this.getClass()));
        } else {
            Request r = new Request();
            r.setContentHandle("long_contest_submissions");
            r.setProperties(getRequest().getParameterMap());
            r.setProperty(DataAccessConstants.SORT_QUERY, "long_contest_submissions");
            getRequest().setAttribute("submissions", getDataAccess().getData(r).get("long_contest_submissions"));

            setDefault(Constants.ROUND_ID, getRequest().getParameter(Constants.ROUND_ID));

            SortInfo s = new SortInfo();
            getRequest().setAttribute(SortInfo.REQUEST_KEY, s);

            setNextPage("/admin/viewSubmissions.jsp");
            setIsNextPageInContext(true);


        }
    }
}
