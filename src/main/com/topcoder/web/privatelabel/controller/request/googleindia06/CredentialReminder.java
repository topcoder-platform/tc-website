package com.topcoder.web.privatelabel.controller.request.googleindia06;

import com.topcoder.web.privatelabel.controller.request.BaseCredentialReminder;

/**
 * @author dok
 * @version $Revision$ $Date$
 *          Create Date: Oct 31, 2005
 */
public class CredentialReminder extends BaseCredentialReminder {

    protected String getStartPage() {
        return getBundle().getProperty("google_india_06_credentials_page");
    }

    protected String getSuccessPage() {
        return getBundle().getProperty("google_india_06_credentials_sent_page");
    }
}
