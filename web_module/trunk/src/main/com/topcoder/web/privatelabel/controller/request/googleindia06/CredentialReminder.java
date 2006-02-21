package com.topcoder.web.privatelabel.controller.request.googleindia06;

import com.topcoder.web.privatelabel.controller.request.BaseCredentialReminder;
import com.topcoder.web.privatelabel.Constants;

/**
 * @author dok
 * @version $Revision$ $Date$
 *          Create Date: Oct 31, 2005
 */
public class CredentialReminder extends BaseCredentialReminder {

    protected String getStartPage() {
        return Constants.GOOGLE_INDIA_06_CREDENTIALS_PAGE;
    }

    protected String getSuccessPage() {
        return Constants.GOOGLE_INDIA_06_CREDENTIALS_SENT_PAGE;
    }
}
