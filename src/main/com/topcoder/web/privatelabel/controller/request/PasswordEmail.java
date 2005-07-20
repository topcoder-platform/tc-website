package com.topcoder.web.privatelabel.controller.request;

/**
 * @author  dok
 * @version  $Revision$ $Date$
 * Create Date: Jul 20, 2005
 */
public class PasswordEmail extends BaseCredentialReminder {

    protected String getStartPage() {
        return "/recoverPassword.jsp";
    }

    protected String getSuccessPage() {
        return "/emailSent.jsp";
    }


}
