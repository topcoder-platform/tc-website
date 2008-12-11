package com.topcoder.web.privatelabel.controller.request.googleeurope06;

import com.topcoder.web.privatelabel.controller.request.BaseCredentialReminder;
import com.topcoder.web.privatelabel.Constants;

/**
 * @author dok
 * @version $Revision: 44242 $ Date: 2005/01/01 00:00:00
 *          Create Date: Apr 17, 2006
 */
public class CredentialReminder extends BaseCredentialReminder {

    protected String getStartPage() {
        return Constants.GOOGLE_EUROPE_06_CREDENTIALS_PAGE;
    }

    protected String getSuccessPage() {
        return Constants.GOOGLE_EUROPE_06_CREDENTIALS_SENT_PAGE;
    }
}

