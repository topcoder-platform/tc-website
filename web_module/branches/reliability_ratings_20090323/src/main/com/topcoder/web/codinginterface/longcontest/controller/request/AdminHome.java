package com.topcoder.web.codinginterface.longcontest.controller.request;

import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.security.ClassResource;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.SecurityHelper;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Feb 2, 2006
 */
public class AdminHome extends Base {

    protected void longContestProcessing() throws Exception {
        if (!SecurityHelper.hasPermission(getAuthentication().getUser(), new ClassResource(this.getClass()))) {
            throw new PermissionException(getAuthentication().getUser(), new ClassResource(this.getClass()));
        } else {
            //get round list and put it in the request
            Request r = new Request();
            r.setContentHandle("long_contest_round_list");
            getRequest().setAttribute("roundList", getDataAccess().getData(r).get("long_contest_round_list"));
            setNextPage("/admin/home.jsp");
            setIsNextPageInContext(true);
        }
    }

}