package com.topcoder.web.privatelabel.controller.request.google05;

import com.topcoder.web.privatelabel.controller.request.BaseCredentialReminder;
import com.topcoder.web.privatelabel.Constants;

/**
 * @author  dok
 * @version  $Revision$ $Date$
 * Create Date: Jul 20, 2005
 */
public class CredentialReminder extends BaseCredentialReminder {

    protected String getStartPage() {
        return Constants.GOOGLE_05_CREDENTIALS_PAGE;
    }

    protected String getSuccessPage() {
        return Constants.GOOGLE_05_CREDENTIALS_SENT_PAGE;
    }
}

