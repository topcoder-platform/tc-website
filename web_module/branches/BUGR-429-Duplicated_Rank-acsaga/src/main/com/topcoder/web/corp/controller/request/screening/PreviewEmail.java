package com.topcoder.web.corp.controller.request.screening;

import com.topcoder.web.common.TCWebException;
import com.topcoder.web.corp.common.Constants;
import com.topcoder.web.corp.model.EmailInfo;
import com.topcoder.web.corp.model.TestSessionInfo;
import com.topcoder.shared.util.logging.Logger;

public class PreviewEmail extends BaseSessionProcessor {
    private final static Logger log = Logger.getLogger(PreviewEmail.class);
    protected void screeningProcessing() throws TCWebException {
        EmailInfo info = null;
        try {
            log.debug(" in preview email");
            TestSessionInfo sInfo = getTestSessionInfo();

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
            log.debug("got exception " + e.getMessage() + " go with empty info");
            updateSessionInfo();
            info = new EmailInfo();
            info.setSessionInfo(getTestSessionInfo());
        }

        getRequest().setAttribute(Constants.EMAIL_INFO, info);
        log.debug("set info " + info.getMsgText());

        setNextPage(Constants.PREVIEW_EMAIL_PAGE);
        setIsNextPageInContext(true);
    }
}
