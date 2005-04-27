package com.topcoder.web.admin.controller.request;

import com.topcoder.web.tc.controller.request.Base;
import com.topcoder.web.common.BaseServlet;
import com.topcoder.web.common.SessionInfo;
import com.topcoder.web.common.PermissionException;
import com.topcoder.shared.security.ClassResource;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;

/**
 * @author  dok
 * @version  $Revision$ $Date$
 * Create Date: Apr 27, 2005
 */
public class TermsList extends Base {


    protected void businessProcessing() throws Exception {

        //get list all the terms of use
        if (((SessionInfo)getRequest().getAttribute(BaseServlet.SESSION_INFO_KEY)).isAdmin()) {
            Request r = new Request();
            r.setContentHandle("terms_list");
            getRequest().setAttribute("terms_list", getDataAccess().getData(r).get("terms_list"));
            setNextPage("/termsList.jsp");
            setIsNextPageInContext(true);
        } else {
            throw new PermissionException(getUser(), new ClassResource(this.getClass()));
        }

    }


}
