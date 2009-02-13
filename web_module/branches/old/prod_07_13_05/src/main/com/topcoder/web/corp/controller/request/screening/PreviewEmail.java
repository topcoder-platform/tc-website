package com.topcoder.web.corp.controller.request.screening;

import com.topcoder.web.common.TCWebException;
import com.topcoder.web.corp.common.Constants;
import com.topcoder.web.corp.model.EmailInfo;
import com.topcoder.web.corp.model.TestSessionInfo;

public class PreviewEmail extends BaseSessionProcessor {
    protected void screeningProcessing() throws TCWebException {
        EmailInfo info = null;
        try {
            TestSessionInfo sInfo = getSessionInfo();

            //these three values should be passed in
            sInfo.setCandidateId(getRequest().getParameter(Constants.CANDIDATE_ID));
            sInfo.setCandidateEmail(
                    getRequest().getParameter(Constants.CANDIDATE_EMAIL));
            sInfo.setRepEmail(getRequest().getParameter(Constants.REP_EMAIL));
            info =
                    EmailInfo.createEmailInfo(sInfo, getUser());
        } catch (TCWebException e) {
            throw e;
        } catch (Exception e) {
            updateSessionInfo();
            info = new EmailInfo();
            info.setSessionInfo(getSessionInfo());
        }

        getRequest().setAttribute(Constants.EMAIL_INFO, info);

        setNextPage(Constants.PREVIEW_EMAIL_PAGE);
        setIsNextPageInContext(true);
    }
}
