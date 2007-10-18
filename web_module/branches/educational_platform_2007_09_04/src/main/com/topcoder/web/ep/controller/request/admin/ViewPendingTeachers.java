package com.topcoder.web.ep.controller.request.admin;

import com.topcoder.shared.dataAccess.DataAccess;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.web.common.ShortHibernateProcessor;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Oct 18, 2007
 */
public class ViewPendingTeachers extends ShortHibernateProcessor {
    protected void dbProcessing() throws Exception {
        //load up the professors and put them in the request
        Request r = new Request();
        r.setContentHandle("pending_teachers");
        getRequest().setAttribute("teachers", new DataAccess().getData(r).get("pending_teachers"));
        setNextPage("/admin/pendingTeachers.jsp");
        setIsNextPageInContext(true);
    }
}

