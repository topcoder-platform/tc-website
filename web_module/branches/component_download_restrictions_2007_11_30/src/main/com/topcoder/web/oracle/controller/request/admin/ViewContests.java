package com.topcoder.web.oracle.controller.request.admin;

import com.topcoder.web.common.ShortHibernateProcessor;
import com.topcoder.web.oracle.dao.OracleDAOUtil;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Mar 27, 2007
 */
public class ViewContests extends ShortHibernateProcessor {
    protected void dbProcessing() throws Exception {
        //load contests
        getRequest().setAttribute("contests", OracleDAOUtil.getFactory().getContestDAO().getContests());
        setNextPage("/admin/contests.jsp");
        setIsNextPageInContext(true);
    }
}
