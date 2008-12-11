package com.topcoder.web.privatelabel.controller.request.googleindia05;

import com.topcoder.web.privatelabel.Constants;
import com.topcoder.web.privatelabel.controller.request.BaseCredentialReminder;


/**
 * @author  dok
 * @version  $Revision: 31164 $ $Date$
 * Create Date: Jan 31, 2005
 */

public class CredentialReminder extends BaseCredentialReminder {

    protected String getStartPage() {
        return Constants.GOOGLE_INDIA_05_CREDENTIALS_PAGE;
    }

    protected String getSuccessPage() {
        return Constants.GOOGLE_INDIA_05_CREDENTIALS_SENT_PAGE;
    }
}


