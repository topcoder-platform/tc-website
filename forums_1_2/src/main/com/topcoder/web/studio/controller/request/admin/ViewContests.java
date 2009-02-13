package com.topcoder.web.studio.controller.request.admin;

import com.topcoder.web.studio.dao.StudioDAOUtil;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Jul 17, 2006
 */
public class ViewContests extends Base {
    protected void dbProcessing() throws Exception {
        //load contests
        getRequest().setAttribute("contests", StudioDAOUtil.getFactory().getContestDAO().getContests());
        setNextPage("/admin/viewContests.jsp");
        setIsNextPageInContext(true);

    }
}
