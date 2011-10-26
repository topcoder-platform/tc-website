package com.topcoder.web.ep.controller.request.admin;

import com.topcoder.shared.dataAccess.DataAccess;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.BaseProcessor;

/**
 * @author dok
 * @version $Revision: 66662 $ Date: 2005/01/01 00:00:00
 *          Create Date: Oct 18, 2007
 */
public class ViewPendingTeachers extends BaseProcessor {
    protected void businessProcessing() throws Exception {
        //load up the professors and put them in the request
        Request r = new Request();
        r.setContentHandle("pending_teachers");
        getRequest().setAttribute("teachers", new DataAccess(DBMS.OLTP_DATASOURCE_NAME).getData(r).get("pending_teachers"));
        setNextPage("/admin/pendingTeachers.jsp");
        setIsNextPageInContext(true);

    }
}

