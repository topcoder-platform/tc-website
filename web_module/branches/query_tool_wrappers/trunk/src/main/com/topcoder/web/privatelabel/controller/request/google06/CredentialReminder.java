package com.topcoder.web.privatelabel.controller.request.google06;

import com.topcoder.web.privatelabel.Constants;
import com.topcoder.web.privatelabel.controller.request.BaseCredentialReminder;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Aug 4, 2006
 */
public class CredentialReminder extends BaseCredentialReminder {

    protected String getStartPage() {
        return Constants.GOOGLE_06_CREDENTIALS_PAGE;
    }

    protected String getSuccessPage() {
        return Constants.GOOGLE_06_CREDENTIALS_SENT_PAGE;
    }
}

