package com.topcoder.web.screening.request;

import com.topcoder.web.screening.common.Constants;
import com.topcoder.web.screening.model.EmailInfo;

public class PreviewEmail extends BaseSessionProcessor {
    public void process() throws Exception {
        EmailInfo info = null;
        try {
            info = 
            EmailInfo.createEmailInfo(getSessionInfo(), 
                                      getAuthentication().getActiveUser());
        }
        catch(Exception e) {
            updateSessionInfo();
            info = new EmailInfo();
            info.setSessionInfo(getSessionInfo());
        }

        getRequest().setAttribute(Constants.EMAIL_INFO, info);

        setNextPage(Constants.PREVIEW_EMAIL_PAGE);
        setNextPageInContext(true);
    }
}
