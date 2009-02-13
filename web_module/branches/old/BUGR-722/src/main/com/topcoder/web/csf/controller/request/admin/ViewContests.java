package com.topcoder.web.csf.controller.request.admin;

import com.topcoder.web.csf.dao.CSFDAOUtil;

/**
 * @author dok
 * @version $Revision: 57814 $ Date: 2005/01/01 00:00:00
 *          Create Date: Jul 17, 2006
 */
public class ViewContests extends Base {
    protected void dbProcessing() throws Exception {
        //load contests
        getRequest().setAttribute("contests", CSFDAOUtil.getFactory().getContestDAO().getContests());
        setNextPage("/admin/contests.jsp");
        setIsNextPageInContext(true);

    }
}
