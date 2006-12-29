package com.topcoder.web.admin.controller.request;

import com.topcoder.shared.dataAccess.Request;

/**
 * @author  cucu
 */
public class VisaLetters extends Base {
	
    protected void businessProcessing() throws Exception {

        //get list all the terms of use
        Request r = new Request();
    //    r.setContentHandle("terms_list");
      //  getRequest().setAttribute("terms_list", getDataAccess().getData(r).get("terms_list"));
        setNextPage("/visaLetters.jsp");
        setIsNextPageInContext(true);

    }


}
