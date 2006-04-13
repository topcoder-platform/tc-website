package com.topcoder.web.reg.controller.request;

import com.topcoder.web.reg.dao.RegistrationTypeDAO;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Mar 29, 2006
 */
public class Selection extends Base {

    protected void registrationProcessing() throws Exception {

        //if the user is logged in, figure out what registration types they have
        //so that the check boxes can be populated.

        getRequest().setAttribute("registrationTypeList", new RegistrationTypeDAO().getRegistrationTypes());

        setNextPage("/selection.jsp");
        setIsNextPageInContext(true);
    }

}
