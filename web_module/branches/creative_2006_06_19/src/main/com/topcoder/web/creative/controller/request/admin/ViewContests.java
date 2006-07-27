package com.topcoder.web.creative.controller.request.admin;

import com.topcoder.web.common.ShortHibernateProcessor;
import com.topcoder.web.creative.dao.CreativeDAOUtil;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Jul 17, 2006
 */
public class ViewContests extends ShortHibernateProcessor {
    protected void dbProcessing() throws Exception {
        //load contests
        getRequest().setAttribute("contests", CreativeDAOUtil.getFactory().getContestDAO().getContests());
        setNextPage("/admin/viewContests.jsp");
        setIsNextPageInContext(true);

    }
}
