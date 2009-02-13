package com.topcoder.web.screening.request;

import com.topcoder.web.screening.common.Constants;
import com.topcoder.web.screening.model.EmailInfo;
import com.topcoder.web.screening.model.SessionInfo;

import javax.servlet.ServletRequest;

public class PreviewEmail extends BaseSessionProcessor {
    public void process() throws Exception {
        ServletRequest request = getRequest();
        EmailInfo info = null;
        try {
            SessionInfo sInfo = getSessionInfo();

            //these three values should be passed in
            sInfo.setCandidateId(request.getParameter(Constants.CANDIDATE_ID));
            sInfo.setCandidateEmail(
                    request.getParameter(Constants.CANDIDATE_EMAIL));
            sInfo.setRepEmail(request.getParameter(Constants.REP_EMAIL));
            info = 
                EmailInfo.createEmailInfo(sInfo, getAuthentication().getActiveUser());
        }
        catch(Exception e) {
            updateSessionInfo();
            info = new EmailInfo();
            info.setSessionInfo(getSessionInfo());
        }

        request.setAttribute(Constants.EMAIL_INFO, info);

        setNextPage(Constants.PREVIEW_EMAIL_PAGE);
        setNextPageInContext(true);
    }
}
