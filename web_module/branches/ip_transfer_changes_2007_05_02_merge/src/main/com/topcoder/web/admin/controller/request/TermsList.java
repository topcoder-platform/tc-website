package com.topcoder.web.admin.controller.request;

import com.topcoder.shared.dataAccess.Request;

/**
 * @author  dok
 * @version  $Revision$ $Date$
 * Create Date: Apr 27, 2005
 */
public class TermsList extends Base {


    protected void businessProcessing() throws Exception {

        //get list all the terms of use
        Request r = new Request();
        r.setContentHandle("terms_list");
        getRequest().setAttribute("terms_list", getDataAccess().getData(r).get("terms_list"));
        setNextPage("/termsList.jsp");
        setIsNextPageInContext(true);

    }


}
