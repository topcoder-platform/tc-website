package com.topcoder.web.tc.controller.request.authentication;

import com.topcoder.web.common.TCWebException;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.tc.controller.request.Base;

/**
 * Just redirecst to recoverPassword.jsp
 * 
 * @author Cucu
 *
 */
public class RecoverPassword extends Base {

    protected void businessProcessing() throws TCWebException {
        setNextPage(Constants.RECOVER_PASSWORD);
        setIsNextPageInContext(true);
    }
}
