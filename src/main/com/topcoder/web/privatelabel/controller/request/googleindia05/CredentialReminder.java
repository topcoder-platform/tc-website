package com.topcoder.web.privatelabel.controller.request.googleindia05;

import com.topcoder.web.privatelabel.controller.request.BaseCredentialReminder;
import com.topcoder.web.privatelabel.Constants;


/**
 * @author  dok
 * @version  $Revision$ $Date$
 * Create Date: Jan 31, 2005
 */

public class CredentialReminder extends BaseCredentialReminder {
    public void setNextPage() {
        if (hasErrors()) {
            setNextPage(Constants.GOOGLE_INDIA_05_CREDENTIALS_PAGE);
            setIsNextPageInContext(true);
        } else{
            setNextPage(Constants.GOOGLE_INDIA_05_CREDENTIALS_SENT_PAGE);
            setIsNextPageInContext(true);
        }
    }

}


